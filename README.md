# sha256

A simple `sha256sum` command in Go.
(similar, but made as simple as possible and written in Go)

Inspired by the ["Example (File)"](https://pkg.go.dev/crypto/sha256#example-New-File) in the `crypto/sha256` package.

## Installation

### GitHub Releases

[Download](https://github.com/WaterLemons2k/sha256/releases)

### `go install`

```sh
go install github.com/WaterLemons2k/sha256@latest
```

## Usage

```
sha256 [file]
```

## Example

```sh
$ echo 'hello' >file
$ sha256 file
2cf24dba5fb0a30e26e83b2ac5b9e29e1b161e5c1fa7425e73043362938b9824
```

## License

Most of the code in this repository is taken from the Go standard library,
which is licensed by the Go Authors.

See the [LICENSE](LICENSE) file for details.
