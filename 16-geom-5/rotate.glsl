highp mat4 rotation(highp vec3 n, highp float theta) {

  //TODO: Using Rodrigues' formula, find a matrix which performs a rotation about the axis n by theta radians

  highp float c = cos(theta);
  highp float s = sin(theta);

  // p * cos(theta)
  mat4 pcos = mat4(c,0,0,0,
  				   0,c,0,0,
  				   0,0,c,0,
  				   0,0,0,1.0);

  // cross(n,p) * sin(theta)
  mat4 csin = s*mat4( 0  , n.z ,-n.y  ,  0  ,
  				    -n.z ,  0  , n.x  ,  0  ,
  				     n.y ,-n.x ,  0   ,  0  ,
  				      0  ,  0  ,  0   ,  0  );

  // n * dot(p,n) * (1.0 - cos(theta))
  mat4 ndot = (1.0 - c) * mat4(n.x * n.x, n.x * n.y, n.x * n.z, 0,
              				   n.x * n.y, n.y * n.y, n.y * n.z, 0, 
               				   n.x * n.z, n.y * n.z, n.z * n.z, 0,
              				       0    ,     0    ,     0    , 0);

  return pcos + csin + ndot;
}

#pragma glslify: export(rotation)