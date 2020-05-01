# Hi

A hiragana and katakana cheat sheet printer

![](https://user-images.githubusercontent.com/33803413/80825054-ef7aed00-8bdf-11ea-946d-896c0687b73b.png)

## Usage
```sh
hi.sh [-h] [-t charsets-list] [-o table-names-list]
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
