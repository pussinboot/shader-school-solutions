precision highp float;

attribute vec4 position;
attribute vec3 color;
varying vec4 inColor;

void main() {
  gl_Position = position;
  inColor = vec4(color,1.0);
}
