# Setup FabOS Service Lifecycle Management

Compose files of the stack can be found in the sub-directory `compose`.

Get latest version via Git:
```sh
mkdir fabos-slm-setup && \
cd fabos-slm-setup && \
git init && \
git remote add -f origin git@github.com:FabOS-AI/fabos-slm-setup.git && \
git sparse-checkout set compose && \
git pull origin main && \
cd compose
```

## Start

Set in file `compose/.env` the variable `SLM_HOSTNAME` to the hostname of the host where the stack will be started. E.g.:
```
SLM_HOSTNAME=myhost.local
```

Start the whole stack:
```
docker-compose up -d
```

## Remove stack
Start the whole docker compose stack:
```
docker-compose down --volumes --remove-orphans
```

## Build
```
docker-compose -f build.yml -f docker-compose.yml build --no-cache awx-fixed-files
docker-compose -f build.yml -f config-exporter.yml -f docker-compose.yml build --no-cache
```

## Export configuration


Wait until the stack is fully started and all init containers have stopped. Then run the config exporter container:
```
docker-compose -f config-exporter.yml -f docker-compose.yml up --force-recreate config-exporter
```

It will generate by default a  sub-directory `config/_conf_generated`relative to your docker-compose.yml file containing 
the configuration of the setup stack. If you want another target directory edit in file `compose/config-exporter.yml` 
the host path of this volume:
```
- ./config:/project
```

## Local Development

### Edit compose file

Edit in file `compose/config-exporter.yml` the volume path and environment as described below.

#### Volume path
Edit the host path of this volume
```
- {{ /path/to/core/project/on/your/computer }}:/project
```
to the path of core project on your local computer. If you are using Docker Desktop for Windows add the above path 
in `Settings -> Resources -> FILE SHARING`

#### Environment
Set the environment variable `CONFIGURE_CORE_PROJECT` to `true`:
```
- CONFIGURE_CORE_PROJECT=true
```

### Run config exporter
Wait until the stack is fully started and all init containers have stopped. Then run the config exporter container, 
which will override the configuration files in your core project (not yet public available):
```
docker-compose -f config-exporter.yml -f docker-compose.yml up --force-recreate config-exporter
```

### Rebuild and start stack
```
docker-compose down --volumes --remove-orphans && docker-compose -f build.yml -f dev-helper.yml -f docker-compose.yml build --no-cache && docker-compose up -d
```
