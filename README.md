Dotfiles
========

Personal configuration files managed with [chezmoi](https://www.chezmoi.io/).

Configuration
-------------


```yaml
data:
  font:
    name: Consolas
    size: 12
  git:
    mail: user@example.com
    user: user
  terminal:
    size:
      height: 43
      width: 132
```

### Windows

```shell
%USERPROFILE%/.config/chezmoi/chezmoi.yaml
```

### Linux

```shell
~/.config/chezmoi/chezmoi.yaml
```

Overrides
---------

### Alacritty

Create `~/.config/alacritty/local.yml` with the following contents to use WSL.

```yaml
shell:
  program: "C:\\Windows\\System32\\wsl.exe --cd ~ --distribution <name>"
```
