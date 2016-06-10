// thumb delay test
void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
	vec2 uv = fragCoord.xy / iResolution.xy;
    
    float t = iGlobalTime;
    float d = .1;
    
    // random calc to simulate activity
    for(int i= 0; i < 1000; i++)
        d -= fract(dot(d,d) + sqrt(d+d*t*uv.y));
    
    // each bar = 2 seconds
	fragColor = vec4(t*.05 > uv.x ? 1. : .1, mod(uv.x,.1) < .01 ? 1. : .1  ,d, 1.0);
}