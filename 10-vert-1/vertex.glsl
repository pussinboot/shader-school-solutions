precision highp float;

uniform float theta;

attribute vec2 position;

void main() {

  //TODO: rotate position by theta radians about the origin
  mat4 rotate = mat4(cos(theta),sin(theta),0,0,
  						-sin(theta),cos(theta),0,0,
						0,0,1,0,
						0,0,0,1);
  gl_Position = rotate * vec4(position, 0, 1.0);
}
