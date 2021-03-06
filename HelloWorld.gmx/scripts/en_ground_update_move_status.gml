///en_ground_update_move_status(enemy)
enemy = argument0;
range_atk = 240;

// If we reach the final plat and the player ISNT ON IT, set to idle.
if(ds_exists(enemy.route, ds_type_list) && is_undefined(enemy.next_plat)) {
    // the next platform isn't defined.
    // The enemy could have just jumped. If he has, don't set to idling.
    // only set to idling if the enemy is ON THE GROUND.
    // If the player is NOT on the same platform.
    if (enemy.curr_plat != enemy.player_plat && place_meeting(enemy.x, enemy.y+1, obj_surface_parent)) {
        // Set to idling, because the player has outsmarted us.
        enemy.move_status = move_status.idling;
    }
}

if(instance_number(obj_player) > 0) {
    // To smartly move towards the player:
    with(obj_player) {
        other.player_plat = instance_place(obj_player.x, (obj_player.y + 1), obj_surface_parent);
    }
    // Get the instance of the platform that the enemy is on.
    enemy_plat = instance_place(enemy.x, (enemy.y + 1), obj_surface_parent);
    // Check for player platform. If we can find it in the graph, set chasing to true.
    if (en_search_graph(enemy.plat_graph, enemy_plat, player_plat)) {
        enemy.move_status = move_status.chasing;
    } else {
        // we can't find the player's platform
        // IF WE ARE ON THE FINAL PLATFORM
        // This code is here because if the player jumps and the enemy isn't done, it would idle.
        if(ds_exists(route, ds_type_list) && is_undefined(enemy.next_plat)) {
            done_bool = true;
        } else {
            done_bool = false;
        }
        // AND THE PLAYER/ENEMY AREN'T IN THE AIR
        if(place_meeting(obj_player.x, obj_player.y+1, obj_surface_parent) && place_meeting(enemy.x, enemy.y+1, obj_surface_parent) && done_bool) {
            // set to idle.
            enemy.move_status = move_status.idling; 
        }
    }
    
    // We can keep the moving towards the player and the closeness attacking.
    dist = point_distance(enemy.x, enemy.y, obj_player.x, obj_player.y);
    on_ground = place_meeting(enemy.x, enemy.y+1, obj_surface_parent);
    if (on_ground && rest_count <= 0 && dist <= range_atk && enemy.move_status != move_status.attacking) {
        enemy.move_status = move_status.attacking;
        enemy.sprite_index = spr_en_attack1;
        enemy.image_index = 0;
        enemy.swing_index = 1;
    } else if (rest_count > 0 && dist <= range_atk && enemy.move_status != move_status.attacking) {
        enemy.move_status = move_status.idling;
    }
    
    // Return to idle when the player leaves the room.
    with(enemy.range_block) {
        if (!place_meeting(self.x, self.y, obj_player)) {
            other.move_status = move_status.idling;
        }
    }
    
    // If the rest_count is greater than zero, set to idling and decrement.
    if (enemy.rest_count > 0) {
        // self.move_status = move_status.idling;
        enemy.rest_count--;
    }
} else {
    // If player doesn't exist, just idle.
    enemy.move_status = move_status.idling;
}
