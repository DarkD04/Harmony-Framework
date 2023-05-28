	varying vec2			v_vTexcoord;
	varying vec4			v_vColour;

	uniform float			size;
	uniform sampler2D		lut_tex;

	void main() {
	    vec4 base_col	= texture2D(gm_BaseTexture, v_vTexcoord);
	    
		float maxColor = size - 1.0;
		float halfColX = 0.5 / (size * size);
		float halfColY = 0.5 / size;
		float threshold = maxColor / size;
	
		float xOffset = halfColX + base_col.r * threshold / size;
		float yOffset = halfColY + base_col.g * threshold;
		float cell = floor(base_col.b * maxColor);
		
		vec2 lutPos = vec2(cell / size + xOffset, yOffset);
		vec4 gradedColA = texture2D(lut_tex, lutPos);
	   
	   //vec3 out_col	= mix(colorAa.rgb, colorBa.rgb, lerpABa );
		vec3 out_col			= mix(base_col.rgb, gradedColA.rgb, 1.);
	    gl_FragColor	= v_vColour * vec4(out_col.rgb, base_col.a);
	}
