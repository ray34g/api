# Description:
#   Read resource files and manage guides.
#

fs = require 'fs'
sysPath = require 'path'

module.exports = (robot) ->

    robot.hear /file.*((\d|\w){1-5})/i, (msg) ->
        envelope = {}
        doc_index = msg.match[1]
        text = read_documnt doc_index

        robot.send envelope, text

read_document = (doc_index) ->
    FILE_PATH = docPath.join(__dirname, '../api/incident/docs/', doc_index + '.md')
    try
        text = fs.readFileSync FILE_PATH, 'utf8'
    catch error
       console.error("Unable to read file", error) unless error.code is 'ENOENT'

read_step = (step_index) ->
    FILE_PATH = docPath.join(__dirname, '../api/incident/steps/', step_index + '.json')
    try
        json = fs.readFileSync FILE_PATH, 'utf8'
        JSON.parse(json)
    catch error
       console.error("Unable to read file", error) unless error.code is 'ENOENT'


### feature for development.

write_document = () ->
    return

save_step + () ->

###
