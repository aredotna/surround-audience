_ = require 'underscore'
Backbone = require "backbone"
sd = require("sharify").data
Block = require "../models/block.coffee"

module.exports = class Blocks extends Backbone.Collection
  model: Block

  url: -> "#{sd.API_URL}/channels/#{@slug}/contents"

  parse: (data)-> data.contents

  initialize: (models, options) ->
    @slug = options?.slug
    super
