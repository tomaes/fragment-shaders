// hurt your eyes (108 chars)
// beware, colors depend on viewing date. ;)
void mainImage(out vec4 f,vec2 p)
{f=tan(dot(p*=fract(p.x/4.-iDate.w),sin(240./p))/min(p.x,p.y)+iDate.xyww);}    