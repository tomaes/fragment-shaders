void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = (fragCoord.xy-iResolution.xy*.5) / iResolution.xy;

    float c = .5;
    float t = iGlobalTime;
    
    for(float f = 2.; f > .0; f -= .5)
    {
        c /= sin( ( (t*.001*fract(t*.3))/length(uv)*5.5)*2.+1.*tan( uv.x*14. +t +f*f)/f*.2) / length(f*f*f*uv+uv) / 2.2*atan(uv.x,uv.y);
        c -= 1./fract(t-length(uv)*20.);
    }
        
    fragColor = vec4(c);
}
---------------------------------------------------------
void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = fragCoord.xy / iResolution.xy - vec2(.5,.5);

    float c = .5;
    float t = iGlobalTime + 66.12;
    
    for(float f = 2.; f > .0; f -= .5)
    {
        c /= sin( ( (t*.001*fract(t*.3))/length(uv)*5.5)*2.+1.*tan( uv.x*14. +t +f*f)/f*.2) / length(f*f*f*uv+uv) / 2.*atan(uv.x,uv.y);
        c -= 1./fract(t-length(uv)*20.);
    }

    uv += vec2(sin(t),cos(t))*.2;
    
    for(float f = 2.; f > .0; f -= .5)
    {
        c /= sin( ( (t*.001*fract(t*.3))/length(uv)*5.5)*2.+1.*tan( uv.x*14. +t +f*f)/f*.2) / length(f*f*f*uv+uv) / 2.*atan(uv.x,uv.y);
        c -= 1./fract(t-length(uv)*20.);
    }
    
    if (uv.x < -.2 || uv.x > .2)
        c = 2./c;
    
    
    fragColor = vec4(c);
}