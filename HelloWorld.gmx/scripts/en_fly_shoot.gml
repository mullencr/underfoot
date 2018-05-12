///en_fly_shoot
self.speed = 0;
if (rest_count <= 0) {
    instance_create(x, y, obj_en_projectile);
    rest_count = 120;
} else {
    rest_count--;
}
