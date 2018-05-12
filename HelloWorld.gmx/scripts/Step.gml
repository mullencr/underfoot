///Step

///Movement
en_fear_of_heights(self);
if(self.move_status != move_status.attacking and self.move_status != move_status.stumbled)
    en_ground_update_move_status(self);

if(self.move_status == move_status.idling) {
    movespeed = 0;
} else if (self.move_status == move_status.chasing) {
    movespeed = original_movespeed;
    en_pathing_controller(self);
} else if (self.move_status == move_status.attacking) {
    movespeed = 0;
    en_ground_attack_controller(self);
} else if (self.move_status == move_status.stumbled) {
    movespeed = 0;
    en_ground_do_stumble();
}

/// Movement
hsp = dir * movespeed;
vsp += grav;
en_collision(self);
enemy.x += enemy.hsp;
enemy.y += enemy.vsp;

en_sprite_control(self);

checkHealth();
