import std.stdio;

import evael;
import evael.system.asset_loader;
import evael.utils;
import evael.utils.math;
import evael.renderer;
import evael.lib.memory;

void main()
{
    auto game = MemoryHelper.create!Game();

    game.setGameState!(BaseGameState);
    game.run();

    MemoryHelper.dispose(game);
}


class BaseGameState : GameState
{
    private GraphicsCommand command, c2;


    struct CameraData
    {
        mat4 view, projection;
    }

    private UniformResource!CameraData cameraUniform;

    /**
	 * GameState constructor.
	 */
    @nogc
	public this()
	{
        /*auto vb = new VertexBuffer(Vertex3PositionColorTexture.sizeof * 3, 
        [
            Vertex3PositionColorTexture(vec3(-200, 0, 0), Color.White, vec2(0, 0)), 
            Vertex3PositionColorTexture(vec3(0, 200, 0), Color.White, vec2(0, 1)), 
            Vertex3PositionColorTexture(vec3(200, 0, 0), Color.White, vec2(1, 0))
        ].ptr);


        auto vb2 = new VertexBuffer(Vertex3PositionColor.sizeof * 3, 
        [
            Vertex3PositionColor(vec3(-200, 0, 0), Color.White), 
            Vertex3PositionColor(vec3(0, 200, 0), Color.White), 
            Vertex3PositionColor(vec3(200, 0, 0), Color.White)
        ].ptr);

        auto cameraEye = vec3(-45 + 0, 45 + 0, 45 + 0), 
			cameraTarget = vec3(0, 0, 0),
			cameraUp = vec3(0, 1, 0);

        auto cameraData = CameraData(
            lookAtMatrix(cameraEye, cameraTarget, cameraUp),
            orthoMatrix(cast(float)-512, cast(float)512, cast(float)-384, cast(float)384, cast(float)-2000, cast(float)2000)
        );   
        
        auto pipeline = new Pipeline();
        pipeline.shader = AssetLoader.getInstance().load!Shader("./medias/shaders/vertex_color_texture");
        pipeline.addTextureResource(AssetLoader.getInstance().load!Texture("./medias/textures/happy.png"));
        
        this.cameraUniform = pipeline.addUniformResource("cameraData", cameraData);
        this.cameraUniform.view = cameraData.view;
        this.cameraUniform.projection = cameraData.projection;
        this.cameraUniform.update();

        auto modelUniform = pipeline.addUniformResource("modelData", translationMatrix(vec3(0, 140, 0)));

        this.command = new Command(pipeline);
        this.command.vertexBuffer = vb;

        auto p2 = new Pipeline();
        p2.shader = AssetLoader.getInstance().load!Shader("./medias/shaders/vertex_color");
        p2.addUniformResource("modelData", translationMatrix(vec3(0, 30, 0)));
        p2.addUniformResource("cameraData",  CameraData(
            lookAtMatrix(cameraEye, cameraTarget, cameraUp),
            orthoMatrix(cast(float)-512, cast(float)512, cast(float)-384, cast(float)384, cast(float)-2000, cast(float)2000)
        ));

        this.c2 = new Command(p2);
        this.c2.vertexBuffer = vb2;*/
	}

    /**
     * Processes game rendering.
     */
    public override void update(in float interpolation)
    {
       // this.gd.beginFrame(Color.Blue);

       /* this.command.draw!Vertex3PositionColorTexture(0, 3);
        this.c2.draw!Vertex3PositionColor(0, 3);*/
        //this.gd.endFrame();
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