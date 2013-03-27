
path = require "path"
fs = require "fs"

exports.recurse = recurse = (path_name) ->
  children = []
  (fs.readdirSync path_name).forEach (child_name) ->
    child_path = path.join path_name, child_name
    if fs.statSync(child_path).isDirectory()
      (recurse child_path).forEach (a_path) ->
        children.push a_path
    else
      children.push child_path
  children

exports.write = (filename, content) ->
  fs.writeFileSync filename, content, "utf8"
exports.read = (filename) ->
  fs.readFileSync filename, "uf8"

exports.log = console.log