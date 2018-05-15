///InitPath
movespeed = 2;
range_shoot = 800;
range_spot = 400;
range_atk = 200;
range_block = en_get_range_block(self);
rest_count = 0;
projectile_damage = 10;
proj_scale = 3;
blast_speed = 5;
hook = noone;
hook_speed = 6;
hook_thrown = false;
hold_count = 180;
image_speed = 0.1;
speed = movespeed;
path_start(pth_test, speed, path_action_continue, false);
