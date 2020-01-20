#version 330 core
 
layout (location = 0) in vec3 in_position;
layout (location = 1) in vec4 in_color;
layout (location = 2) in vec2 in_textureCoord;

out vec4 color;
out vec2 textureCoord;

layout (std140) uniform cameraData
{
    mat4 view;
    mat4 projection;
};

layout (std140) uniform modelData
{
    mat4 model;
};

void main()
{
    gl_Position = projection * view * model * vec4(in_position, 1.0);
    color = in_color;
    textureCoord = in_textureCoord;
}