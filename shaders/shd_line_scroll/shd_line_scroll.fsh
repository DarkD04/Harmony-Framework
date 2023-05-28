	//Shader variables
	varying vec2 v_vTexcoord;
	varying vec4 v_vColour;
	varying vec2 v_vPosition;

	//Uniform for the parallax
	uniform vec2 Position;
	uniform float OffsetX;
	uniform float Width;
	uniform float LineGaps;
	uniform float YSteps;
	uniform float TexelWidth;
	uniform float YScale;
	
	//Variables
	vec2 Diff;
	float Result;
	float LineCalc;

	void main(){		
		Diff  = (v_vPosition - Position);
		
		//Calculate line scrolling
		LineCalc =  1. + ceil(Diff.y / LineGaps / YScale) * YSteps;
		
		//Scroll the background
		Result = mod(floor(OffsetX * LineCalc) + Diff.x, Width) - Diff.x;
		
		//Final
		gl_FragColor = v_vColour * texture2D( gm_BaseTexture, vec2(v_vTexcoord.x + Result * TexelWidth, v_vTexcoord.y));
	}
