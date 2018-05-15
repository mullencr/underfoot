///en_pathing_controller(enemy)
enemy = argument0;

// Check the end point (where the player is)
// There is only ever one player, so we can use obj_player successfully

// If the player is on a platform, get the instance of that platform.
with(obj_player) {
    other.player_plat = instance_place(obj_player.x, (obj_player.y + 3), obj_surface_parent);
}
// Get the instance of the platform that the enemy is on.
enemy_plat = instance_place(enemy.x, (enemy.y + 1), obj_surface_parent);

// Only run the dijkstra's if it can be reached
// If this method is called, chasing is true.
// If the player is on the ground, run dijkstra's
if (en_search_graph(enemy.plat_graph, enemy_plat, player_plat)) {
    if ((player_plat != noone) && (enemy_plat != noone)) {
        // Get the list of destinations
        output = "path: ";
        route = en_get_plat_route(enemy.plat_graph, enemy_plat, player_plat);
        // append our putput
        for(i = 0; i < ds_list_size(route); i++) {
            inst = ds_list_find_value(route, i);
            output += string(inst) + ", "
        }
        // show_debug_message(output);
    }
} 

// Move the enemy.
if(ds_exists(route, ds_type_list)) {
    // If dijkstra's ran, we can make them follow the path.
    // Route should always start with current plat.
    // Will need curr and start
    curr_plat = ds_list_find_value(route, 0);
    next_plat = ds_list_find_value(route, 1);
    // If we're on the same platform, move towards the player x.
    // If we're on the player platform, next_plat should be undefined.
    if(is_undefined(next_plat)) {
        // show_debug_message("Next plat is NOT DEFINED");
        // Move towards the player.
        if(((enemy.x > obj_player.x && enemy.dir > 0) || (enemy.x < obj_player.x && enemy.dir < 0)) && place_meeting(enemy.x, enemy.y+1, obj_surface_parent) && curr_plat == player_plat && player_plat != noone) {
            // Move towards the player x
            // If our current direction points away from the point, switch it.
            enemy.dir *= -1;
        } /*else {
            show_debug_message("Player NOT ON PLAT");
            if (place_meeting(enemy.x, enemy.y+1, obj_surface_parent))
                show_debug_message("Enemy SUCCESSFULLY IDLING");
                enemy.move_status = move_status.idling;
        }*/
    } else {
        // show_debug_message("Next plat is DEFINED");
        // Otherwise move towards the jump x.
        // Find the jump point for the current platform to the next platform.
        jump_info = ds_map_find_value(enemy.plat_graph[? curr_plat], next_plat);
        jump_x = ds_list_find_value(jump_info, 0);
        jump_dir = ds_list_find_value(jump_info, 1);
        
        // If we need to walk off the edge, jump_x will be noone.
        // Otherwise, business as normal.
        if (jump_x != noone) {
            // If we hit the jump x & we're on the ground.
            next_x = enemy.x + enemy.hsp;
            // Find out if we've passed the jump x    
            left_pass = (next_x <= jump_x && jump_x <= enemy.x);
            right_pass = (enemy.x <= jump_x && jump_x <= next_x);
            if((abs(jump_x - enemy.x) < abs(enemy.hsp)) && place_meeting(enemy.x, enemy.y+1, obj_surface_parent)) {
                // Set the x to the jump x to be sure of correct behaviour.
                enemy.x = jump_x;
                //  if dir is wrong, swap it.
                if (jump_dir != enemy.dir) {
                    enemy.dir *= -1;
                }
                enemy.vsp = -enemy.jumpspeed;
                ds_list_delete(route, 0);
            } else if(((enemy.x > jump_x && enemy.dir > 0) || (enemy.x < jump_x && enemy.dir < 0)) && place_meeting(enemy.x, enemy.y+1, obj_surface_parent)) {
                // Move towards the jump_x.
                // If our current direction points away from the point, switch it.
                enemy.dir *= -1;
            }
        } else {
            // We need to set up the logic to walk off of the edge.
            // If the direction is incorrect, set it.
            enemy.dir = jump_dir;
            // We'll start walking towards the edge. We need to thwart the fear of heights.
            scared_of_heights = false; // This value is checked in the fear of heights function.
            // Once we leave the current plat, we need to clean the status.
            // If we are not on the current platform (in the air or on adjacent
            inst = instance_place(enemy.x, enemy.y+2, obj_surface_parent);
            // Will need to change to start
            if (inst != curr_plat) {
                // Delete the first element, reset our fear of heights.
                ds_list_delete(route, 0);
                scared_of_heights = true;
            }
        }
    }
}
