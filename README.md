# slskd Web UI

A customized web UI for [slskd](https://github.com/slskd/slskd), the modern client-server application for the Soulseek file-sharing network. This is a partial fork of the upstream slskd repository, focused on the frontend only.

The UI runs as a standalone React app and connects to any slskd instance you specify—useful when you want a custom interface or to host the UI separately from the slskd server.

## Configuration

Point the UI at your slskd instance using **`REACT_APP_SLSKD_SERVER_URL`**. The value should be the base URL of your slskd server (including protocol, no trailing slash).

The app uses this URL for both the REST API (`/api/v0`) and the SignalR hub (`/hub`).

## How to run

### Development (npm)

```bash
npm install
REACT_APP_SLSKD_SERVER_URL=http://localhost:5030 npm start
```

Opens the app at [http://localhost:3000](http://localhost:3000). If you omit the env var, it defaults to `http://localhost:5030` in development.

### Build (static)

```bash
npm run build
```

Produces a static build in `build/`. Serve it with any static file server. Set **`REACT_APP_SLSKD_SERVER_URL`** in the environment when you run `npm run build` so the slskd URL is baked into the bundle. For different backends, rebuild with a different value per target.

### Docker

Build and run the container; the UI is injected with your slskd URL at **runtime** via `REACT_APP_SLSKD_SERVER_URL`.

**Using docker run:**

```bash
docker build -t slskd-ui .
docker run -d -p 3000:3000 -e REACT_APP_SLSKD_SERVER_URL=http://localhost:5030 --name slskd-ui slskd-ui
```

Then open [http://localhost:3000](http://localhost:3000).

**Using Docker Compose:**

Create a `docker-compose.yml`:

```yaml
services:
  slskd-ui:
    build: .
    ports:
      - "3000:3000"
    environment:
      REACT_APP_SLSKD_SERVER_URL: https://slskd.example.com  # your slskd instance
    restart: unless-stopped
```

Then:

```bash
docker compose up -d
```

Open [http://localhost:3000](http://localhost:3000). The UI will use the URL set in `REACT_APP_SLSKD_SERVER_URL`.

## Upstream

Based on [slskd/slskd](https://github.com/slskd/slskd). slskd is a modern client-server application for the Soulseek network; see the [upstream repo](https://github.com/slskd/slskd) and [slskd.org](https://slskd.org) for features, Docker setup, and configuration.
