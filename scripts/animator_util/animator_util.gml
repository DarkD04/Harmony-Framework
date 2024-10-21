function animator_create() constructor
{
	animation_current = -1;
	animation_sprite = other.sprite_index;
	animation_frame = 0;
	animation_speed = 0;
	animation_loop_frame = 0;
	animation_loop = true;
	animation_finished = false;
	animation_use_duration = false;
	animation_duration = 0;
	animation_sub_image = 0;
	animation_to_set = 0;
	animator_reset_flag = false;
}

function animator_reset(animator)
{
	animator.animator_reset_flag = true;
}

function animator_update(animator)
{
	if(!animator.animation_use_duration)
	{
		animator.animation_frame += animator.animation_speed;
	}
	else
	{
		
		var new_duration;
		if(is_array(animator.animation_duration))
		{
			var arr_size, result;
				
			arr_size = array_length(animator.animation_duration);
				
			result = min(animator.animation_frame, arr_size - 1);
				
			new_duration = animator.animation_duration[result];
		}
		else
		{
			new_duration = animator.animation_duration;
		}
			if(animator.animation_sub_image < new_duration)
			{
				animator.animation_sub_image++
			}
			else
			{
				animator.animation_frame++
				animator.animation_sub_image = 0;
			}
		
	}
	
	if(animator.animation_frame >= sprite_get_number(animator.animation_sprite))
	{
		if(animator.animation_loop) 
		{
			animator.animation_frame = animator.animation_loop_frame;
		}
		else 
		{
			animator.animation_frame = sprite_get_number(animator.animation_sprite) - 1;
			animator.animation_finished = true;
		}
	}
	

			
	//If current animation is not matching the animation ID, then update it and reset its properties
	if(animator.animator_reset_flag)
	{
		//If animation doesn't exist just don't update anything
		if(animator.animation_to_set <= array_length(list_animation_sprite)-1)
		{
			//Update the current animation
			animator.animation_current = animator.animation_to_set;
		
			//Reset animation's properties
			animator.animation_frame = 0;
			animator.animation_finished = false;
			animator.animator_reset_flag = false;
			
			//Update information from the list
			animator.animation_sprite = list_animation_sprite[animator.animation_to_set];
			animator.animation_speed = list_animation_speed[animator.animation_to_set];
			animator.animation_loop_frame = list_animation_loop_frame[animator.animation_to_set];
			animator.animation_loop = list_animation_loop_flag[animator.animation_to_set];
			animator.animation_use_duration = list_animation_duration_flag[animator.animation_to_set];
			animator.animation_duration = list_animation_duration[animator.animation_to_set];
			animator.animation_sub_image = 0//is_array(animator.animation_duration) ? animator.animation_duration[0] : animator.animation_duration;
		}
	}
	
	
}

function draw_animator(animator, pos_x = floor(x), pos_y = floor(y), x_scale = image_xscale, y_scale = image_yscale, angle = image_angle, color = c_white, alpha = 1)
{
	draw_sprite_ext(animator.animation_sprite, animator.animation_frame, pos_x, pos_y, x_scale, y_scale, angle, color, alpha);
}

function animation_add(animation_id, animation_sprite, animation_speed, animation_loop_frame = 0, animation_loop_flag = true, use_duration = false)
{
	list_animation_sprite[animation_id] = animation_sprite;
	list_animation_loop_frame[animation_id] = animation_loop_frame;
	list_animation_loop_flag[animation_id] = animation_loop_flag;
	list_animation_duration_flag[animation_id] = use_duration;
	list_animation_speed[animation_id] = animation_speed;	
	list_animation_duration[animation_id] = animation_speed;
}

function animation_play(animator, animation_id)
{
	animator.animation_to_set = animation_id;
	
	//If current animation is not matching the animation ID, then update it and reset its properties
	if(animator.animation_current != animation_id)
	{
		//If animation doesn't exist just don't update anything
		if(animation_id > array_length(list_animation_sprite)-1)
		{
			exit;	
		}
		
		//Update the current animation
		animator.animation_current = animation_id;
		
		//Reset animation's properties
		animator.animation_frame = 0;
		animator.animation_finished = false;
		animator.animator_reset_flag = false;
			
		//Update information from the list
		animator.animation_sprite = list_animation_sprite[animator.animation_to_set];
		animator.animation_speed = list_animation_speed[animator.animation_to_set];
		animator.animation_loop_frame = list_animation_loop_frame[animator.animation_to_set];
		animator.animation_loop = list_animation_loop_flag[animator.animation_to_set];
		animator.animation_use_duration = list_animation_duration_flag[animator.animation_to_set];
		animator.animation_duration = list_animation_duration[animator.animation_to_set];
		animator.animation_sub_image = 0;
	}
}

//CHECK FUNCTIONS
function animation_has_finished(animator)
{
	if(animator.animation_finished)
	{
		return true;	
	}
}

function animation_is_playing(animator, animation_id)
{
	if(animator.animation_current == animation_id)
	{
		return true;	
	}
}

function animation_get_current_animation(animator)
{
	return animator.animation_current;
}

function animation_get_sprite(animator)
{
	return animator.animation_sprite;
}

function animation_get_frame(animator)
{
	return animator.animation_frame;	
}

function animation_get_speed(animator)
{
	return animator.animation_speed;
	
	if(animator.animation_use_duration)
	{
		return 0;	
	}
}

function animation_get_frame_count(animator)
{
	return sprite_get_number(animator.animation_sprite);	
}

function animation_get_loop_index(animator)
{
	return animator.animation_loop_frame;
}

function animation_get_duration(animator)
{
	return animator.animation_duration;
	
	if(!animator.animation_use_duration)
	{
		return 0;	
	}
}

function animation_set_speed(animator, animation_speed)
{
	animator.animation_speed = animation_speed;	
}

function animation_set_duration(animator, animation_duration)
{
	animator.animation_duration = animation_duration;	
}

function animation_set_loop_index(animator, loop_frame)
{
	animator.animation_loop_frame = loop_frame;
}

function animation_set_frame(animator, frame)
{
	animator.animation_frame = frame;	
}