Backbone = require 'backbone'
sd = require("sharify").data
_ = require 'underscore'

module.exports = class Block extends Backbone.Model

  url: -> "#{sd.API_URL}/blocks/#{@id}"

  href: -> "/block/#{@id}"

  resizeImage: (width = 330, height = 330, source = 'display')->
    # ignore gifs
    if @getImageSize('display').split('.').pop() == 'gif'
      @getImageSize('display')
    else
      "http://images.are.na/resize/#{width}/#{height}/#{encodeURIComponent(@getImageSize(source))}"

  getImageSize: (size) ->
    if @has('image')
      @get('image')?[size]?.url
