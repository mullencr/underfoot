///checkProjCollision
if (collideWall(x, y) || collideFloor(x,y)) {
    direction = direction + 180;
    speed = 0;
    has_hit = true;
}

if (place_meeting(x, y, obj_player)) {
    var my_x = x;
    with(obj_player) {
        playerDamage(other.my_damage, my_x);
    }
    direction = direction + 180;
    speed = 0;
    has_hit = true;
}
