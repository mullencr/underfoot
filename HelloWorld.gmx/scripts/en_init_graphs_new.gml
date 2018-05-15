///en_init_graphs(enemy)
var enemy = argument0;
    
// For Dijkstra's, we need a list of plats & their connections. Store lists in a dictionary.
// Each plat MUST store its jump location to each other. This must have:
// A from plat, a to plat, a jump_x, and a jump_dir.
/*
  { from_plat => { to_plat => [jump_x, jump_dir] } }
  {
    1 => {  2 => [jump_x, dir],
            3 => [jump_x, dir], 
            4 => [jump_x, dir]  }
    2 => {  1 => [jump_x, dir],
            3 => [jump_x, dir]  }
    3 => {  4 => [jump_x, dir], 
            5 => [jump_x, dir]  }
  }
*/
// Create a master sub_structure.
var master_graph = ds_map_create();
// Use ground platforms as initializations for our graph development alg.
// Add an entry to the master ds that stores the instance id of the ground obj
    // pointing to a map of the ground accessible platforms and their associated info
var ground_map = en_get_ground_access(enemy);
var ground_id = en_get_ground_instance(enemy);

master_graph[? ground_id] = ground_map;
// For each platform in each sub-structure.
// If the ds doesn't have an entry for that platform, start traversal. 
var plat = get_next_node(master_graph);
while(plat >= 0) {
    // start at the origin for the platform.
    var node_map = en_get_node_children(enemy, plat);
    // add this sub list to the master list.
    master_graph[? plat] = node_map;
    // repeat.
    plat = get_next_node(master_graph);
}
return master_graph;
