precision highp float;

attribute vec3 position;

uniform mat4 model, view, projection;

void main() {

  //TODO: Apply the model-view-projection matrix to `position`
  // have to think about why the order matters lol
  //gl_Position = model*view*projection*vec4(position, 1);

  gl_Position = projection*view*model*vec4(position, 1);

}