void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = (fragCoord.xy-iResolution.xy*.5) / iResolution.y;
    
    float c = .0;
    float z = .0;
    float t = iGlobalTime;
    
    for(float f = 0.; f < 1.; f += .07)
    {   
        z = sin( sin(uv.y*5.) +t+f*f)*30.;
        c += (.03+f*f*.001)/distance( uv, vec2( sin(t+f*f+uv.x*z), cos(t-f*f+uv.y*z) ) );   
    }
        
    fragColor = vec4(c-length(uv)*.5,c*.7,c*.53, 1.);
}
-------------------------------------------------------
void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = (fragCoord.xy-iResolution.xy*.5) / iResolution.y;
    
    float c = .0, z = .0;
    float t = iGlobalTime;
    
    for(float f = 0.; f < 2.; f += .07)
    {   
        z += sin( cos(uv.y*4.*f)+t+f*f)*1.3 - 2.;
        c += (.04+f*f*.001)/distance( uv, vec2( sin(t+f*f+uv.x*z), cos(t-f*f+uv.y*z) ) );   
    }
    
    c -= .5*(1.2-fract(c+1.5+uv.y*2.5));
    
    if (uv.x < -.8 || uv.x >.8)
        c = 1.8-c;
    
    fragColor = vec4(c-length(uv)*.5,c*.7,c*.53, 1.);
}