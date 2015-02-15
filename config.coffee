module.exports =

  NODE_ENV: "development"
  PORT: 4000
  API_URL: "http://api.are.na/v2"
  ASSET_PATH: "/assets/"
  REDIS_URL: null
  API_KEY: null

# Override any values with env variables if they exist
module.exports[key] = (process.env[key] or val) for key, val of module.exports