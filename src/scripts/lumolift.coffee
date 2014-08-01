# Description:
#   Improve employee ergonomic health
#
# Dependencies:
#   None
#
# Configuration:
#   HUBOT_LUMOLIFT_ACTIVE_ROOMS - list of room ID's in which to activate this script (e.g., "12345,23456")
#
# Commands:
#   None
#
# Author:
#   ben.packer

# Send the message with probability 1/frequency
frequency = 100

module.exports = (robot) ->
  robot.hear /./, (msg) ->
    if msg.message.room in process.env.HUBOT_LUMOLIFT_ACTIVE_ROOMS.split(',').map(Number) and Math.floor(Math.random()*frequency)==0
       msg.send "LUMOLIFT!"
