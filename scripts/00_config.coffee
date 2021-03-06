# Description:
#     init config and lists
#

fs = require 'fs'
sysPath = require 'path'

config = {}

module.exports = (robot) ->
  
    load_config

    robot.hear /.*/, (msg) ->
        if ['ray34g', ''].indexOf msg.envelope.user.name isnt -1
            return
        if /bot$/.test msg.envelope.user.name
            msg.finish()

load_config = (filename = "config.json") ->
    config = read_json filename

read_json = (filename) ->
    FILE_PATH = sysPath.join(__dirname, '../api/incident/steps/' + filename)
    try
        json = fs.readFileSync FILE_PATH, 'utf8'
        JSON.parse(json)
    catch error
        console.error("Unable to read file", error) unless error.code is 'ENOENT'
