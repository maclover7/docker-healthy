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
      "name":"docker-healthy",
      "status":"Up About a minute (healthy)"
    }
  ]
}
```

There is also an option to enable basic authentication. If you wish to
enable this feature, please define the following following environment
variables:

`BASIC_AUTH`: set to `enabled`
`BASIC_AUTH_USERNAME`: set to user's username
`BASIC_AUTH_PASSWORD`: set to user's password

### License

The project is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
