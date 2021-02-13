---
title: Addition in Assembly?!
updated: 2021-02-13 10:12
---


```cpp
int Add(int a, int b) {
    return a + b;
}
```

```asm
Add(int, int):
    push    %rbp
    mov     %rbp, %rsp
    mov     DWORD PTR [%rbp-4], %edi
    mov     DWORD PTR [%rbp-8], %esi
    mov     %eax, DWORD PTR [%rbp-8]
    add     %eax, DWORD PTR [%rbp-4]
    leave
    ret
```

Optimized
```asm
Add(int, int):
    lea     %eax, [%rdi+%rsi]
    ret
```