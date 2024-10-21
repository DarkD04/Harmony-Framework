varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float time;
uniform float dist[512];
uniform float array_size;
uniform float offset;
uniform vec2 size;
uniform float mode;

void main()
{
	//Turn coordinates into vertical pixel lines
	float pixel = v_vTexcoord.y * size.y;
	
	//Apply the line offset by the array index of the line
	float offset = dist[int(mod(pixel + time + offset, array_size))];
	
	//All done lol
	float dist_result = offset*(1.0/size.x);
	
	//Result values
	float result_x = 0.0;
	float result_y = 0.0;
	
	//Different distortion modes
	if(mode == 0.0)
	{
		result_x = dist_result;
		result_y = 0.0;
	}
	
	if(mode == 1.0)
	{
		result_x = 0.0;
		result_y = dist_result;
	}
	
	gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord + vec2(result_x, result_y));
}