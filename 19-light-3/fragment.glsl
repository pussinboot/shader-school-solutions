precision mediump float;

uniform mat4 model, view, projection;
uniform mat4 inverseModel, inverseView, inverseProjection;
uniform vec3 ambient, diffuse, specular, lightDirection;
uniform float shininess;

varying vec3 normalVector;
varying vec3 eyeDirection;

void main() {
	vec3 rlight = reflect(lightDirection, normalVector);
	float eyeLight = max(dot(rlight, eyeDirection), 0.0);
	float phong = pow(eyeLight, shininess);

	float lambert = max(dot(normalVector, lightDirection),0.0);
	vec3 outputColor = ambient + diffuse * lambert + specular * phong;
	gl_FragColor = vec4(outputColor,1);
}