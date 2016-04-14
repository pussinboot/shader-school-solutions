void sideLengths(
  highp float hypotenuse, 
  highp float angleInDegrees, 
  out highp float opposite, 
  out highp float adjacent) {


  //TODO: Calculate side lengths here
  highp float rad = radians(angleInDegrees);
  opposite = sin(rad)*hypotenuse;
  adjacent = cos(rad)*hypotenuse;
}

//Do not change this line
#pragma glslify: export(sideLengths)