// golden shower
vec3 render( vec2 _uv, float _t )
{
    _uv.x -= 0.5;
    _uv.y += sin(_t*0.265+sin(_uv.y/_uv.x+_t)*5.00);
    
    float c = 0.3 - min(_uv.x*_uv.y, 0.7);
    float o = abs(sin(_t*0.5+(_uv.x+_uv.y)/cos(_t*0.1)))*0.05;
    
    float x = mod(_uv.x + sin(_t*0.05+_uv.y*0.25), 0.01+o);
    float y = mod(_uv.x + cos(_t*0.05+_uv.y*0.25), 0.01+o);
    x -= mod(_uv.x, 0.01+o*(0.6*_uv.x));
    y -= mod(_uv.y, 0.01+o*(0.6*_uv.y));
    
    if ((x < 0.008) || (y < 0.008))
        c = 0.5 + mod(_uv.x +_uv.y,0.6);
    
    return vec3(c,c*0.95,c*0.8);
}


void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
	vec2 uv = fragCoord.xy / iResolution.xy;
    float t = mod(iGlobalTime, 1000.0);
	
    fragColor = vec4( render(uv,t)*render(uv,t+10.55)*abs(1.8*sin((uv.x-.5)/uv.y)), 1.0);
}