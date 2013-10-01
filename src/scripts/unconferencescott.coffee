# Description:
#   Displays and/or generates images for the popular Unconference Scott meme
#
# Dependencies:
#   None
#
# Configuration:
#   HUBOT_MEMEGENERATOR_USERNAME -- Username on MemeGenerator.net
#   HUBOT_MEMEGENERATOR_PASSWORD -- Password for account on MemeGenerator.net
#
# Commands:
#   unconference scott me <something>, <something else> - Generates a unconference scott meme
#
# Notes:
#   None
#
# Author:
#   alexandre-normand

module.exports = (robot) ->
  robot.hear /unconference scott (.*), (.*)/i, (msg) ->
    generateMeme msg, 2337028, 9365330, "#{ msg.match[1] }", "#{ msg.match[2] }"

generateMeme = (msg, generatorID, imageID, msg1, msg2) ->
  if not process.env.HUBOT_MEMEGENERATOR_USERNAME
    msg.send "Error: You must specify your MemeGenerator.net username"
  if not process.env.HUBOT_MEMEGENERATOR_PASSWORD
    msg.send "Error: You must specify your MemeGenerator.net pasword"
  if not (process.env.HUBOT_MEMEGENERATOR_USERNAME and process.env.HUBOT_MEMEGENERATOR_PASSWORD)
    return
  url = "http://version1.api.memegenerator.net/Instance_Create?username=#{ process.env.HUBOT_MEMEGENERATOR_USERNAME }&password=#{ process.env.HUBOT_MEMEGENERATOR_PASSWORD }&languageCode=en&generatorID=#{ generatorID }&imageID=#{ imageID }&text0=#{ encodeURIComponent(msg1) }&text1=#{ encodeURIComponent(msg2) }"
  msg.http(url).get() (err, res, body) ->
    resp = JSON.parse(body)
    msg.send resp.result.instanceImageUrl
