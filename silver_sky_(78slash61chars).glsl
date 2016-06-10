// silver sky (78/61 chars)
void mainImage(out vec4 f,vec2 p)

// 85 chars
//{f+=(sin(acos(.1/p.y)/3./sin(iDate.a+p.x/p.y)));}

// 80 chars
//{f+=sin(acos(.1/p.y)/3./sin(iDate.a+p.x/p.y));}

// 81 chars (more compatible)
//{f=sin(acos(.1/p)/3./sin(iDate.ww+p/p.y)).xxxx;}

// 78 chars (new version)
{f=(acos(.1/p)/4.+tan(iDate.ww+p/p.y)).xxxx;}

// 61 chars (mini final)
//{f=(sin(iDate+p.x/p.y)).wwww;}
