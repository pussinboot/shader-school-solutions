precision mediump float;

uniform sampler2D prevState;
uniform vec2 stateSize;
uniform float kdiffuse;
uniform float kdamping;

float state(vec2 x) {
  return texture2D(prevState, fract(x / stateSize)).r;
}

void main() {
  vec2 coord = gl_FragCoord.xy;

  //TODO: Compute next state using a 5-point Laplacian stencil and the rule

  float prev = state(coord);
  float laplace = (
  	state(vec2(coord.x-1.0,coord.y)) + 
  	state(vec2(coord.x+1.0,coord.y)) + 
  	state(vec2(coord.x,coord.y-1.0)) + 
  	state(vec2(coord.x,coord.y+1.0))
  	) - 4.0 * prev;

  float nextState = (1.0 - kdamping) * (kdiffuse * laplace + prev);


  gl_FragColor = vec4(nextState,nextState,nextState,1);
}
