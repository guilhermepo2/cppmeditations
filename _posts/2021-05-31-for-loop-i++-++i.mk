---
title: Iterating on a for loop with ++i or i++?
updated: 2021-05-31 15:00
---

I see a lot of for loops at work. and sometimes they are written like `for(int i = 0; i < 10; i++)` and sometimes they are written like `for(int i = 0; i < 10; ++i)`.

And for some reason they were different in my mind. For some reason `++i` would increment at the beginning whereas `i++` would increment at the end of the loop, but upon closer inspection, the code behavior didn't reflect these assumptions I had. So I decided to do some investigation.

You may ask "How do you investigate the differences?" And the answer for that is **Assembly!**, everything has to be translated to assembly at some point, so comparing assemblies will show you the real difference between implementations.

Consider the following code:

```
for(int i = 0; i < 10; i++) { }
```

Using the Compiler Explorer [godbolt](https://godbolt.org/) we can take a look at how this is translated to assembly.

```
MyFunction():
    push    rbp
    mov     rbp, rsp
    mov     DWORD PTR [rbp-4], 0
    jmp     .L2
.L3:
    add     DWORD PTR [rbp-4], 1
.L2:
    cmp     DWORD PTR [rbp-4], 9
    jle     .L3
```

In a few words, here's what's happening: the value 0 is attributed to a memory address, and we jump to `.L2` where we compare the value with 9 (the final value for the loop), and then we have a Jump Less/Equal (JLE) to the section `.L3`.

And finally, section `.L3` adds 1 to that memory address. Well, I just described what a loop is, but let's keep going.

**What happens when I change `i++` to `++i`?**

```
MyFunction():
    push    rbp
    mov     rbp, rsp
    mov     DWORD PTR [rbp-4], 0
    jmp     .L2
.L3:
    add     DWORD PTR [rbp-4], 1
.L2:
    cmp     DWORD PTR [rbp-4], 9
    jle     .L3
```

Literally nothing!

So that was very anti-climatic and a very complicated way to say that there is no difference at all between those two things.

**But hang on!** What if we achieve this same behaviour with a while loop? Like so:

```
int i;
while(i < 10) {
    i++;
}
```

We obtain the following assembly for the above code:


```
MyFunction():
    push    rbp
    mov     rbp, rsp
    jmp     .L2
.L3:
    add     DWORD PTR [rbp-4], 1
.L2:
    cmp     DWORD PTR [rbp-4], 9
    jle     .L3
    nop
```

**It's the same!** Were you expecting something different?
