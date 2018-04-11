plat_graph = argument0;
enemy_plat = argument1;
player_plat = argument2;
// Create some of the vectors.
visited = ds_list_create();
unvisited = ds_list_create();
// Store the distance, the parent.
nodes = ds_map_create();
plat_key = ds_map_find_first(plat_graph);
for(i = 0; i < ds_map_size(plat_graph); i++) {
    // For each element in the graph
    // Add to unvisited.
    ds_list_add(unvisited, plat_key);
    // add to our nodes list. Store 1000 as infinity, parent is noone.
    dist_info = ds_list_create();
    if(plat_key == enemy_plat) {
        dist_info[| 0] = 0;
    } else {
        dist_info[| 0] = 1000;
    }
    dist_info[| 1] = noone;
    nodes[? plat_key] = dist_info;
    plat_key = ds_map_find_next(plat_graph, plat_key);
}
// Point to our current node.
curr_node = enemy_plat;
// While we don't have a path for the destination node
while(ds_list_find_index(unvisited, player_plat) >= 0) {
    // Move current to visited.
    pos = ds_list_find_index(unvisited, curr_node);
    ds_list_delete(unvisited, pos);
    ds_list_add(visited, curr_node);
    // Find all of the neighbors
    neighbors = plat_graph[? curr_node];
    if(!is_undefined(neighbors)) {
        neighbor_key = ds_map_find_first(neighbors);
        for(i = 0; i < ds_map_size(neighbors); i++) {
            curr_dist = ds_list_find_value(nodes[? curr_node], 0);
            guess_dist = curr_dist + 1;
            neighbor_dist = ds_list_find_value(nodes[? neighbor_key], 0);
            // Calculate the distance from this one, replace if its lower. Point to the parent.
            if(guess_dist <= neighbor_dist) {
                dist_info = ds_list_create();
                ds_list_add(dist_info, guess_dist, curr_node);
                nodes[? neighbor_key] = dist_info;
            }
            neighbor_key = ds_map_find_next(neighbors, neighbor_key);
        }
    }
    // Set the current node to the node in unvisited with the shortest distance.
    curr_node = get_lowest_node(nodes, unvisited);
}

// We have dijkstra's. Now we traverse the list backwards to find the path.
final_path = ds_list_create();
curr_node = player_plat;
while(curr_node != enemy_plat) {
    ds_list_insert(final_path, 0, curr_node);
    // Store the previous as the next node.
    show_debug_message("Curr node is : " + string(curr_node));
    curr_node = ds_list_find_value(nodes[? curr_node], 1);
}
ds_list_insert(final_path, 0, enemy_plat);
return final_path;

