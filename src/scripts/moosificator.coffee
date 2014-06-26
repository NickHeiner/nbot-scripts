# Description:
#   Because Moose are not just animals. 
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot moosificate (me) url - Moosificates your face. 
#
# Author:
#   alexandre.normand


module.exports = (robot) ->
  robot.respond /moosificate (me )?(.*)/i, (msg) ->
      msg.send "http://moosificator.herokuapp.com/api/moose?image=#{ msg.match[2] }"
