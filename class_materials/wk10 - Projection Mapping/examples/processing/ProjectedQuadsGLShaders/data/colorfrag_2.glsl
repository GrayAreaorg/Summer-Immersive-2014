#ifdef GL_ES
precision mediump float;
#endif

// Nightroad
// Autogenerated from Forth Haiku
// Generator by Stainless
// Haiku by Manwe

uniform float time;
uniform vec2 mouse;
uniform vec2 resolution;

void main( void ) {

	float vars[32];
	float stack[8];
	 vec2 position = ( gl_FragCoord.xy / resolution.xy );
	vars[0] = 1.0000000;
	vars[1] = position.y;    // y
	vars[2] = 2.0000000;
	vars[1] = vars[2] * vars[1];
	vars[0] = vars[0] - vars[1];
	vars[1] = position.x;     // x
	vars[2] = position.y;    // y
	vars[3] = 2.0000000;
	vars[2] = vars[3] * vars[2];
	vars[3] = 8.0000000;
	vars[2] = pow(abs(vars[2]),vars[3]);
	vars[3] = time;    // t
	vars[4] = 9.0000000;
	vars[3] = vars[3] / vars[4];
	vars[3] =  sin(vars[3]);
	vars[2] = vars[3] * vars[2];
	vars[1] = vars[2] + vars[1];
	vars[2] = 0.5000000;
	vars[1] = vars[1] - vars[2];
	vars[1] =  abs(vars[1]);
	vars[2] = vars[0];   // 2dup
	vars[3] = vars[1];   // 2dup
	if (vars[3] < vars[2])  vars[2] = 1.0;   // >
	else vars[2]=0.0;
	vars[3] = 0.5000000;
	vars[4] = position.y;    // y
	vars[3] = vars[3] - vars[4];
	vars[2] = vars[3] * vars[2];
	vars[3] = vars[2];	//rot 
	vars[2] = vars[1];	//rot 
	vars[1] = vars[0];	//rot 
	vars[0] = vars[3];	//rot 

	vars[3] = 45.0000000;
	vars[2] = vars[3] * vars[2];
	if (vars[2] < vars[1])  vars[1] = 1.0;   // >
	else vars[1]=0.0;
	vars[2] = 3.0000000;
	vars[3] = 1.0000000;
	vars[4] = position.y;    // y
	vars[5] = 1.8000000;
	vars[4] = vars[5] * vars[4];
	vars[3] = vars[3] - vars[4];
	vars[2] = vars[2] / vars[3];
	vars[3] = time;    // t
	vars[4] = 1.0000000;
	vars[3] = mod(vars[3],vars[4]);
	vars[4] = 6.0000000;
	vars[3] = vars[4] * vars[3];
	vars[2] = vars[3] + vars[2];
	vars[2] =  floor(vars[2]);
	vars[3] = 2.0000000;
	vars[2] = mod(vars[2],vars[3]);
	vars[3] = 1.0000000;
	vars[4] = position.y;    // y
	vars[5] = 1.8000000;
	vars[4] = vars[5] * vars[4];
	vars[3] = vars[3] - vars[4];
	vars[2] = vars[3] * vars[2];
	vars[3] = 4.0000000;
	vars[2] = vars[2] / vars[3];
	vars[1] = vars[2] * vars[1];
	vars[0] = vars[1] + vars[0];
	vars[1] = vars[0];   // dup
	vars[2] = 0.0000000;
	if (vars[2] == vars[1])  vars[1] = 1.0;   // ==
	else vars[1]=0.0;
	vars[2] = 0.5000000;
	vars[3] = position.y;    // y
	vars[2] = vars[2] - vars[3];
	vars[1] = vars[2] * vars[1];
	vars[2] = 0.7500000;
	vars[1] = pow(abs(vars[1]),vars[2]);
	vars[2] = position.y;    // y
	vars[3] = 0.5000000;
	if (vars[3] > vars[2])  vars[2] = 1.0;   // <
	else vars[2]=0.0;
	vars[1] = vars[2] * vars[1];
	vars[2] = vars[0];   // over
	vars[1] = vars[2] + vars[1];
	vars[2] = vars[0];   // over
	vars[3] = 1.0000000;
	vars[4] = position.x;     // x
	vars[5] = time;    // t
	vars[6] = 9.0000000;
	vars[5] = vars[5] / vars[6];
	vars[5] =  cos(vars[5]);
	vars[4] = vars[5] + vars[4];
	vars[5] = 12.0000000;
	vars[4] = vars[5] * vars[4];
	vars[4] =  sin(vars[4]);
	vars[5] = 30.0000000;
	vars[4] = vars[4] / vars[5];
	vars[5] = position.y;    // y
	vars[6] = 0.6000000;
	vars[5] = vars[5] - vars[6];
	if (vars[5] > vars[4])  vars[4] = 1.0;   // <
	else vars[4]=0.0;
	vars[3] = vars[4] * vars[3];
	vars[2] = vars[3] + vars[2];
	vars[3] = 1.5000000;
	vars[4] = position.y;    // y
	vars[5] = 1.3000000;
	vars[4] = vars[5] * vars[4];
	vars[3] = vars[3] - vars[4];
	vars[4] = position.y;    // y
	vars[5] = 0.5000000;
	if (vars[5] < vars[4])  vars[4] = 1.0;   // >
	else vars[4]=0.0;
	vars[3] = vars[4] * vars[3];
	vars[2] = vars[2] - vars[3];
	gl_FragColor = vec4(vars[0],vars[1],vars[2],1);

}