///checkProjCollision
if (place_meeting(x, y, obj_surface_parent)) {
    direction = direction + 180;
    speed = 0;
    has_hit = true;
}

if (place_meeting(x, y, obj_player)) {
    with(obj_player) {
        playerDamage(obj_en_fly.projectile_damage);
    }
    direction = direction + 180;
    speed = 0;
    has_hit = true;
}
