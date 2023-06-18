function create_debris(posx, posy, sprite, anim_speed, x_speed, y_speed, anim_frame = 0, grav = 0.2, angle = 0, angle_speed = 0, obj_depth = depth-1, xscale = 1, yscale = 1){
	var debris = instance_create_depth(posx, posy, obj_depth, obj_debris);
	debris.sprite_index = sprite;
	debris.image_speed = anim_speed;
	debris.image_index = anim_frame;
	debris.image_angle = angle;
	debris.image_xscale = xscale;
	debris.image_yscale = yscale;
	debris.angle_speed = angle_speed;
	debris.x_speed = x_speed;
	debris.y_speed = y_speed;
	debris.grav = grav;
}