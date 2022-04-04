# Docker container with poetry + pyinstaller.

For easy packaging off python projects.

## USAGE
```bash
docker run -v "$(pwd):/src/" sjobjrn/poetry-pyinstaller "pyinstaller script.py"
```

```bash
docker run -v "$(pwd):/src/" sjobjrn/poetry-pyinstaller "pyinstaller --onefile script.py"
```


# License

MIT
