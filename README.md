# Buzzouce API server

Run it with:

``` ruby
bundle exec ruby app.rb -p 4568 -o 0.0.0.0
```

## Some other services are needed:

Redis and Slanger are used for WebSocket connection.

WARNING: as of today (19th july 2017), Slanger cannot run on Ruby 2.4, run it with Ruby 2.3.
As it is standalone, run Slanger from another directory than this API server.

```
gem install slanger
slanger --app_key buzzouce --secret endive --verbose
```

Slanger API runs on port 4567 and the WebSocket server runs on port 8080.
To change the API server hostname, use the --api_host option (default: 0.0.0.0:4567)
To change the WebSocket server hostname, use the --websocket_host option (default: 0.0.0.0:8080)
