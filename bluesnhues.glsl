// "blues 'n hues"
vec3 r( vec2 _uv, float _t )
{
    //_uv.x += min(.85*mod(_uv.x+_t,length(.5-_uv)*.1 ), .1  );
    //_uv.y += min(.85*mod(_uv.y+_t,length(.5-_uv)*.6 ), .1  );

    //_uv.x += .75*mod(_uv.x,.01 );
    //_uv.y += .75*mod(_uv.y,.005+sin(_t+_uv.y*.5)*.1 );

    float c = 1.;
    
    if ( mod(_uv.x*.02/_uv.y   +_t*.1,.1) > .05)
    {
      c  = mod( mod(length(.7-_uv),.1)*20.*sin(_t+sqrt(abs(2.*sin(_uv.y)*cos(_uv.x)*2.))),.26)*5.;
      c -= mod( mod(length(.3-_uv),.1)*20.*sin(_t+sqrt(abs(2.*sin(_uv.y)*cos(_uv.x)*2.))),.26)*5.; 
      c += mod( length(.7-_uv)*sin(_t+sqrt(abs(2.*sin(_uv.y)*cos(_uv.x)*2.)) ),.26)*5.;
      c += mod( length(.3-_uv)*sin(_t+sqrt(abs(2.*sin(_uv.y)*cos(_uv.x)*2.)) ),.26)*5.; 
    }
    else
    {
      c  = mod( length(.7-_uv)*sin(_t+sqrt(2.*sin(_uv.y)*cos(_uv.x)*2.)),.26)*5.;
      c += mod( length(.3-_uv)*sin(_t+sqrt(2.*sin(_uv.y)*cos(_uv.x)*2.)),.26)*5.; 
    }
    
    return vec3(1.2-c,.6-c,min(c-_uv.x/_uv.y,.8));    
}


void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = fragCoord.xy / iResolution.xy;
    float t = iGlobalTime + 1.5;//3.8
   
    //fragColor = vec4( r(uv,t), 1. );
    //fragColor = vec4( 0.8*r(uv,t)+0.3*r(uv,t+.01)+0.2*r(uv,t+.02), 1. );

    fragColor = vec4(.0);
    
    // motion blur
    for( float f = .0; f < .2; f+=.01 )
        fragColor += vec4( r(uv,t+f)*(.06-f*.03),1. );
    
}