uri = URI.parse(ENV['REDISTOGO_URL'])

Cache.redis = Redis.new(host: uri.host, port: uri.port, password: uri.password)
