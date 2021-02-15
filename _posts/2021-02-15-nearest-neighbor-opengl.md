---
title: Nearest Neighbor filtering in OpenGL textures
updated: 2021-02-15 13:53
---

![Linear Filter]({{site.baseurl}}/assets/img/filter_linear.png)

```cpp
glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
```

![Nearest Neighbor Filter]({{site.baseurl}}/assets/img/filter_nearest.png)


```cpp
glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
```

Also, shoutout to Pixel Frog for making the amazing [https://pixelfrog-store.itch.io/treasure-hunters](Treasure Hunters) art assets.