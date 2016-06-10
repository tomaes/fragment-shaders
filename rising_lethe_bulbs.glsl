// rising lethe bulbs
void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
	vec2 uv = fragCoord.xy / iResolution.xy;
    
    float t = iGlobalTime * 0.1;   
    float c = 0.27; //+ sin(t*10.0+uv.y)*0.2; // - uv.y*0.01;
    float b = sin((uv.y*0.5+t*5.0)*5.0-uv.y*15.0)*(0.05-uv.y*0.24);

    uv.x += mod(uv.x+t,0.04+0.001/uv.y);
    uv.y += mod(uv.x+t,0.04+0.001/uv.y);
    
    // bg stripes
    if (mod(uv.y,0.1)<0.06)
        c = 0.38-c + sin(3.14159*uv.x)*0.15 + mod(uv.y,0.05);

    // outter border
    if (uv.x > 0.38+b && uv.x < 0.63-b)
        c = uv.y*0.3;  
    
    // border
    if (uv.x > 0.39+b && uv.x < 0.61-b)
        c = 0.3+uv.y*0.1;  
    
    // fill
    if (uv.x > 0.4-b && uv.x < 0.6+b)
        //c = 0.5 + mod(uv.y,0.05);
        c = 0.8-uv.y + mod( sqrt(uv.x*0.05+uv.y*0.05),0.03 ) * 20.0;
    
    // middle
    if (uv.x > 0.497-b && uv.x < 0.503+b)
    {
        c = 0.5+uv.x*0.7;
        
        if (uv.x > 0.5-b && uv.x < 0.5+b)
        	c -= 0.6-distance(uv,vec2(0.5,uv.x+0.3))*0.9;   
    }
    
    fragColor = vec4(c-uv.y*0.2,c-0.04,c*1.16,1.0);
}