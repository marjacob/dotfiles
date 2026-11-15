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
xbps-install -Su Waybar
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

Lock screen
-----------

Configured in [`lock`](scripts/lock).

### Requirements

```shell
xbps-install -Su ffmpeg grim jq swaylock
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
