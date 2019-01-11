# maps vs structs

structs restrict what properties you can set to those defined in the strict.
maps allow you to add any arbitrary property.

# Pipes in pattern matching

```
[r, g, b | _]
```

# Pipes in struct "updates"

```
%Identicon.Image{image | colour: {r, g, b}}
```
