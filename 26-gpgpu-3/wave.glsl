precision mediump float;

uniform sampler2D prevState[2];
uniform vec2 stateSize;
uniform float kdiffuse;
uniform float kdamping;

float state0(vec2 x) {
  return texture2D(prevState[0], fract(x / stateSize)).r;
}
float state1(vec2 x) {
  return texture2D(prevState[1], fract(x / stateSize)).r;
}

float laplacian(vec2 x) {
  return (state0(x+vec2(-1,0)) + state0(x+vec2(1,0)) + state0(x+vec2(0,1)) + state0(x+vec2(0,-1))) - 4.0 * state0(x);
}

void main() {
  vec2 coord = gl_FragCoord.xy;

  float y = (1.0 - kdamping) * (kdiffuse * laplacian(coord) + 2.0 * state0(coord)) - state1(coord);
  gl_FragColor = vec4(y,y,y,1);
}
