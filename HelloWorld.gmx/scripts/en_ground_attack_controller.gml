///en_ground_attack_controller
// Decide on attack

// Set sprite here.
self.sprite_index = spr_en_idle;
damage_frame_start = 3;
damage_frame_end = 6;

// For efficiencty:
if(self.image_index >= damage_frame_start) {
// Create the hitbox on start
    // Instance create, set the enemy.curr_hitbox to our current hitbox.
    if(self.curr_hitbox == noone) {
        self.curr_hitbox = instance_create(self.x, self.y, hbox_en_ground_swing1);
    }
} else if (self.image_index >= damage_frame_end) {
// Destroy it on end.
    // Destroy the hitbox instance, set enemy.curr_hitbox to noone.
    if(self.curr_hitbox != noone) {
        instance_destroy(self.curr_hitbox);
        self.curr_hitbox = noone;
    }
}

// Check if we have a hitbox.
if (self.curr_hitbox != noone) {
    // If there is a hitbox instance assigned, we're in the correct frames.
    // create a hitbox check for collision with player
}

// If we reach the final frame of the animation, set the status
// to idle for a second or two.
if (self.image_index > self.image_number)  {
    rest_count = 21;
    self.move_status = move_status.idling;
}
// TODO: Add check for rest count to update_move_status
