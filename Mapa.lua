Mapa = Class:extend();

function Mapa:new()
    
    self.width = self.img.getWidth();
    self.height = self.img.getHeight();

    -- carregando as imagens
    ambiente = {}
    ambiente.img = love.graphics.newImage("/asset/PNG/environment/props.png");
    ambiente.img2 = love.graphics.newImage("/asset/PNG/environment/tiles.png");

    -- MAPA PT1
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


    k = 0;
end 

function Mapa:update(dt)
    k = k+1;
end

function Mapa:draw()
    love.graphics.draw(ambiente.img, mato, 80,200);
    love.graphics.print("a = "..k, 480,50)

end