highp mat4 reflection(highp vec3 n) {

  //TODO: Return a matrix that reflects all points about the plane passing through the origin with normal n
  // https://en.wikipedia.org/wiki/Transformation_matrix#Reflection_2
  // or http://ami.ektf.hu/uploads/papers/finalpdf/AMI_40_from175to186.pdf
  n = normalize(n);

  return  mat4(1.0 - 2.0 * n.x * n.x,  -2.0 * n.x * n.y,  -2.0 * n.x * n.z, 0,
              			-2.0 * n.x * n.y, 1.0 - 2.0 * n.y * n.y,  -2.0 * n.y * n.z, 0, 
               			-2.0 * n.x * n.z,  - 2.0 * n.y * n.z, 1.0 - 2.0 * n.z * n.z, 0,
              			0, 0, 0, 1.0);

}

#pragma glslify: export(reflection)