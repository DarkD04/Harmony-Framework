varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float time;
uniform float dist[512];
uniform float array_size;
uniform float offset;
uniform vec2 size;

void main()
{
	//Turn coordinates into vertical pixel lines
	float pixel = v_vTexcoord.y * size.y;
	
	//Apply the line offset by the array index of the line
	float offset = dist[int(mod(pixel + time + offset, array_size))];
	
	//All done lol
	float result = offset*(1./size.x);
	
	gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord + vec2(result, 0.0));
}