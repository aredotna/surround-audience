express = require "express"
Blocks = require "../../collections/blocks.coffee"

app = module.exports = express()
app.set "views", __dirname + "/templates"
app.set "view engine", "jade"

app.get "/", (req, res, next) ->
  blocks = new Blocks null, slug: 'surround-audience'

  blocks.fetch
    cache: true
    success: ->
      res.locals.sd.BLOCKS = blocks.toJSON()

      res.render 'index', blocks: blocks.models

    error: (model, err)->
      console.log 'error', model, err
