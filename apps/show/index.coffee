express = require "express"
Block = require "../../models/block.coffee"

app = module.exports = express()
app.set "views", __dirname + "/templates"
app.set "view engine", "jade"

app.get "/block/:id", (req, res, next) ->
  block = new Block id: req.params.id

  block.fetch
    cache: true
    success: ->
      res.locals.sd.BLOCK = block.toJSON()

      res.render 'show', block: block
    error: (model, err)->
      console.log 'error block fetch', model, err

