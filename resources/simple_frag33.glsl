#version 330 core

uniform vec2 uWindowSize;
uniform vec2 uCenter;
uniform float uTime;

out vec3 color;
in vec3 fragmentColor;

void main()
{
    float minDimHalf = min(uWindowSize.x, uWindowSize.y)/2.0;
    float pixDist = distance(gl_FragCoord.xy, uCenter + 30*vec2(sin(uTime), cos(uTime)));
    float distRatio = pixDist/minDimHalf;

    if (pixDist < 20) {
        discard;
    }
    else if (gl_FragCoord.y > uWindowSize.y/2.0) {
        color = vec3(0.0, 0.0, 1.0);
    }
    else {
        color = fragmentColor; 
    }

    color += 1.5*vec3(distRatio, distRatio, distRatio);
}
