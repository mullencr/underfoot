///en_search_graph(graph, start, end)
// Traverse the graph from the start node to see if our end node is reachable.
graph = argument0;
start = argument1;
dest = argument2;
// queue of visited, unvisited.
visited = ds_list_create();
unvisited = ds_queue_create();
// start with current = start
current = start;
// add current to visited
ds_list_add(visited, current);
// add all current neighbors to unvisited.
neighbors = graph[? current]
if(!is_undefined(neighbors)) {
    n_key = ds_map_find_first(neighbors);
    for(i = 0; i < ds_map_size(neighbors); i++) {
        ds_queue_enqueue(unvisited, n_key);
        n_key = ds_map_find_next(neighbors, n_key);
    }
}
// while there are still things in unvisited
while(ds_queue_size(unvisited) > 0) {
    // pop the front unvisited, add it to visited, and set it to current
    current = ds_queue_dequeue(unvisited);
    if((ds_list_find_index(visited, current)) < 0) {
        // Add it to visited
        ds_list_add(visited, current);
        // add all current neighbors to unvisited.
        neighbors = graph[? current]
        if(!is_undefined(neighbors)) {
            n_key = ds_map_find_first(neighbors);
            for(i = 0; i < ds_map_size(neighbors); i++) {
                ds_queue_enqueue(unvisited, n_key);
                n_key = ds_map_find_next(neighbors, n_key);
            }
        }
    }
}

// at the end, return whether visited contains the end node.
pos = ds_list_find_index(visited, dest);
// it will be -1 if not.
return (pos >= 0);
