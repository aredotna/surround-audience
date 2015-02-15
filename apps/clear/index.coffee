express = require 'express'
{ flushall } = require '../../lib/cache'
auth = require '../../lib/auth'

app = module.exports = express()
app.set 'views', __dirname
app.set 'view engine', 'jade'

app.get '/clear-cache', auth, get = (req, res) ->
  res.render 'index'
app.post '/clear-cache', auth, post = (req, res, next) ->
  flushall -> res.redirect '/'