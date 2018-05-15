///get_lowest_node(list, ds_nodes)
nodes = argument0;
unvisited = argument1;
lowest_node = noone;
lowest_dist = 1000000;
for(i = 0; i < ds_list_size(unvisited); i++) {
    // get each instance_id
    curr_node = ds_list_find_value(unvisited, i);
    // get the distance to this node.
    curr_dist = ds_list_find_value(nodes[? curr_node], 0);
    if(curr_dist < lowest_dist) {
        lowest_dist = curr_dist;
        lowest_node = curr_node;
    }
}
return lowest_node;
