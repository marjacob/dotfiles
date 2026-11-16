Audio
-----

Configured in [`audio.conf`](config.d/audio.conf).

### Requirements

```shell
xbps-install -Su pamixer wob
```

Bar
---

Configured in [`status.conf`](config.d/status.conf).

### Requirements

```shell
xbps-install -Su nerd-fonts-symbols-ttf Waybar
```

Displays
--------

Configured in [`kanshi.conf`](config.d/kanshi.conf) with layouts in
[`kanshi/config`](../kanshi/config). Profiles for one machine go in
`~/.config/kanshi/config.d/*.conf` and are not managed by chezmoi.

### Requirements

```shell
xbps-install -Su kanshi
```

Idle
----

Configured in [`idle.conf`](config.d/idle.conf).

### Requirements

```shell
xbps-install -Su swayidle
```

Launcher
--------

Configured in [`config`](config).

### Requirements

```shell
xbps-install -Su fuzzel
```

Lid
---

Configured in [`lid.conf`](config.d/lid.conf) and [`lid`](scripts/lid). Closing
the lid turns the internal display off only while an external display is
connected.

### Requirements

```shell
xbps-install -Su jq
```

Lock screen
-----------

Configured in [`lock`](scripts/lock).

### Requirements

```shell
xbps-install -Su ffmpeg grim jq swaylock
```

Media
-----

Configured in [`media.conf`](config.d/media.conf). `$mod+p` plays or pauses and
`$mod+[` and `$mod+]` skip back and forward. The bar shows the player too. On
Void mpv loads the plugin through a link in `~/.config/mpv/scripts` because the
package does not install it where mpv looks.

### Requirements

```shell
xbps-install -Su mpv-mpris playerctl
```

Notifications
-------------

Configured in [`mako.conf`](config.d/mako.conf).

### Requirements

```shell
xbps-install -Su mako
```

PipeWire
--------

Configured in [`pipewire.conf`](config.d/pipewire.conf). PipeWire starts
WirePlumber and its PulseAudio server by itself once these links exist.

### Requirements

```shell
xbps-install -Su pipewire wireplumber
mkdir -p /etc/pipewire/pipewire.conf.d
ln -s /usr/share/examples/wireplumber/10-wireplumber.conf \
  /etc/pipewire/pipewire.conf.d/
ln -s /usr/share/examples/pipewire/20-pipewire-pulse.conf \
  /etc/pipewire/pipewire.conf.d/
```

Terminal
--------

Configured in [`config`](config).

### Requirements

```shell
xbps-install -Su foot
```
