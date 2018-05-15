///en_fly_sprite_control
busy = (self.move_status == move_status.attacking or self.move_status == move_status.stumbled)
if (not busy) {
    if(speed != 0)
        sprite_index = spr_en_air_fly;
    else 
        sprite_index = spr_en_air_idle;
} else {
    if (instance_exists(obj_player)) {
        dir = point_direction(x, y, obj_player.x, obj_player.y);
        if (90 < dir and dir < 270)
            image_xscale = abs(image_xscale);
        else
            image_xscale = abs(image_xscale);
    }
}
        
if (90 < direction and direction < 270)
    image_xscale = abs(image_xscale);
else
    image_xscale = -abs(image_xscale);
