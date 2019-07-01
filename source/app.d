import std.stdio;

import evael.core.Game;
import evael.core.GameState;

import evael.system.WindowSettings;
import evael.system.GLContextSettings;

import evael.utils;
import evael.graphics.GL;;

import evael.graphics.gui2;
import bindbc.glfw;

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

class BaseGameState : GameState
{
    /**
     * Processes game rendering.
     */
    public override void update(in float interpolation)
    {        
        this.m_graphicsDevice.beginScene(Color.LightGrey);

        this.m_game.guiManager.draw();
    }

    /**
     * Processes game logic at fixed time rate.
     */
    public override void fixedUpdate()
    {

    }
    Window w;
    public override void onInit(Variant[] params = null)
    {
        this.m_graphicsDevice.initializeOrthographicProjection(0, 1024, 0, 768);
        this.m_game.guiManager.setFont("./medias/ui/fonts/Roboto-Regular.ttf", 18);
         this.m_game.guiManager.setStyle(Style.Blue);
        
         w = this.m_game.guiManager.createWindow()
            .title("lol")
            .flags(WindowFlags.Title | WindowFlags.Resizable | WindowFlags.Movable)
            .rect(rectf(10, 10, 500, 500));

        w.add(new Button()
            .text("ha")
            .onClick(()  
            {
                writeln("click!");
            })
            .layout(new DynamicLayout())
        );

        string lvl = "easy";
        auto rb = new RadioButton()
            .text("easy")
            .condition(() => lvl == "easy")
            .onSelect(()  
            {
                lvl = "easy";
                writeln("lvl ", lvl);
            })
            .layout(new DynamicLayout(LayoutParams(25, 0, 2)));
        w.add(rb);

        w.add(new RadioButton()
            .text("hard")
            .condition(() => lvl == "hard")
            .onSelect(()
            {
                lvl = "hard";
                writeln("lvl ", lvl);
            })
        );

        w.add(new Property!int()
            .text("Compression:")
            .value(2)
            .min(0)
            .max(100)
            .step(5)
            .onChange((value)
            {
                writeln("Compression: ", value);
            })
            .layout(new DynamicLayout())
        );

        w.add(new Label()
            .text("Background:")
            .alignment(Label.Alignment.Centered)
            .layout(new DynamicLayout())
        );

        w.add(new ColorPicker()
            .color(Color.Red)
            .onSelect((color)
            {
                writeln("Color: ", color);
            })
            .layout(new DynamicLayout())        
        );

        w.add(new ComboBox()
            .add("Hello")
            .add("World")
            .add("!!!")
            .height(25)
            .onSelect((entry)
            {
                writeln("Selected: ", entry);
            })
            .layout(new DynamicLayout())
        );

        w.add(new Input!(InputType.Default)()
            //.text("Hello world!")
            .layout(new DynamicLayout())
        );

        w.add(new Slider()
            .value(50)
            .min(0)
            .max(100)
            .step(1)
            .onChange((value)
            {
                writeln("Slider: ", value);
            })
            .layout(new DynamicLayout())
        );

        w.add(new ProgressBar()
            .value(2)
            .max(1000)
            .type(ProgressBarType.Modifiable)
            .onChange((value)
            {
                writeln("ProgressBar: ", value);
            })
            .layout(new DynamicLayout())
        );

        w.add(new CheckBox()
            .text("Check me!")
            .checked(false)
            .onChange((value)
            {
                writeln("CheckBox: ", value);
            })
            .layout(new DynamicLayout())
        );
    }

    public override void onExit()
    {
        
    }
}
