function player_handle_tails(){
	//Stop executing if object doesn't exist
	if(!instance_exists(obj_tails_object)) exit;
	
	with(obj_tails_object)
	{
			//Change tails' tail animation depending on players animation
	switch(other.animation)
	{
		case ANIM_STAND:
			visual_angle = 0;
			appear = true;
			facing = other.facing;
			animation = TAIL_1;
		break;
		
		case ANIM_LOOKUP:
			visual_angle = 0;
			appear = true;
			facing = other.facing;
			animation = TAIL_1;
		break;
		
		case ANIM_LOOKDOWN:
			visual_angle = 0;
			appear = true;
			facing = other.facing;
			animation = TAIL_1;
		break;
		
		case ANIM_SPINDASH:
			visual_angle = 0;
			appear = true;
			facing = other.facing;
			animation = TAIL_3;
		break;
		
		case ANIM_ROLL:
			appear = true;
			animation = TAIL_2;
			
			//Rotating tail
			with(obj_player)
			{
				//Rotating by speed
				if(state == ST_JUMP || state == ST_ROLL && !ground)
				{
					if(sign(x_speed) != 0)other.facing = sign(x_speed);
					if(other.facing == 1) other.visual_angle = darctan2(y_speed, -x_speed)-180;
					if(other.facing == -1) other.visual_angle = darctan2(-y_speed, x_speed)-180;
				}
				
				//Ground angle
				if(state = ST_ROLL && ground)
				{
					if(sign(x_speed) != 0)other.facing = sign(x_speed);
					other.visual_angle = ground_angle;		
				}
			}
			break;
		
			default: 
				animation = TAIL_1;
				appear = false;
			break;
		}
	

		//Change image angle
		if(global.rotation_type != 1){
		image_angle = visual_angle;
		}else
		{
			//Legacy angle
			image_angle = round(visual_angle/45)*45;
			
			//Limit rotation
			if(other.state = ST_ROLL && other.ground && other.ground_angle < 45 || other.state = ST_ROLL && other.ground && other.ground_angle > 360-45)  image_angle = 0;
		}
	}
}