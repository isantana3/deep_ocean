function love.load()
    Class = require("classic");

    require("Game");
    require("Player");

    game = Game();
end

function love.update(dt)
    game:update(dt);

end

function love.draw()
    game.draw();

end