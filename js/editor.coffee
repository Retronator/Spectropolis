$(document).ready ->
  localStorage.currentPolygon = "[]"
  #draw all the polygones in localStorage
  if localStorage.allPolygons
    allPolygons = JSON.parse(localStorage.allPolygons)
    allPolygons.forEach (val) ->
      newPolygon = document.createElementNS("http://www.w3.org/2000/svg",'polygon')
      document.getElementsByClassName('spectropolis__interact')[0].appendChild(newPolygon)
      points = document.createAttribute 'points'
      points.value = val.polygon.join(' ')
      newPolygon.setAttributeNode(points)
      gameId = document.createAttribute 'data-gameid'
      gameId.value = val.id
      newPolygon.setAttributeNode(gameId)
  else
    localStorage.allPolygons = "[]"

$('.spectropolis__interact').click (e) ->
  if $('[data-status]').attr('data-status') is 'readyForPolygon' or $('[data-status]').attr('data-status') is 'makingPolygon'
    $('[data-status]').attr('data-status', 'makingPolygon')
    # get coordinate of point
    polygonPointXCoordinate = e.offsetX
    polygonPointYCoordinate = e.offsetY

    # if not making a new shape, start it

    # check if we're making a polygon right now
    if JSON.parse(localStorage.currentPolygon).length is 0
      # if we're not, start the polygon
      newPolygon = document.createElementNS("http://www.w3.org/2000/svg",'polygon')
      document.getElementsByClassName('spectropolis__interact')[0].appendChild(newPolygon)
      polygon = document.getElementsByClassName('spectropolis__interact')[0].lastChild
      points = document.createAttribute 'points'
      points.value = polygonPointXCoordinate + "," + polygonPointYCoordinate
      polygon.setAttributeNode(points)

      $('.spectropolis__interact polygon').last().addClass('in-progress')

    # if we are, keep logging our changes to the polygon marked in-progress

    # track polygon points in localStorage
    currentPoints = JSON.parse(localStorage.currentPolygon)
    currentPoint = polygonPointXCoordinate + "," + polygonPointYCoordinate
    currentPoints.push(currentPoint)
    localStorage.currentPolygon = JSON.stringify(currentPoints)

    # draw the polygon as we determine its vertices
    polygonPoints = ''
    currentPoints.forEach (val, index) ->
      polygonPoints += val + ' '
    $('.in-progress').attr('points', polygonPoints)

$('.ref__finish-shape').click ->
  gameId = prompt 'gameId please'
  if gameId
    allPolygons = JSON.parse(localStorage.allPolygons)
    polygon = {}
    polygon.id = gameId
    polygon.polygon = JSON.parse(localStorage.currentPolygon)
    allPolygons.push(polygon)
    $('.in-progress').attr('data-gameid', gameId)
    console.log allPolygons
    localStorage.allPolygons = JSON.stringify(allPolygons)
    localStorage.currentPolygon = "[]"
    $('.in-progress').removeClass('in-progress')
    $('[data-status]').attr('data-status', 'idle')
  else
    $('.in-progress').remove()

$('.spectropolis__interact').mousedown (e) ->
  e.preventDefault()
  if $('[data-status]').attr('data-status') is 'drawingRectangles'

    sessionStorage.mousedown = true
    #start tracking for rectangle vertices

    # get coordinate of start point
    rectanglePointStartXCoordinate = e.offsetX
    rectanglePointStartYCoordinate = e.offsetY

    #store it in localStorage for use in mouseup
    localStorage.currentRectangle = JSON.stringify([rectanglePointStartXCoordinate, rectanglePointStartYCoordinate])

    # generate the polygon
    newPolygon = document.createElementNS("http://www.w3.org/2000/svg",'polygon')
    document.getElementsByClassName('spectropolis__interact')[0].appendChild(newPolygon)

$('.spectropolis__interact').mousemove (e) ->
  if sessionStorage.mousedown is 'true' && $('[data-status]').attr('data-status') is 'drawingRectangles'
    #start tracking for rectangle vertices

    # get coordinate of end point
    rectanglePointEndXCoordinate = e.offsetX
    rectanglePointEndYCoordinate = e.offsetY

    #retrieve the start point coordinates
    rectanglePointStartCoordinates = JSON.parse(localStorage.currentRectangle)
    rectanglePointStartXCoordinate = rectanglePointStartCoordinates[0]
    rectanglePointStartYCoordinate = rectanglePointStartCoordinates[1]

    #build out the polygon points
    rectanglePoints = rectanglePointStartXCoordinate + ',' + rectanglePointStartYCoordinate + ' ' + rectanglePointEndXCoordinate + ',' + rectanglePointStartYCoordinate + ' ' + rectanglePointEndXCoordinate + ',' + rectanglePointEndYCoordinate + ' ' + rectanglePointStartXCoordinate + ',' + rectanglePointEndYCoordinate

    #generate the polygon
    polygon = document.getElementsByClassName('spectropolis__interact')[0].lastChild
    points = document.createAttribute 'points'
    points.value = rectanglePoints
    polygon.setAttributeNode(points)

# delete
$('body').on 'click', 'svg > polygon', (e) ->
  status = document.getElementsByClassName('spectropolis__interact')[0].getAttribute('data-status');
  if status is 'idle'
    e.target.remove()
    # update the localStorage
    newPolygons = []
    $('svg > polygon').each () ->
      newPolygon = {}
      newPolygon.id = $(this).attr('data-gameid')
      newPolygon.polygon = [$(this).attr('points')]
      newPolygons.push(newPolygon)

    localStorage.allPolygons = JSON.stringify(newPolygons)

$('.spectropolis__interact').on 'mouseup', ->
    if $('[data-status]').attr('data-status') is 'drawingRectangles'
      sessionStorage.mousedown = false
      gameId = prompt 'gameId please'
      if gameId
        allPolygons = JSON.parse(localStorage.allPolygons)
        rectangle = {}
        rectangle.id = gameId
        rectangle.polygon = $('svg > polygon').last().attr('points')
        allPolygons.push([rectangle])
        localStorage.allPolygons = JSON.stringify(allPolygons)

        $('svg > polygon').last().attr('data-gameid', gameId)
      else
        $('svg > polygon').last().remove()
        localStorage.currentRectangle = "[]"

$('.ref__start-polygon').click ->
  $('[data-status]').attr('data-status', 'readyForPolygon')

$('.ref__draw-rectangles').click ->
  $('[data-status]').attr('data-status', 'drawingRectangles')

$('.ref__finish-rectangles').click ->
  $('[data-status]').attr('data-status', 'idle')
