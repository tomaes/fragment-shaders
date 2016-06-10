void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
	vec2 uv = (fragCoord.xy-iResolution.xy*.5) / iResolution.y;
    float t = 60. + mod(sin(iGlobalTime*.15+length(uv*sin(5.*uv.y+uv.x))),.1)*5.;
    
    fragColor = vec4(1.3-uv.y*.5,1.1,.3 * .5/sqrt(sin(t*5.+uv.x*20.)+cos(uv.y*20.)) , 1.);
    
    for(float f = 4.0; f < 10.; f += 2. )
	fragColor -= vec4( .06/sqrt(sin(uv.x*f)+cos(uv.y*f)+tan(f/t+t) ) );
}
---------------------------------------------------------------------------------
void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
	vec2 uv = (fragCoord.xy-iResolution.xy*.5) / iResolution.y;
    float t = 60. + mod(sin(iGlobalTime*.15+length(uv*sin(5.*uv.y+uv.x))),.1)*5.;
    
    fragColor = vec4(1.3-uv.y*.5,1.1,.3 * .5/sqrt(sin(t*5.+uv.x*20.)+cos(uv.y*20.)) , 1.);
    
    for(float f = 4.0; f < 10.; f += 2. )
		fragColor -= vec4( .06/sqrt(sin(uv.x*f)+cos(uv.y*f)+tan(f/t+t) ) );

	fragColor *= (length(fragColor) < 1.65) || (mod(t*.1,.1) < .005) ? 1. / fragColor : fragColor;
}