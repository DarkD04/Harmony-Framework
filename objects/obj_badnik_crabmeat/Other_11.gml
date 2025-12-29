/// @description Walk left or right
	if (collision_line_check(8, 20, CMODE_FLOOR, PLANE_A, true) && collision_line_check(-8, 20, CMODE_FLOOR, PLANE_A, true)) {
		animation_play(animator, 0, true)	
		steep_side = facing
	} else {
		if (!collision_line_check(8, 20, CMODE_FLOOR, PLANE_A, true)){
			steep_side = 1
			if (facing == 1){
				animation_play(animator, 2, true)
			} else {
				animation_play(animator, 1, true)	
			}
		}
		if (!collision_line_check(-8, 20, CMODE_FLOOR, PLANE_A, true)){
			steep_side = -1
			if (facing == 1){
				animation_play(animator, 1, true)
			} else {
				animation_play(animator, 2, true)	
			}
		}
	}
	
	walk_distance -= abs(x_speed);
	x_speed = move_speed * facing;
	
	if (walk_distance < 0){
		state = 3;
		return;
	}
	
	if (collision_point_check(9 * facing, 0, CMODE_FLOOR, PLANE_A, true)) {
		state = 3;
		return;
	}
	
	if (!collision_line_check(9 * facing, 32, CMODE_FLOOR, PLANE_A, true)) {
		state = 3;
		return;
	}