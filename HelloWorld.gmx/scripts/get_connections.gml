///get_connections

// Get all connected platforms.
// How? Similar to traversal.
visited = ds_list_create();
unvisited = ds_list_create();
curr = self;
ds_list_add(unvisited, curr);
while (ds_list_size(unvisited) > 0) {
    // While unvisited is not empty, pop the first unvisited and add it to visited.
    curr = unvisited[| 0];
    ds_list_delete(unvisited, 0);
    ds_list_add(visited, curr);
    // get the place meetings.
    with (curr) {
        other.adjacent = instance_place_list(x, y, obj_floor);
    }
    for (var i = 0; i < ds_list_size(adjacent); i++) {
        // If they're already in either array, don't add them. If they're not, add them to unvisited.    
        if ((ds_list_find_index(visited, adjacent[| i]) != -1) and (ds_list_find_index(unvisited, adjacent[| i]))) {
            ds_list_add(unvisited, adjacent[| i]);
        }
    }        
}

self.connections = visited;

// All in visisted should be our list. Add them to a ds.
