# Kana

A hiragana and katakana cheat sheet printer.

<p align="center">
  <img src="https://user-images.githubusercontent.com/33803413/125096901-dc15bc80-e0d5-11eb-83e4-2dde440f5fc1.png" />
</p>

## Usage
```sh
kana.sh [-h] [-t charsets-list] [-o table-names-list]
```

`charsets-list` is a comma-separated list of types of character sets. Possible values are: `hiragana` and `katakana`.
`table-names-list` is a comma-separated list of table names. Possible values are: `gojuon`, `dakuon`, `handakuon`, `yoon`, and `sokuon`.

### Options

Option | Meaning |
--- | ---
`-h`, `--help` | Show help message and exit.
`-t charsets-list` | Specify character set.
`-o table-names-list` | Specify table.

## License

[MIT](https://github.com/wadiim/hi/blob/master/LICENSE)
