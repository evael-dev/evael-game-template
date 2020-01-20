#version 330

layout (location = 0) in vec2 Position;
layout (location = 1) in vec4 Color;
layout (location = 2) in vec2 TexCoord;
out vec2 Frag_UV;
out vec4 Frag_Color;

uniform mat4 ProjMtx;

void main() 
{
   Frag_UV = TexCoord;
   Frag_Color = Color;
   gl_Position = ProjMtx * vec4(Position.xy, 0, 1);
}
