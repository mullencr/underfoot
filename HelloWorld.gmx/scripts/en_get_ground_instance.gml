///en_get_ground_instance(enemy)
// Get the instance id for the ground object directly below our enemy.
var enemy = argument0;
var curr_y = enemy.y;
// Until our y hits a ground instance...
var inst = instance_place(enemy.x, curr_y, obj_floor);
while(inst == noone) {
    curr_y += 1;
    inst = instance_place(enemy.x, curr_y, obj_floor);
}
return inst;
