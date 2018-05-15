///get_next_node(ds_map)
// return the next node to be checked for child plats.
// if we're done, return -1;
graph = argument0;
key = ds_map_find_first(graph);
// For every plat in the map
for(i = 0; i < ds_map_size(graph); i++) {
    // Check every child in the sub map.
    sub_map = graph[? key];
    sub_key = ds_map_find_first(sub_map);
    for(j = 0; j < ds_map_size(sub_map); j++) {
        // If that child doesn't have an entry of its own, we havent' checked it yet
        // That means we're not done.
        if (!ds_map_exists(graph, sub_key)) {
            return sub_key;
        }
        sub_key = ds_map_find_next(sub_map, sub_key);
    }
    key = ds_map_find_next(graph, key);
}
// If we've reached here, every sub key exists as its own super key.
// we're done, return -1.
return -1;
