precision mediump float;

#pragma glslify: PointLight = require(./light.glsl)

attribute vec3 position;
attribute vec3 normal;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

uniform mat4 inverseModel;
uniform mat4 inverseView;
uniform mat4 inverseProjection;

uniform vec3 ambient;

uniform PointLight lights[4];

varying vec3 viewPos;
varying vec3 normalVector;
varying vec3 eyeDirection;

void main() {
	vec4 viewPosition = view * model * vec4(position, 1.0);
	viewPos = viewPosition.xyz;
	normalVector = normalize((vec4(normal,1) * inverseModel * inverseView).xyz);
	eyeDirection = normalize(viewPosition.xyz);
	gl_Position = projection*viewPosition;
}
