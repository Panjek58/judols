# Docker Deployment Instructions

## Prerequisites

- Docker installed on your system
- Docker Compose installed (usually comes with Docker Desktop)

## Quick Start

### Using Docker Compose (Recommended)

```bash
# Build and start the application
docker-compose up -d

# View logs
docker-compose logs -f

# Stop the application
docker-compose down
```

### Using Docker directly

```bash
# Build the image
docker build -t opensourcecasino .

# Run the container
docker run -d -p 8080:80 --name opensourcecasino-app opensourcecasino

# View logs
docker logs -f opensourcecasino-app

# Stop and remove the container
docker stop opensourcecasino-app
docker rm opensourcecasino-app
```

## Access the Application

Once running, access your application at: http://localhost:8080

## Docker Configuration Details

### Dockerfile

The Dockerfile uses a multi-stage build:

1. **Build Stage**: Uses Node.js to build the Vue.js application
2. **Production Stage**: Uses Nginx Alpine to serve the built application

### nginx.conf

Custom Nginx configuration includes:

- Client-side routing support (SPA)
- Static asset caching
- Security headers
- Gzip compression

### docker-compose.yml

Defines the service configuration:

- Maps port 8080 on host to port 80 in container
- Sets up a custom network
- Configures restart policy

## Environment Variables

You can add environment variables to the docker-compose.yml file under the `environment` section if needed.

## Production Deployment

For production deployment, consider:

1. Using a reverse proxy (like Traefik or Nginx Proxy Manager)
2. Setting up SSL/TLS certificates
3. Configuring proper logging
4. Setting up monitoring and health checks
5. Using Docker Swarm or Kubernetes for orchestration

## Troubleshooting

- Check container logs: `docker-compose logs`
- Verify container is running: `docker-compose ps`
- Rebuild after changes: `docker-compose up --build`
