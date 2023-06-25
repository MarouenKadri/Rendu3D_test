#version 330 core
layout (location = 0) in vec3 aPos;
layout (location = 2) in vec2 aTexCoords;
layout (location = 3) in mat4 aInstanceMatrix;

layout (std430, binding = 0) buffer Matrices {
    mat4 modelMatrices[];
};

layout (std430, binding = 1) buffer Colors {
    vec3 colors[];
};


out vec2 TexCoords;
out vec3 Color;

uniform mat4 projection;
uniform mat4 view;

void main()
{
    TexCoords = aTexCoords;
    Color = colors[gl_InstanceID];

    //gl_Position = projection * view * aInstanceMatrix * vec4(aPos, 1.0f); 
    gl_Position = projection * view * modelMatrices[gl_InstanceID] * vec4(aPos, 1.0f); 

}