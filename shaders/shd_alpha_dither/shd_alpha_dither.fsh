//If you want more details on this method of dithering read up on "Ordered dithering"
//Fragment shader variable initialization.
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 v_vPosition;
//Our uniform variable
uniform float dAlpha;

//This function calculates a 4x4 pattern based on the opacity parameter.
//The opacity parameter works on a 0.0 - 1.0 range.
mat4 patCalc(float opacity)
{
    //Initialize the return value matrix
    //This matrix will store our 4x4 pattern.
    mat4 retval = mat4(
        vec4(0.0,0.0,0.0,0.0),
        vec4(0.0,0.0,0.0,0.0),
        vec4(0.0,0.0,0.0,0.0),
        vec4(0.0,0.0,0.0,0.0)
        );
    
    //We multiply our opacity by 16 and store it in a variable.
    int dPatlvl = int(opacity*16.0);
    
    if (dPatlvl > 0)
    {
    //We calculate the pattern with a loop
    for(int i = 1; i <= 16; i++)
    {
        if (i <= dPatlvl)
        {
        int xPat; int yPat; //Initiate xPat and yPat
        float iFl = float(i); //I made a variable for i as a float to save myself from messy code
        
        //xPat gets offset by how divisible it is by 2, 4, and 8.
        xPat = int(floor(iFl/2.0)*2.0 + floor((iFl-1.0)/4.0) - floor((iFl-1.0)/8.0));
        xPat -= int(floor(float(xPat)/4.0)*4.0);//We sorta "screen wrap" the xPat value so that it loops itself back into the matrix's range
        
        //yPat gets offset by how divisible it is by 2 and 4.
        yPat = int(abs(sign(mod(iFl, 2.0))-1.0)*2.0 + floor((iFl-1.0)/4.0));
        yPat -= int(floor(float(yPat)/4.0)*4.0);//We also "screen wrap" the yPat value so that it loops itself back into the matrix's range
        
        //We write retval[xPat][yPat] to equal 1.0
        //shadertoy wouldn't let me say retval[xPat][yPat] = 1.0;
        //so I had to work around it using a vec4 and offset numbers.
        retval[xPat][yPat] = 1.0;
        }
    }
    }
    
    return retval;
}

mat4 dPattern = patCalc(dAlpha); //We use this variable to store our actual 4x4 pattern

void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
    
    //We find the corresponding pattern position to our screens x and y
    //So we essentially "screen wrap" the screen coordinates between 0 and 3.
    int xPos = int(v_vPosition.x - floor(v_vPosition.x/4.0)*4.0);
    int yPos = int(v_vPosition.y - floor(v_vPosition.y/4.0)*4.0);
    
    gl_FragColor.a = dPattern[xPos][yPos] * sign(gl_FragColor.a);
}
