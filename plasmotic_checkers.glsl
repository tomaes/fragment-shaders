// plasmotic checkers
void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = fragCoord.xy / iResolution.y;
    float t = iGlobalTime*1.5;
    float c = 0.;    
    float o = 2. + sin(t+uv.x*2.)*1.8;

    uv.x -= .6;
    uv.x += .5*mod(uv.x+mod(t,5.),length(.5-uv)*o );
    uv.y += .5*mod(uv.y+mod(t,5.),length(.5-uv)*o );

    o = .1*atan(uv.x,uv.y);
    
    c += mod( length(.7-uv+o)*sin(t+sqrt(2.*sin(uv.y)*cos(uv.x)*1.)),.2)*1.;
    c += mod( length(.3-uv+o)*sin(t+sqrt(2.*sin(uv.y)*cos(uv.x)*1.)),.2)*1.; 
    
    c *= 5.5*mod(c+o*20.,.2)*5.5*uv.y;

    float h = normalize( length(vec3(1.2-c,0.6-c,c-uv.y)) );
    
	if (h <= 1.)
    	fragColor = vec4(1.2-c,.6-c,c-uv.y,1.);    
    else
        fragColor = vec4( mod(sqrt(sin(uv.y*45.)+cos(uv.x*45.)),.1)*10.,.2,uv.y*0.4,1.);
}