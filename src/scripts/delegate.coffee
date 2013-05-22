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

REMOTE_URL = 'http://nbot-python.herokuapp.com/'

module.exports = (robot) ->

  robot.hear /.*/i, (msg) ->
    robot.http(REMOTE_URL + '?message=' + JSON.stringify msg.message)
      .get() (err, res, body) ->
        unless err
          msg.send body