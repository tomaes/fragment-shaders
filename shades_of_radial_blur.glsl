float r(vec2 _uv, float _t)
{
    float b = sin(_t+5.*(_uv.x*.1/_uv.y*.5));
    float c = .1/sqrt( .01/fract( 2.*distance(_uv,vec2(b,b+_uv.x)))   ); 
    return mod(c,.4) * (1.-length(_uv)) * 9.;    
}

float rb(vec2 _uv, float _t)
{
    float v = .0;
    
    for(float f = 1.; f > .0; f -= .02)
        v += r(_uv*f,_t)*.02;

    return v;
}


void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = (fragCoord.xy-iResolution.xy*.5) / iResolution.y;
    float t = iGlobalTime;   
    
    uv.y += sin(t+3.1459*1.5*uv.x)*.03;
    
    float c = r(uv,t) - r(uv,t+.1);
    
    c += (r( vec2(uv.x-.025,uv.y     ),t ) + 
          r( vec2(uv.x+.025,uv.y     ),t ) +
          r( vec2(uv.x     ,uv.y+.025),t ) +
          r( vec2(uv.x     ,uv.y-.025),t ))*.15;
    
    if (uv.y > .0)
        c = rb(uv,t);

    fragColor = vec4(c-uv.y*.6,c*.8,c*.5, 1.);
}