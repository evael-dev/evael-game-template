import std.stdio;

import evael.core.Game;
import evael.core.GameState;

import evael.system.WindowSettings;
import evael.system.GLContextSettings;

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

class BaseGameState : GameState
{
    /**
     * Processes game rendering.
     */
    public override void update(in float interpolation)
    {
        this.m_graphicsDevice.beginScene(Color.LightGrey);
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
