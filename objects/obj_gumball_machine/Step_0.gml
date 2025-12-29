
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
	handle_rot += 5.25;
	
	if(handle_timer = 15) {
		lid_frame = 0;
		var gumball = instance_create_depth(x, y+64, depth - 1, obj_gumball)
		gumball.reward = gumball_pool[irandom(array_length(gumball_pool)-1)]
	}
	
	if (handle_timer > 35) {
		handle_rot = 0;
		handle_timer = 0
	}
} else {
	if (FRAME_TIMER mod 4 == 0 && lid_frame < 2) {
		lid_frame++	
	}
}

if point_in_rectangle(player.x, player.y, x - 16, (y + 28) - 16,x + 16, (y + 28) + 16){
	if (handle_timer == 0) {
		handle_timer = 1;	
		play_sound(sfx_handle_pull)
	} 
}

lid_frame = min(lid_frame,2)
lid.x = x
lid.y = y + 64
handle.x = x
handle.y = y + 28
