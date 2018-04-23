///en_node_walk_off_right(plat)
// How to walk off of an edge?
// Start at plat origin.
// Move one way continuously until we're not on a platform anymore.
// Once we're off of the platform (in the air), we're moving down.
// We fall until we collide with another platform.
// On collision, check to see if there's an entry for the collided platform.
// If so, don't add it.
// If not, add it with a jump_x of noone and an accurate jump dir.
// Reverse the direction and repeat once.
return noone;

