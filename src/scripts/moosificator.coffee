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
#   hubot moosificate (me) <url> - Moosificate the specified URL
#   hubot moosificate (me) <query> - Searches google images for the specified query and moosificates it
#
# Author:
#   alexandre.normand


module.exports = (robot) ->
  robot.respond /moosificate (me )?(.*)/i, (msg) ->
    moosificator = "http://moosificator.herokuapp.com/api/moose?image="
    mooseQuery = msg.match[2]

    if mooseQuery.match /^https?:\/\//i
      msg.send "#{moosificator}#{mooseQuery}&format=.png"
    else
      imageMe msg, mooseQuery, (url) ->
        msg.send "#{moosificator}#{url}&format=.png"

imageMe = (msg, query, cb) ->
  msg.http('http://ajax.googleapis.com/ajax/services/search/images')
    .query(v: "1.0", rsz: '8', q: query)
    .get() (err, res, body) ->
      images = JSON.parse(body)
      images = images.responseData.results
      image  = msg.random images
      cb "#{image.unescapedUrl}#.png"
