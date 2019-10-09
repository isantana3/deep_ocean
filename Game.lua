Game = Class:extend();

function Game:new()
    widthScreen = love.graphics.getWidth();
    heightScreen = love.graphics.getHeight();

    submarine = Player(widthScreen/2, heightScreen/2);
    -- mapa = Mapa(13);
    background = {}
    background.img = love.graphics.newImage("/asset/PNG/environment/background.png");
    teste = {}
    teste.img = love.graphics.newImage("/asset/PNG/environment/props.png");
    teste.img2 = love.graphics.newImage("/asset/PNG/environment/tiles.png");

    --INIMIGO: MINA
    mine = {}
    mine.img1 = love.graphics.newImage("/asset/PNG/enemies/mine-big.png");
    mine.img2 = love.graphics.newImage("/asset/PNG/enemies/mine.png");
    mine.img3 = love.graphics.newImage("/asset/PNG/enemies/mine-small.png");

    --MAPA PT1
    totem = love.graphics.newQuad(298,20, 58,117, 512, 250);
    alga = love.graphics.newQuad(305,158, 28,36, 512, 250);
    galho = love.graphics.newQuad(256,164, 26,30, 512, 250);
    mato = love.graphics.newQuad(217,167, 24,27, 512, 250);
    
   -- MAPA PT2
    teto1 = love.graphics.newQuad(16,15, 80,64, 480, 656);
    teto2 = love.graphics.newQuad(112,15, 80,65, 480, 656);
    gnd1 = love.graphics.newQuad(16,105, 178,70, 480, 656);
    gnd2 = love.graphics.newQuad(208,117, 80,60, 480, 656);
    gnd3 = love.graphics.newQuad(320,115, 81,62, 480, 656);
    parede1 = love.graphics.newQuad(271,15, 48, 80, 480, 656);
    parede2 = love.graphics.newQuad(207,15, 48, 80, 480, 656);
    porta1 = love.graphics.newQuad(323,15, 62, 80, 480, 656);
    porta2 = love.graphics.newQuad(398,15, 62, 80, 480, 656);



end 

function Game:update(dt)
    submarine:update(dt);
    --mapa:update(dt);
end

function Game:draw()
    love.graphics.draw(background.img, 0, 0);
    --mapa:draw();
    submarine:draw();

end

function checarColisao(A, B)
    if A.x < B.x + B.largura and
        A.x + A.largura > B.x and
        A.y < B.y + B.altura and
        A.y + A.altura > B.y then
        return true
    end
end



