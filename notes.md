# maps vs structs

structs restrict what properties you can set to those defined in the strict.
maps allow you to add any arbitrary property.

# Pipes in pattern matching

```erlang
[r, g, b | _]
```

# Pipes in struct "updates"

```erlang
%Identicon.Image{image | colour: {r, g, b}}
```

# Printed int lists shown as ascii

```erlang
iex(36)> foo
[28, 183, 89, 40, 60, 108, 237, 190, 14, 240, 56, 138, 86, 109, 195, 116]
iex(37)> Enum.chunk_every(foo, 3, 3, :discard)
[[28, 183, 89], '(<l', [237, 190, 14], [240, 56, 138], [86, 109, 195]]
```

That second token was very confusing when I saw it.

Apparently if the numbers are in the ascii range they are displayed as characters. This is for interoperability with Erlang.

https://github.com/elixir-lang/elixir/wiki/FAQ#4-why-is-my-list-of-integers-printed-as-a-string
