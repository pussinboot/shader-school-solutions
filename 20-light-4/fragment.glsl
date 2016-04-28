precision mediump float;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

uniform mat4 inverseModel;
uniform mat4 inverseView;
uniform mat4 inverseProjection;

uniform vec3 ambient;
uniform vec3 diffuse;
uniform vec3 specular;

uniform vec3 lightPosition;

uniform float shininess;
varying vec3 normalVector;
varying vec3 eyeDirection;
varying vec3 lightDirection;

void main() {
	vec3 rlight = reflect(lightDirection, normalVector);
	float eyeLight = max(dot(rlight, eyeDirection), 0.0);
	float phong = pow(eyeLight, shininess);

	float lambert = max(dot(normalVector, lightDirection),0.0);
	vec3 outputColor = ambient + diffuse * lambert + specular * phong;
	gl_FragColor = vec4(outputColor,1);
	// gl_FragColor = vec4(ambient,1);
}