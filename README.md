# docker-healthy

A simple web UI to make sure all of your local Docker containers are healthy.

### Usage

```
docker build -t docker-healthy .
docker run -p 9292:9292 -v /var/run/docker.sock:/var/run/docker.sock
docker-healthy
```

Provides two interfaces for data collection:

- `GET /`: Web UI
- `GET /api`: Simple JSON API, sample payload below:

```json
{
  "services": [
    {
      "name":"docker-healthy"
      "status":"Up About a minute (healthy)"
    }
  ]
}
```


### License

The project is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
