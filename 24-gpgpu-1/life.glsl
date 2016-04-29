precision highp float;

uniform sampler2D prevState;
uniform vec2 stateSize;

float state(vec2 coord) {
  return texture2D(prevState, fract(coord / stateSize)).r;
}

void main() {
  vec2 coord = gl_FragCoord.xy;
  float s = state(coord);
  float n = -1.0*s;
  for (int i=-1;i<2;i++)
  for (int j=-1;j<2;j++)
  {
  	n += state(coord+vec2(i,j));
  }
  float new_s = 0.0;
  if((s == 0.0 && n == 3.0)||(s == 1.0 && (n == 2.0 || n == 3.0))){
  	new_s = 1.0;
  }
  gl_FragColor = vec4(new_s,new_s,new_s, 1.0);
}
