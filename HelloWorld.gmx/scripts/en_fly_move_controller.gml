///en_fly_move_controller
if (instance_number(obj_player) > 0) {
    
    dist = point_distance(self.x, self.y, obj_player.x, obj_player.y);
    show_debug_message("speed: " + string(self.speed));
    if (self.move_status != move_status.stumbled)
        en_fly_update_move_status(self, dist, self.range_shoot, self.range_spot, self.range_atk);
    
    if (self.move_status == move_status.chasing) {
        show_debug_message("enemy is CHASING");
        move_towards_point(obj_player.x, obj_player.y, movespeed);
    } else if (self.move_status == move_status.attacking) {
        speed = 0;
        if(dist >= self.range_spot) {
            en_fly_shoot();
        } else {
            en_fly_hook();
        }
    } else if (self.move_status == move_status.stumbled) {
        en_stumble(spr_en_stumble);
    }
}
