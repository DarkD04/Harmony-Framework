/// @description Shoot
	animation_play(animator, 3)
	animation_set_frame(animator,0)
	if(state_time == 0){
		var bullet1 = instance_create_depth(x+16,y,depth,obj_bullet_crabmeat)	
		bullet1.x_speed = 1
		bullet1.y_speed = -4
		var bullet2 = instance_create_depth(x-16,y,depth,obj_bullet_crabmeat)	
		bullet2.x_speed = -1
		bullet2.y_speed = -4
	}
	
	state_time++;
	if(state_time > 60) {
		state = 1;	
		facing *= -1;
		walk_distance = 60;
		state_time = 0;
	}