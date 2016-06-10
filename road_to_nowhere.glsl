// road to nowhere
float r(vec2 _uv, float _t)
{
    float c = .0;    
    float o = .001/(-_uv.y);
    
    // road
    c = (_uv.x > .35+o && _uv.x < .65-o) ? .5+fract(_uv.x*143.5)*_uv.y*.2 : .0;
    // middle of the road
    c += (_uv.x > .50+o && _uv.x < .51-o && mod(_uv.y+_t,.1) < .05 ) ? .8-_uv.y*.8 : .0;
	// left and right lane
    c += (_uv.x > .33+o  && _uv.x < .34+o) ? .2 : .0;
    c += (_uv.x > .66-o  && _uv.x < .67-o) ? .2 : .0;
    
    return c + _uv.y*.1;
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
	vec2 uv = fragCoord.xy / iResolution.xy;    
    float t = iGlobalTime;    
    float c = .85-length(uv-vec2(.5,.4));
    
    if (uv.x > .15 && uv.x < .85 && uv.y*fract(sin(uv.x*5.)+uv.y*5.+t) < .6)
    	c *= length(uv-.5)*.3 + r(uv,t*.2);
    
    c += (uv.x > .2 && uv.x < .8) && (fract(t+uv.x*5.+uv.y*10.) <.5) ? .2 : c;
    
	fragColor = vec4( c,c*.9,c*.7, 1. );
}