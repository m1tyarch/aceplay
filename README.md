# aceplay

A minimal CLI wrapper to launch Ace Stream in Docker and stream directly to `mpv`.

`aceplay` automates the playback workflow:
1. Starts the Ace Stream Docker container.
2. Polls the engine API until it is ready.
3. Opens the stream in `mpv` with hardware acceleration and buffering presets.
4. Automatically shuts down the container when `mpv` exits or on `Ctrl+C`.

## Prerequisites

- **Tools**: `docker`, `mpv`, `curl`
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
# Pass stream hash directly
aceplay 0123456789abcdef0123456789abcdef01234567

# Or with URI prefix
aceplay acestream://0123456789abcdef0123456789abcdef01234567

# Or run interactively to be prompted
aceplay
```

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
