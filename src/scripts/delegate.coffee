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

  robot.hear /.*/i, (msg) ->
    msg.send 'hey. how bout u.'
#    robot.http("http://localhost:5000")
#      .get() (err, res, body) ->
#        unless err
#          msg.send body