#define PI 3.141592653589793

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = fragCoord.xy / iResolution.xy;
    
    float ar = iResolution.x / iResolution.y;
    float t = iGlobalTime * 0.2 + 100.0;
    float c = uv.y*0.25;
    float s = 0.6-uv.y*0.001; 
    float g = s-0.05*uv.y;

    uv.x = 1.1-uv.x;//uv.x += 0.5+cos(PI*uv.x+t*2.0);
    uv.y += (0.5+sin(t+uv.y))*uv.x*cos(PI*uv.y);
    
    uv.x *= 1.5 - sin(uv.y+t);
    uv.y += 0.5*sin(t*10.0+uv.y*uv.x)*0.51;
    
    float mx = mod(uv.x+t, s);
    float my = mod(uv.y+t, s);
     
    if (distance(uv, vec2(0.5*ar,0.5)) < 0.32+sin(uv.x*uv.y*120.5+t*15.0)*0.2)
        c = 0.15+my*0.4;
    
    if (distance(uv, vec2(0.5*ar,0.5)) < 0.17)
    if ( mx < g && my < g )
    {
        c = sin(distance(vec2(mx, my),vec2(g*0.5,g*0.5))*PI)*1.5;
        c = mod(c,0.1)*10.0 + 20.0-uv.y*25.0-c*10.0;    
    }
    
    if (uv.y < 0.2)
        c = 0.0;
       
    fragColor = vec4(c+uv.x*0.55,c+uv.x*0.25,0.0,1.0);
}