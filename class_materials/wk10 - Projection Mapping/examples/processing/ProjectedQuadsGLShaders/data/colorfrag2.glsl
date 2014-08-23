#ifdef GL_ES
precision mediump float;
#endif

uniform float time;
uniform vec2 mouse;
uniform vec2 resolution;
varying vec2 surfacePosition;

#define MAX_ITER 8
void main( void ) {
  vec2 sp = surfacePosition;//vec2(.4, .7);
  vec2 p = sp*15.0 - vec2(20.0);
  vec2 i = p;
  float c = 1.0;
  float inten = .05;

  for (int n = 0; n < MAX_ITER; n++) 
  {
    //float t = time * (1.0 - (3.0 / float(n+1)));
    float t = time * (1.0 - (3.0 / float(n+2)));
    i = p + vec2(cos(t - i.x) + sin(t + i.y), sin(t - i.y) + cos(t + i.x));
    c += 1.0/length(vec2(p.x / (sin(i.x+t)/inten),p.y / (cos(i.y+t)/inten)));
  }
  c /= float(MAX_ITER);
  c = 1.5-sqrt(c);
  gl_FragColor = vec4(vec3(c*c*c*c), 19.0) + vec4(0.0, 0.3, 0.5, 1.0);

}