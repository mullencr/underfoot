///en_fly_update_move_status(enemy, player, range_spot, range_atk)
enemy = argument0;
dist = argument1;
range_shoot = argument2;
range_spot = argument3;
range_atk = argument4;
if (range_spot < dist && dist <= range_shoot && move_status != move_status.attacking) {
    path_end();
    speed = 0;
    self.sprite_index = spr_en_air_blast;
    image_index = 0;
    enemy.move_status = move_status.attacking;
} else if (range_atk < dist && dist <= range_spot && enemy.move_status != move_status.chasing) {
    path_end();
    speed = movespeed;
    enemy.move_status = move_status.chasing;
} else if (dist <= range_atk && enemy.move_status != move_status.attacking) {
    path_end();
    speed = 0;
    image_index = 0;
    enemy.move_status = move_status.attacking;
}

// Return to idle when the player leaves the room.
with(self.range_block) {
    if (!place_meeting(self.x, self.y, obj_player)) {
        other.move_status = move_status.idling;
    }
}
/* else if (!in_range && enemy.move_status != move_status.idling) {
    path_start(pth_test, movespeed, path_action_continue, false);
    enemy.move_status = move_status.idling;
} */
