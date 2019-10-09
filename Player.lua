Player = Class:extend();

function Player:new(x,y)
    -- posição inicial do submarino em cada fase 
    self.x = x;
    self.y = y;

    -- sprites do submarino (se eu conseguir achar, pq tá foda :s)
    -- table.insert(self.imagens, love.graphics.newImage("assets/imagem/navinha.png"));
    -- self.img = self.imagens[1];
    -- self.width = self.img.getWidth();
    -- self.height = self.img.getHeight();
    self.width = 50;
    self.height = 20;

    -- controles e propriedades do submarino
    self.sobe = "space";
    self.esquerda = "left";
    self.direita = "right";
    self.velocidadeX = 0;
    self.velocidadeY = 100;
    self.aceleracao = 1200;
    self.vidas = 5;
    self.atrito = 0.3;
    k = 0;

end

function Player:update(dt)
    k = dt;
    self.x = self.x + self.velocidadeX*dt;
    self.y = self.y + self.velocidadeY*dt;

    -- atualizando a velocidade horizontal
    if self.velocidadeX < 1 and self.velocidadeX > -1 then
        self.velocidadeX = 0;
    else
        self.velocidadeX = self.velocidadeX*(1-self.atrito);
    end

    -- atualizando a velocidade vertical
    if self.velocidadeY > -7 then
        self.velocidadeY = 80;
    else
        self.velocidadeY = self.velocidadeY*(1-self.atrito);
    end

    -- subindo caso pressione espaço
    if love.keyboard.isDown(self.sobe) then
        self.velocidadeY =  - 4*self.aceleracao*dt;
    
        -- para o caso das diagonais (cima + lado)
        if love.keyboard.isDown(self.direita) then
            self.velocidadeX = self.velocidadeX + self.aceleracao*dt;
        elseif love.keyboard.isDown(self.esquerda) then
            self.velocidadeX = self.velocidadeX - self.aceleracao*dt;
        end
    -- afundando passivamente
    elseif self.velocidadeY == 80 then
        if love.keyboard.isDown(self.direita) then
            self.velocidadeX = self.velocidadeX + self.aceleracao*dt;
        elseif love.keyboard.isDown(self.esquerda) then
            self.velocidadeX = self.velocidadeX - self.aceleracao*dt;
        end
    end

    -- para limitar o sub a tela (devo tirar isso dps, mas agr é pra testar e tem a função pronta :v)
    -- não passa da esquerda
    if self.x < 0 then
        self.x = 0;
        self.velocidadeX = 0;
    -- não passa da direita
    elseif self.x + self.width > widthScreen then
        self.x = widthScreen - self.width;
        self.velocidadeX = 0;
    end 
    -- não passa do topo
    if self.y < 0 then
        self.y = 0;
        self.velocidadeY = 0;
    -- não passa do bottom
    elseif self.y + self.height > heightScreen then
        self.y = heightScreen - self.height;
        self.velocidadeY = 0;
    end
    

end


function Player:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height);
    love.graphics.print("dt = "..k, 20,20)
    love.graphics.print("x = "..self.x, 20,30)
    love.graphics.print("y = "..self.y, 20,40)
    love.graphics.print("l = "..self.width, 20,50)

end