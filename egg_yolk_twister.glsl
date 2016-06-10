// egg yolk twister
#define PI 3.141592653589793

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
	vec2 uv = fragCoord.xy / iResolution.y;
    float t = iGlobalTime * 0.5 + 135.0;

    // moving bg texture
    vec3 c = vec3( 0.25 + min(sqrt(sin(uv.x*200.0+t*0.5)+cos(uv.y*200.0)),0.7 ),0.5,0.2*abs(0.5-uv.y));
    
    float p[8];
    
    for(int i = 0; i < 8; i++)
        p[i] = 0.5 + sin( float(i)*2.0*PI/8.0 + t + sin(2.0*uv.x+t)*2.0)*(0.25+0.2*sin(uv.x+t));
	
    // "yolk"
    for(int i = 1; i < 8; i++)
        if ((p[i-1]-p[i]) > 0.0 && uv.y < p[i-1] && uv.y > p[i] )
            //c += 1.5 * vec3(0.8,0.2,0.5-p[i]*2.5);
        	c += 1.5 * vec3(0.8,0.2,(p[i-1]-p[i])*uv.y*2.5);
    
    // "arms"
    for(int i = 0; i < 8; i++)
		if (distance(vec2(uv.x,uv.y),vec2(uv.x,p[i])) < 0.05+sin(uv.x*4.0)*0.05)
        if (mod(uv.x+uv.y,0.1) < 0.01+sin(uv.x+uv.y)*0.1)
            c = vec3(1.0,1.0,1.0-p[i]*0.25);
    
	fragColor = vec4(c, 1.0);
}