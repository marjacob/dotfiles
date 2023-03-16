Sublime Text
============

Headless usage
--------------

Refer to [this post][sf0] for more information.

### Enable command logging in the console

Use this to discover commands for `subl --command`.

```py
sublime.log_commands(True)
```

### Install Package Control

```sh
subl --command "install_package_control"
```

### Install packages

Install all packages specified in `Package Control.sublime-settings`.

```sh
subl --command "upgrade_all_packages"
```

[sf0]: https://forum.sublimetext.com/t/64029/4
