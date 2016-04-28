precision mediump float;

attribute vec3 position;
attribute vec3 normal;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

uniform mat4 inverseModel;
uniform mat4 inverseView;
uniform mat4 inverseProjection;

uniform vec3 lightPosition;

varying vec3 normalVector;
varying vec3 eyeDirection;
varying vec3 lightDirection;

void main() {
	vec4 viewPosition = view * model * vec4(position, 1.0);

	gl_Position = projection*viewPosition;

	normalVector = normalize((vec4(normal,1) * inverseModel * inverseView).xyz);
	eyeDirection = normalize(viewPosition.xyz);
	lightDirection = normalize((view*vec4(lightPosition,1)).xyz - viewPosition.xyz);
}
