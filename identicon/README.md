# Identicon

This project generates an identicon from some given input text.

## Example

```
iex> Identicon.main("biggianteye")
```
![Identicon generated from the string "biggianteye"](biggianteye.png)

## Approach

* Generate an MD5 checksum from the input.
* Take the first three bytes as the RGB values of the colour to use.
* Divide the bytes into chunks of three and discard the last byte.
* The identicon should have bilateral symmetry, so map the bytes onto a 3 x 5 grid and then extend the grid to 5 x 5 by vertically mirroring the existing grid.
* Filter out any grid cells that have odd bytes.
* Fill in the remaining cells with the colour chosen earlier.

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
