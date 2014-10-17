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
#   hubot moosificanimate (me) <query> - Search google images for a gif for the specified query and moosificates it
#   hubot moosificate_<name> (me) <url> - Moosificate the specified URL with the named moose
#   hubot moosificate_<name> (me) <query> - Searches google images for the specified query and moosificates it with the named moose
#   hubot antlerificate (me) <url> - Antlerificate the specified URL
#   hubot antlerificate (me) <query> - Searches google images for the specified query and antlerificates it
#
# Author:
#   alexandre.normand


module.exports = (robot) ->
  robot.respond /(moosificate(?:_(\w+))?|antlerificate|moosificanimate) (me )?(.*)/i, (msg) ->
    keyword = msg.match[1]
    mooseName = msg.match[2]
    mooseQuery = msg.match[4]
    animated = false

    if keyword.match /^moosificate/i
      command = "moose"
      if mooseName?
        command += "/#{moosename}"
    else if keyword.match /^antlerificate/i
      command = "antler"
    else if keyword.match /^moosificanimate/i
      command = "moose"
      query = query + " face"
      animated = true

    moosificator = "http://moosificator.herokuapp.com/api/#{command}?image="

    if mooseQuery.match /^https?:\/\//i
      msg.send "#{moosificator}#{mooseQuery}&format=.png"
    else
      imageMe msg, mooseQuery, animated, (url) ->
        msg.send "#{moosificator}#{url}"

imageMe = (msg, query, animated, cb) ->
  q = v: '1.0', rsz: '8', q: query, safe: 'active'
  q.imgtype = 'animated' if animated is true
  q.imgtype = 'face' if animated is false
  
  msg.http('http://ajax.googleapis.com/ajax/services/search/images')
    .query(q)
    .get() (err, res, body) ->
      images = JSON.parse(body)
      images = images.responseData.results
      image  = msg.random images
      cb "#{image.unescapedUrl}#.png"
