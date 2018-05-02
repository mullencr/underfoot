///en_ground_initialize
dir= -1;
grav = 0.3;
vsp = 0;
hsp = 0;
jumpspeed = 15;
original_movespeed = 4;
movespeed = original_movespeed;
scared_of_heights = true;
rest_count = 0;

image_speed = 0.15;
move_status = move_status.idling;

// Initialize current hitbox to empty.
curr_hitbox = noone;
// Initialize route to empty
route = noone;

// Store objects to collide to in an array, 
// so that we can pass by reference later on and reduce processing time.
arr_collide = array_create(2);
arr_collide[0] = obj_wall;
arr_collide[1] = obj_plat_large;

// Initialize the dimensions for later use
en_init_bbox_dimensions(self);

// Range block
range_block = en_get_range_block(self);

// Create the graph
plat_graph = en_init_graphs(self);

// Do output for humans.
key = ds_map_find_first(plat_graph);
for(i = 0; i < ds_map_size(plat_graph); i++) {
    show_debug_message("TOP LEVEL ID: " + string(key));
    sub_map = plat_graph[? key];
    sub_key = ds_map_find_first(sub_map);
    for(j = 0; j < ds_map_size(sub_map); j++) {
        jump_x = ds_list_find_value(sub_map[? sub_key], 0);
        jump_dir = ds_list_find_value(sub_map[? sub_key], 1);
        show_debug_message("    SUB KEY: " + string(sub_key));
        show_debug_message("        jump_x: " + string(jump_x));
        show_debug_message("        jump_dir: " + string(jump_dir));
        sub_key = ds_map_find_next(sub_map, sub_key);
    }
    if(key.object_index == obj_plat_large) {
    key.sprite_index = spr_plat_signal;
    } else {
    key.sprite_index = spr_floor_signal;
    }
    key = ds_map_find_next(plat_graph, key);
}

/*
// Check the structure;
key = ds_map_find_first(plat_graph);
for(i = 0; i < ds_map_size(plat_graph); i++) {
    show_debug_message("TOP LEVEL KEY: " + string(key));
    sub_map = plat_graph[? key];
    sub_key = ds_map_find_first(sub_map);
    for(j = 0; j < ds_map_size(sub_map); j++) {
        val = sub_map[? sub_key];
        show_debug_message("      Sub Level Key: " + string(sub_key));
        show_debug_message("            List Size: " + string(ds_list_size(val)));
        show_debug_message("            Jump_x: " + string(val[| 0]));
        show_debug_message("            Jump_dir: " + string(val[| 1]));
        sub_key = ds_map_find_next(sub_map, sub_key);
    }
    key = ds_map_find_next(plat_graph, key);
}
*/
