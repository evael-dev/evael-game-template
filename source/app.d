import std.stdio;

import evael.core.game;
import evael.core.game_state;

import evael.system.window_settings;
import evael.system.gl_context_settings;

import evael.utils;

void main()
{
    auto windowSettings = WindowSettings();
    windowSettings.title = "My D Game";
    windowSettings.fullscreen = false;
    windowSettings.resolution = Size!int(1024, 768);

    auto game = new Game(windowSettings);

    game.setGameState!(BaseGameState);
    game.run();
    game.dispose();
}

import evael.renderer;
import evael.lib.memory;

class BaseGameState : GameState
{
    private GraphicsDevice gd;
    private GraphicsCommand command;

    struct PC
    {
        @ShaderAttribute(0, AttributeType.Float, 3, false)
        float[3] position;
    }

    /**
	 * GameState constructor.
	 */
	public this()
	{
        this.gd = MemoryHelper.create!GraphicsDevice();
        this.command = this.gd.createCommand();


        auto vb = this.gd.createBuffer(BufferType.Vertex, PC.sizeof * 3);


//        PC[3] data = [PC([0, 0], [1, 0, 0]), PC([1, 1], [0, 1, 0]), PC([1, 0], [0, 0, 1])];
        PC[3] data = [PC([0, 0, 0]), PC([1, 1, 0]), PC([1, 0, 0])];

        this.gd.updateBuffer(vb, 0, PC.sizeof * 3, &data);

        auto shader = this.gd.createShader(
q{
    #version 330 core
    layout (location = 0) in vec3 aPos; // the position variable has attribute position 0
    
    out vec4 vertexColor; // specify a color output to the fragment shader

    void main()
    {
        gl_Position = vec4(aPos, 1.0); // see how we directly give a vec3 to vec4's constructor
        vertexColor = vec4(0.5, 0.0, 0.0, 1.0); // set the output variable to a dark-red color
    }
},
q{ 
    #version 330 core
    out vec4 FragColor;
    
    in vec4 vertexColor; // the input variable from the vertex shader (same name and same type)  

    void main()
    {
        FragColor = vertexColor;
    }
});
        
        auto pipeline = new GraphicsPipeline();
        pipeline.shader = shader; 

        this.command.vertexBuffer = vb;
        this.command.pipeline = pipeline;

        debug
        {
            import std.stdio;
            writeln(vb);
        }
	}

    /**
     * Processes game rendering.
     */
    public override void update(in float interpolation)
    {
        this.command.clearColor(Color.Red);

        this.command.draw!PC(0, 3);
       // this.command.lol();
    }

    /**
     * Processes game logic at fixed time rate.
     */
    public override void fixedUpdate()
    {

    }

    public override void onInit(Variant[] params = null)
    {

    }

    public override void onExit()
    {
        
    }
}