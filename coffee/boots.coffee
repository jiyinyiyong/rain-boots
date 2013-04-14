
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

exports.erase_path = erase_path = (path_name) ->
  if fs.existsSync path_name
    status = fs.statSync path_name
    if status.isDirectory()
      file_list = fs.readdirSync path_name
      file_list.forEach (file_name) ->
        file_path = path.join path_name, file_name
        erase_path file_path
      fs.rmdirSync path_name
    else
      erase_file path_name
  else
    console.log "no path named", path_name

exports.erase_file = erase_file = (file_name) ->
  if fs.existsSync file_name
    fs.unlinkSync file_name
  else
    console.log "no file named", file_name

exports.watch = require("chokidar").watch