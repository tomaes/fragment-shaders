void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
	vec2 uv = (fragCoord.xy - iResolution.xy*.5) / iResolution.y;
    
    float t = iGlobalTime;
    
    const int iter = 8;
    
    for( int i=0; i < iter; i++) 
    {
        float x = uv.x*uv.x + uv.y*uv.y + .1;
        float y = uv.x*uv.x - uv.y*uv.y + .5;
   
        if (length(uv-float(i)*.2) > .6 + sin(t)*.2 )
            break;
        
        uv.x = x;
        uv.y = y;
    }
    
    float c = 2.-length(uv);
    
	fragColor = vec4( c, c*.6, c*.5,  1. );
}
