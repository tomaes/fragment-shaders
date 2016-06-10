float r(vec2 _uv, float _t)
{
    return min(.2/length(_uv-.5), mod(_t+sqrt(_uv.x*4.+_uv.y),.5)* abs(sin(_t+_uv.x)*5. ) );    
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
	vec2 uv = fragCoord.xy / iResolution.xy;
    
    float c = r(uv,iGlobalTime);
    
	fragColor = vec4(c,c*.9,c-uv.x,1.);
}
