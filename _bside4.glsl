float r(vec2 _p, float _t, float _s)
{
    float rs  = sin(_t+_p.y*(10.+_s))+sin(_t+_p.y*(20.+_s))+sqrt(sin(_t+_p.x*(20.+_s))+tan(_p.y*20.));
          rs /= sin(_t+_p.y*(12.+_s))+sin(_t+_p.y*(30.+_s))+sqrt(sin(_t+_p.x*(30.+_s))+tan(_p.y*20.));;
	return rs;
}

void mainImage( out vec4 f, vec2 p )
{    
    p = p / iResolution.y;
    float t = iGlobalTime;
    f  = vec4(r(p.xy+mod(p.x,.01),t,-20.+mod(t*5.,50.) ),.1,.0, 1.);
    f *= vec4(r(p.yx+mod(p.y,.01),t,-20.+mod(t*5.,50.) ),.1,.0, 1.);

}
