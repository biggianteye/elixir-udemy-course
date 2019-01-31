# Identicon

This project generates an identicon from some given input text.

## Example

```
iex> Identicon.main("biggianteye")
```
![Identicon generated from the string "biggianteye"](biggianteye.png)

## Topics covered

* Piping functions
* Structs
* `Enum.chunk_every`
* `Enum.each`
* `Enum.filter`
* `Enum.map`
* Function references via the capture operator (`&`)
* Pattern matching with function parameters
* Partial pattern matching using a pipe
* The [`egd`](http://www1.erlang.org/doc/man/egd.html) library
