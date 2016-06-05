$(document).ready(function() {
  var allPolygons;
  localStorage.currentPolygon = "[]";
  if (localStorage.allPolygons) {
    allPolygons = JSON.parse(localStorage.allPolygons);
    return allPolygons.forEach(function(val) {
      var gameId, newPolygon, points;
      newPolygon = document.createElementNS("http://www.w3.org/2000/svg", 'polygon');
      document.getElementsByClassName('spectropolis__interact')[0].appendChild(newPolygon);
      points = document.createAttribute('points');
      points.value = val.polygon.join(' ');
      newPolygon.setAttributeNode(points);
      gameId = document.createAttribute('data-gameid');
      gameId.value = val.id;
      return newPolygon.setAttributeNode(gameId);
    });
  } else {
    return localStorage.allPolygons = "[]";
  }
});

$('.spectropolis__interact').click(function(e) {
  var currentPoint, currentPoints, newPolygon, points, polygon, polygonPointXCoordinate, polygonPointYCoordinate, polygonPoints;
  if ($('[data-status]').attr('data-status') === 'readyForPolygon' || $('[data-status]').attr('data-status') === 'makingPolygon') {
    $('[data-status]').attr('data-status', 'makingPolygon');
    polygonPointXCoordinate = e.offsetX;
    polygonPointYCoordinate = e.offsetY;
    if (JSON.parse(localStorage.currentPolygon).length === 0) {
      newPolygon = document.createElementNS("http://www.w3.org/2000/svg", 'polygon');
      document.getElementsByClassName('spectropolis__interact')[0].appendChild(newPolygon);
      polygon = document.getElementsByClassName('spectropolis__interact')[0].lastChild;
      points = document.createAttribute('points');
      points.value = polygonPointXCoordinate + "," + polygonPointYCoordinate;
      polygon.setAttributeNode(points);
      $('.spectropolis__interact polygon').last().addClass('in-progress');
    }
    currentPoints = JSON.parse(localStorage.currentPolygon);
    currentPoint = polygonPointXCoordinate + "," + polygonPointYCoordinate;
    currentPoints.push(currentPoint);
    localStorage.currentPolygon = JSON.stringify(currentPoints);
    polygonPoints = '';
    currentPoints.forEach(function(val, index) {
      return polygonPoints += val + ' ';
    });
    return $('.in-progress').attr('points', polygonPoints);
  }
});

$('.ref__finish-shape').click(function() {
  var allPolygons, gameId, polygon;
  gameId = prompt('gameId please');
  if (gameId) {
    allPolygons = JSON.parse(localStorage.allPolygons);
    polygon = {};
    polygon.id = gameId;
    polygon.polygon = JSON.parse(localStorage.currentPolygon);
    allPolygons.push(polygon);
    $('.in-progress').attr('data-gameid', gameId);
    console.log(allPolygons);
    localStorage.allPolygons = JSON.stringify(allPolygons);
    localStorage.currentPolygon = "[]";
    $('.in-progress').removeClass('in-progress');
    return $('[data-status]').attr('data-status', 'idle');
  } else {
    return $('.in-progress').remove();
  }
});

$('.spectropolis__interact').mousedown(function(e) {
  var newPolygon, rectanglePointStartXCoordinate, rectanglePointStartYCoordinate;
  e.preventDefault();
  if ($('[data-status]').attr('data-status') === 'drawingRectangles') {
    sessionStorage.mousedown = true;
    rectanglePointStartXCoordinate = e.offsetX;
    rectanglePointStartYCoordinate = e.offsetY;
    localStorage.currentRectangle = JSON.stringify([rectanglePointStartXCoordinate, rectanglePointStartYCoordinate]);
    newPolygon = document.createElementNS("http://www.w3.org/2000/svg", 'polygon');
    return document.getElementsByClassName('spectropolis__interact')[0].appendChild(newPolygon);
  }
});

$('.spectropolis__interact').mousemove(function(e) {
  var points, polygon, rectanglePointEndXCoordinate, rectanglePointEndYCoordinate, rectanglePointStartCoordinates, rectanglePointStartXCoordinate, rectanglePointStartYCoordinate, rectanglePoints;
  if (sessionStorage.mousedown === 'true' && $('[data-status]').attr('data-status') === 'drawingRectangles') {
    rectanglePointEndXCoordinate = e.offsetX;
    rectanglePointEndYCoordinate = e.offsetY;
    rectanglePointStartCoordinates = JSON.parse(localStorage.currentRectangle);
    rectanglePointStartXCoordinate = rectanglePointStartCoordinates[0];
    rectanglePointStartYCoordinate = rectanglePointStartCoordinates[1];
    rectanglePoints = rectanglePointStartXCoordinate + ',' + rectanglePointStartYCoordinate + ' ' + rectanglePointEndXCoordinate + ',' + rectanglePointStartYCoordinate + ' ' + rectanglePointEndXCoordinate + ',' + rectanglePointEndYCoordinate + ' ' + rectanglePointStartXCoordinate + ',' + rectanglePointEndYCoordinate;
    polygon = document.getElementsByClassName('spectropolis__interact')[0].lastChild;
    points = document.createAttribute('points');
    points.value = rectanglePoints;
    return polygon.setAttributeNode(points);
  }
});

$('body').on('click', 'svg > polygon', function(e) {
  var newPolygons, status;
  status = document.getElementsByClassName('spectropolis__interact')[0].getAttribute('data-status');
  if (status === 'idle') {
    e.target.remove();
    newPolygons = [];
    $('svg > polygon').each(function() {
      var newPolygon;
      newPolygon = {};
      newPolygon.id = $(this).attr('data-gameid');
      newPolygon.polygon = [$(this).attr('points')];
      return newPolygons.push(newPolygon);
    });
    return localStorage.allPolygons = JSON.stringify(newPolygons);
  }
});

$('.spectropolis__interact').on('mouseup', function() {
  var allPolygons, gameId, rectangle;
  if ($('[data-status]').attr('data-status') === 'drawingRectangles') {
    sessionStorage.mousedown = false;
    gameId = prompt('gameId please');
    if (gameId) {
      allPolygons = JSON.parse(localStorage.allPolygons);
      rectangle = {};
      rectangle.id = gameId;
      rectangle.polygon = $('svg > polygon').last().attr('points');
      allPolygons.push([rectangle]);
      localStorage.allPolygons = JSON.stringify(allPolygons);
      return $('svg > polygon').last().attr('data-gameid', gameId);
    } else {
      $('svg > polygon').last().remove();
      return localStorage.currentRectangle = "[]";
    }
  }
});

$('.ref__start-polygon').click(function() {
  return $('[data-status]').attr('data-status', 'readyForPolygon');
});

$('.ref__draw-rectangles').click(function() {
  return $('[data-status]').attr('data-status', 'drawingRectangles');
});

$('.ref__finish-rectangles').click(function() {
  return $('[data-status]').attr('data-status', 'idle');
});
