void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
	vec2 uv = fragCoord.xy / iResolution.y;
    float t = 1100.0+iGlobalTime/(uv.y*sin(iGlobalTime+uv.x*uv.x));
    float c = 0.5;
 
    float x = uv.x;
    float y = uv.y;
    
    x *= t*0.005 + t*0.001*sin(uv.x/uv.y+1.0/t*uv.x);
    y *= t*0.005 + t*0.001*sin(uv.x*uv.y+1.0/t*uv.x);
        
    c = sqrt(sin(x*20.0)+cos(y*15.0)) + cos(x*0.5);
    c -= 0.5 * 2.0/y;
    c += sqrt(sin(x*20.0)+cos(y*5.0)) * cos(y*t*0.05);
    
    c = 1.0-c;

    if (uv.y > 0.95 || uv.y < 0.05)
        c = 0.1;
    
	fragColor = vec4( c,c*1.5,c*1.5 ,1.0);
}