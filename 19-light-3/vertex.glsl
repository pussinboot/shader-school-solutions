precision mediump float;

attribute vec3 position, normal;
uniform mat4 model, view, projection;
uniform mat4 inverseModel, inverseView, inverseProjection;
uniform vec3 ambient, diffuse, specular, lightDirection;
uniform float shininess;

varying vec3 normalVector;
varying vec3 eyeDirection;

void main() {
  gl_Position = projection*view*model*vec4(position, 1);
  normalVector = normalize((vec4(normal,1) * inverseModel * inverseView).xyz);
  eyeDirection = normalize((view*model*vec4(position, 1)).xyz);
}
