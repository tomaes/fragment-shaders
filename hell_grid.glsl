// hell grid
void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
	vec2 pos = fragCoord.xy / iResolution.xy;

	vec3 col = vec3(0.1,0.2,0.3);
    float time = 300.0 + mod(iGlobalTime,1000.0);

	float sd = 0.19 - (pos.y*0.004 / pos.x*0.5) - atan( pos.x + pos.y, 40.0 );
	float so = 0.22 + pos.y*0.0003/pos.x*(0.15 + sin(time*0.04+pos.x*3.5));
	 
	float t = mod(time*0.1, 10.0) + 140.0;
	float x = mod(pos.x + t, so);
	float y = mod(pos.y + t, so*2.0);
    
	float d1 = mod( distance( vec2(x,y), vec2(so*0.45,so*1.05) ) + t*0.5, 0.05) * 30.0 + pos.x * 0.5;
	float d2 = mod( distance( vec2(x,y), vec2(so*0.55,so*0.95) ) + t*0.5, 0.015) * 30.0;
	
	if ((x-0.03 < sd) && (y-0.03 < sd*2.0))
    {    
        if ((x < sd) && (y < sd*2.0))
            col = vec3(0.1, 0.2, mix(d1, d2, 0.8) );
    }
	else
		col = vec3(0.12, 0.25, pos.y * 0.06 + 0.3);
	
    col.r = 1.0 - pos.y-col.b;

	fragColor = vec4( col, 1.0 );

}