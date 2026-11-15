# aceplay

A minimal, fast CLI wrapper to launch Ace Stream in Docker and stream directly to `mpv`.

`aceplay` streamlines the playback workflow:
1. Auto-detects Ace Stream hashes from clipboard (`wl-paste` or `xclip`).
2. Reuses an already running Ace Stream container or starts it with sub-second polling.
3. Opens the stream in `mpv` with hardware acceleration, seekable cache, and buffer tuning.
4. Shuts down the container in the background when `mpv` exits or on `Ctrl+C` for an instant terminal return.

## Prerequisites

- **Tools**: `docker`, `mpv`, `curl` (optional: `wl-clipboard` for Wayland or `xclip` for X11)
- **Container**: Create the Ace Stream Docker container once:

```bash
docker create --name acestream --net=host wafy80/acestream
```

Ensure your user is in the `docker` group or the Docker daemon is accessible:

```bash
sudo systemctl enable --now docker.socket
```

## Install

```bash
git clone https://github.com/m1tyarch/aceplay.git
cd aceplay
sudo make install
```

To uninstall:

```bash
sudo make uninstall
```

## Usage

```bash
# Auto-detect hash from clipboard (copy link/hash and run)
aceplay

# Pass stream hash directly
aceplay 0123456789abcdef0123456789abcdef01234567

# Or pass full URI
aceplay acestream://0123456789abcdef0123456789abcdef01234567
```

If no argument is given and no valid hash is in the clipboard, `aceplay` prompts interactively.

## Features

- **Clipboard Auto-detection**: Automatically picks up 40-character hashes from Wayland (`wl-paste`) or X11 (`xclip`).
- **Instant Terminal Return**: Container shutdown is handled asynchronously in the background.
- **Fast Startup**: Polls the API every 100ms instead of fixed multi-second delays.
- **Live Seeking**: `--force-seekable=yes` allows rewinding live streams within the 200MB buffer cache.

## Configuration

Optional environment variables:

| Variable | Default | Description |
| :--- | :--- | :--- |
| `ACESTREAM_CONTAINER` | `acestream` | Name of the Docker container |
| `ACESTREAM_PORT` | `6878` | Local HTTP API port |

## Disclaimer

This project is a technical automation tool for local media playback. It does not host, index, link, or distribute any streams or copyrighted material. Users are solely responsible for the content they choose to access.

## License

MIT. See [LICENSE](LICENSE).
