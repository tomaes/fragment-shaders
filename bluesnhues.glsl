// "blues 'n hues"
vec3 r( vec2 _uv, float _t )
{
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
   
    fragColor = vec4(.0);
    
    // motion blur
    for( float f = .0; f < .2; f+=.01 )
        fragColor += vec4( r(uv,t+f)*(.06-f*.03),1. );    
}