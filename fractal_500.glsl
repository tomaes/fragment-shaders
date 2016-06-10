void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
	vec2 uv = (fragCoord.xy - iResolution.xy*.5) / iResolution.y;   
    float t = iGlobalTime + 2.65;
    
    const int iter = 8;
    
    for( int i = 0; i < iter; i++) 
    {
        float x = uv.x*uv.x/(tan(t*.5+uv.y*5.)*2.) + uv.y*uv.y + .1;
        float y = uv.x*uv.x/uv.y - uv.y*uv.y + .25;
   
        float f = float(i);
        
        if (length(uv-f*.15) > .7 - .5/tan(t+t*.1+( fract(t*.1/uv.x*.001*uv.y) /(f*f))/atan(uv.x,uv.y) )*.1 )
            break;
        
        uv.x = x;
        uv.y = y;
    }
    
    float c = 1.6-length(uv/tan(t*5.+uv.y*5.));
    
	fragColor = vec4( c, c*.6, c*.4-uv.y*.35,  1. );
}