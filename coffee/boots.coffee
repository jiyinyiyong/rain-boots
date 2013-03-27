
fs = require "fs"
path = require "path"
tools = require "./tools"

try require "coffee-script"

home = process.env.HOME
config_coffee = "#{home}/.config/rain-boots.coffee"
config_js = "#{home}/.config/rain-boots.js"
config_json = "#{home}/.config/rain-boots.json"

exports.configs = configs = 
  if fs.existsSync config_coffee then (require config_coffee).configs
  else if fs.existsSync config_js then (require config_js).configs
  else if fs.existsSync config_json then require config_json
  else {}

exports.boots = boots = (options) ->
  for program, all of options
    for name, configs of all
      if configs.inputdir? and (not configs.children?)
        children = tools.recurse configs.inputdir
        if configs.fileFilter?
          children = children.filter (filename) ->
            filename.match configs.fileFilter
        all.children = children
  options

boots.package = require "../package.json"

boots[name] = handler for name, handler of tools