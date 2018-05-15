///draw_main_gui

// Incrememnt indext
scroll_image_index += scroll_image_speed;
// Get current image
curr_img = scroll_image_index - (scroll_image_index % 1);
draw_sprite_ext(spr_scroll, curr_img, 32, 32, heart_xscale * 1.5, heart_yscale * 1.5, 0, c_white, 1);
// Loop back
if (curr_img == scroll_image_number) {
    scroll_image_index = 0;
}

if (instance_exists(obj_player)) {
    // Draw the hearts
    current_hp = obj_player.hp;
    
    num_full = (current_hp/heart_val) - ((current_hp/heart_val)%1);
    partial_heart_val = current_hp % heart_val;
    buffer = 5;
    x_buff = 61;
    y_buff = 56;
    for (var i = 0; i < num_hearts; i++) {
        if (i < num_full) {
            // draw full
            x_val = (x_buff + (i * (sprite_get_width(spr_heart)+buffer) * heart_xscale) + (3 * heart_xscale));
            draw_sprite_ext(spr_heart, 0, x_val, y_buff, heart_xscale, heart_yscale, 0, c_white, 1);
        } else if (i == num_full) {
            // draw partial
            if (partial_heart_val == 0) {
                img_ind = 3;
            } else if (partial_heart_val < (heart_val/2)) {
                img_ind = 2;
            } else {
                img_ind = 1;
            }
            x_val = (x_buff + (i * (sprite_get_width(spr_heart)+buffer) * heart_xscale) + (3 * heart_xscale));
            draw_sprite_ext(spr_heart, img_ind, x_val, y_buff, heart_xscale, heart_yscale, 0, c_white, 1);
        } else {
            // draw empty
            x_val = (x_buff + (i * (sprite_get_width(spr_heart)+buffer) * heart_xscale) + (3 * heart_xscale));
            draw_sprite_ext(spr_heart, 3, x_val, y_buff, heart_xscale, heart_yscale, 0, c_white, 1);
        }
    }
}

