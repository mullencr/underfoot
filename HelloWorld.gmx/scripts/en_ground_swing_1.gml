///en_ground_swing_1(enemy)
enemy = argument0;

curr_img = self.image_index - (self.image_index % 1);

// Set sprite here.
self.sprite_index = spr_en_attack1;
damage_frame_start = 4;
damage_frame_end = 5;

// For efficiencty:
if (curr_img == damage_frame_end) {
    with (obj_snd_player) {
        sndTHSdmg();
    }
} else if (curr_img == damage_frame_start) {
    with (obj_snd_player) {
        sndMeleeOverSlash();
    }
}

if(self.image_index >= damage_frame_start) {
// Create the hitbox on start
    // Instance create, set the enemy.curr_hitbox to our current hitbox.
    if(self.curr_hitbox == noone) {
        self.curr_hitbox = instance_create(self.x, self.y, hbox_en_ground_swing1);
    }
}

if (self.image_index >= damage_frame_end) {
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
    // Check for collision with the hitbox instance and a player object.
    // Instance place will use the current object, which is enemy.
    // We need to us with
    with (self.curr_hitbox) {
        if (sign(self.image_xscale) != sign(other.image_xscale))
            self.image_xscale *= -1;
        enemy = other.enemy;
        if (place_meeting(self.x, self.y, obj_player)) {
            // It's a hit!
            var my_x = self.x;
            with (obj_player) {
                enemy = other.enemy;
                playerDamage(enemy.meleeDamage1, my_x);
                enemy.has_hit = true;
            }
        }
    }
}

// If we reach the final frame of the animation, set the status to idle for a second or two.
if (curr_img == (image_number - 1))  {
    if (has_hit) {
        enemy.swing_index = 2;
        self.image_index = 0;
        rest_count += 120;
    } else {
        has_hit = false;
        enemy.swing_index = 0;
        rest_count = 120;
        self.move_status = move_status.idling;
    }
}
