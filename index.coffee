{ PORT } = require "./config"
express = require "express"
setup = require "./lib/setup"
cache = require './lib/cache'

app = module.exports = express()

cache.setup ->
  setup app

  app.listen PORT, ->
    console.log "Listening on port " + PORT
    process.send? "listening"