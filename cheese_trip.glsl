// "cheese trip"
vec4 rect(vec2 _uv, vec2 _p, vec2 _s, vec3 _c)
{
    return vec4((_uv.x > _p.x) && (_uv.x < (_p.x+_s.x)) &&
                (_uv.y > _p.y) && (_uv.y < (_p.y+_s.y)) ? _c : vec3(0), 1. );        
}

vec4 circle(vec2 _uv, vec2 _p, float _d, vec3 _c)
{
    float h = distance(_p,_uv*vec2(1.,1.02));
    
    return vec4( h < _d ? _c - h*5. : vec3(0), 1. ); 
}

void mainImage( out vec4 f, in vec2 fragCoord )
{
	vec2 uv = fragCoord.xy / iResolution.xy;
    
	float t = iGlobalTime + 2.;
    
    float b  = abs(sin(t))*.5; 
    float b2 = sin(t*5.)*.1;
    
    vec2 q  = vec2(tan(t+mod(uv.x,.2)*10.+mod(uv.y,.2)*10. )*.5, cos(t*uv.x)*.5);
         q += vec2(cos(t-mod(uv.x,.2)*10.+mod(uv.y,.2)*10. )*.5, cos(t*uv.y)*.5);

    // bg fx
    f  = vec4( uv.y*.2+max(length( .05/dot(uv-.75+q.x,uv-.75+q.y) -.5),b), .3, .1, 1. );
    f += vec4( max(length( .05/dot(uv-.25+q.x,uv-.25+q.y) -.5),b), .4, .2, 1. );
    
    f += .3*circle(uv, vec2(.50+b*.05,.50 + mod(t-uv.y,.4)*2. ), .170-b*.1, vec3(.5, .5, .5 ) );
    
    // face
    f += circle(uv, vec2(.50+b*.05+b2*.1,.50), .124+mod((t+tan(uv.x*4.+uv.y))*.01,.01)*2., vec3( .4, .2, .25) );
    f += circle(uv, vec2(.50+b*.05,.50),       .170, vec3(1., 1., 1. ) );
    
    // eyes
    f -= circle(uv, vec2(.45,.50), .010+b*.02, vec3(1.,1.,0.) );
    f -= circle(uv, vec2(.55,.50), .010+b*.01, vec3(1.,1.,0.) );
    
    // mouth
    f -= circle(uv, vec2(.5,.45), .026, vec3(1.,1.,0.) );
    f += rect(uv, vec2(.475,.45-b2*.02), vec2(.05,.05), vec3(1.,1.,1.) );
    
    // "3d"
    //f += .01/length(uv-mod(t+tan(uv.x*5.+sin(uv.y*2.)),.4))-.1*uv.y;
}