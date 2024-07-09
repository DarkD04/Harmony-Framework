/// @description Insert description here
// You can write your code in this editor

//Temp value
var c, cx, cy;
	
//Screen values
c = view_camera[view_current]
cx = camera_get_view_x(c)
cy = camera_get_view_y(c)

if(!surface_exists(pausemenu)) pausemenu = surface_create(global.window_width, global.window_height);
surface_set_target(pausemenu);
draw_clear_alpha(c_black, 0);
draw_sprite(background_image,0,0,0);
gpu_set_colorwriteenable(1,1,1,1);

surface_reset_target();

draw_surface(pausemenu,cx,cy);
gpu_set_blendmode(bm_normal)