
if (!place_meeting(x,y + 1,par_gumball_solid)){
	y_speed += y_accel;	
	y += y_speed;
	
	var obj = instance_place(x,y,par_gumball_solid) 
	if (obj) {
		y = obj.bbox_top - (sprite_height /2);
	}
	
	
} else {
	y_speed = 0;	
}

var player = obj_player;

if (handle_timer > 0) {
	handle_timer++;
	if (handle_timer < 17) {
		handle_rot = ((handle_dir * handle_timer) / 16) * 180;
	}
	
	if (handle_timer = 17) {
		lid_frame = 0;
		var gumball = instance_create_depth(x, y+64, depth - 1, obj_gumball)
		gumball.reward = gumball_pool[irandom(array_length(gumball_pool)-1)]
		handle_rot = 0;
	}
	
	if (handle_timer > 32) {
		handle_timer = 0;
	}
} 
if (lid_frame != lid_frame_count) {
	lid_timer++;
	if (lid_timer > 4){
		lid_timer = 0;
		lid_frame++;
	}
}

if point_in_rectangle(player.x, player.y, x - 20, (y + 28) - 20,x + 20, (y + 28) + 20){
	if (handle_timer == 0) {
		handle_timer = 1;	
		handle_dir = sign(x - player.x)
		if (handle_dir == 0) {
			handle_dir = 1;	
		}
		play_sound(sfx_handle_pull)
	} 
}

lid_frame = min(lid_frame,lid_frame_count);
lid.x = x;
lid.y = y + 64;
handle.x = x;
handle.y = y + 28;
