# Description:
#   Pugme is the most important thing in your life
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot pug me - Receive a pug
#   hubot pug bomb N - get N pugs

module.exports = (robot) ->

  REMOTE_URL_ENV_VAR_NAME = 'HUBOT_DELEGATE_REMOTE_URL'
  REMOTE_URL = process.env[REMOTE_URL_ENV_VAR_NAME]

  if not REMOTE_URL
    console.log "Please set #{ REMOTE_URL_ENV_VAR_NAME } to use the delegate script"


  robot.hear /.*/i, (msg) ->
    robot.http(REMOTE_URL + '?message=' + JSON.stringify msg.message)
      .get() (err, res, body) ->
        unless err
          msg.send response for response in JSON.parse(body).messages
