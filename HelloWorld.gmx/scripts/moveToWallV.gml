/// moveToWallV(vsp)
while (!collideTerrain(x, y + sign(argument0)))
        y += sign(argument0);
        
while (collideStairL(x-1,y))
    x += 1;
    
while (collideStairR(x+1,y))
    x -= 1;
