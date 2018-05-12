///en_fly_move_controller
if (instance_number(obj_player) > 0) {
    
    dist = point_distance(self.x, self.y, obj_player.x, obj_player.y);
    
    if (self.move_status != move_status.attacking and self.move_status != move_status.stumbled)
        en_fly_update_move_status(self, dist, self.range_shoot, self.range_spot, self.range_atk);
    
    if (self.move_status == move_status.chasing) {
        move_towards_point(obj_player.x, obj_player.y, movespeed);
    } else if (self.move_status == move_status.attacking) {
        if(dist >= self.range_spot) {
            en_fly_shoot();
        } else {
            en_fly_hook();
        }
    } else if (self.move_status == move_status.stumbled) {
        en_stumble(spr_en_stumble);
    }
}
