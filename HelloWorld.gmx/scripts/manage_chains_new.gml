///manage_chains

if (!instance_exists(obj_player)) {
    hook_self_destruct();
} else {
    
    // Each step, we need to get the origin point of the hook.
    // This is the adjusted x and y of the enemy.
    origin_x = self.thrower.x - (23 * sign(self.thrower.image_xscale));
    origin_y = self.thrower.y;
    // Once we have the origin point, we can get the direction and the distance.
    dir = point_direction(x, y, origin_x, origin_y);
    dist = point_distance(x, y, origin_x, origin_y);
    
    // Once we have the direction and the distance, we can divide by sprite width to get number of chains
    num_links = dist / sprite_get_width(spr_chain_link);
    while (ds_list_size(self.links) < num_links) {
        ds_list_add(self.links, instance_create(0, 0, obj_link));
    }
    while (ds_list_size(self.links) > num_links) {
        instance_destroy(self.links[| 0]);
        ds_list_delete(self.links, 0);
    }
    // Once we have correct number of chain links, we can begin reworking the coordinates.
    // Calculate the rise and run to go along the angle we have the width amount of distance
    hypo = sprite_get_width(spr_chain_link);
    rise = hypo * sin(degtorad(dir));
    run = hypo * cos(degtorad(dir));
    for (var i = 0; i < ds_list_size(self.links); i++) {
        // For each one, set the current location to be i * rise and i * run away from the origin of the hook
        self.links[| i].x = self.x + (run * i);
        self.links[| i].y = self.y - (rise * i);
        // Adjust the rotation to be dir.
        self.links[| i].image_angle = dir + 180;
    }
    
    if (dist > 400) {
        hook_self_destruct();
    }
}
