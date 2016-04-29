precision mediump float;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

uniform mat4 inverseModel;
uniform mat4 inverseView;
uniform mat4 inverseProjection;

uniform vec3 diffuse;
uniform vec3 lightDirection;
uniform float numBands;

varying vec3 fragNormal;

void main() {
	float lambertWeight = dot(normalize(fragNormal),normalize(lightDirection));
	lambertWeight = max(lambertWeight,0.0);
	lambertWeight = ceil(lambertWeight * numBands) / numBands;
	vec3 lightDirection = diffuse * lambertWeight;
	gl_FragColor = vec4(lightDirection,1);
}