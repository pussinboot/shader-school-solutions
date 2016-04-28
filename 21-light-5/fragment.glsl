precision mediump float;

#pragma glslify: PointLight = require(./light.glsl)

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
	vec3 outputColor = ambient;
	for(int i=0; i < 4; ++i){
		vec3 lightDirection = normalize((view*vec4(lights[i].position,1)).xyz - viewPos);
		vec3 rlight = reflect(lightDirection, normalVector);
		float eyeLight = max(dot(rlight, eyeDirection), 0.0);
		float phong = pow(eyeLight, lights[i].shininess);
		float lambert = max(dot(normalVector, lightDirection),0.0);

		outputColor += lights[i].diffuse * lambert + lights[i].specular * phong;
	}
  gl_FragColor = vec4(outputColor,1);
}