# api-exemplo

## Build docker image
```bash
docker build -t [name of registry]/[name of app] .
```

## Run docker container
```bash
docker run -p 8080:8080 [name of registry]/[name of app]:[version]
```