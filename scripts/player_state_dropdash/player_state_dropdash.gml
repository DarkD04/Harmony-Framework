function player_state_dropdash(){
	//If global value for dropdash is diabled don't execute
	if(!global.use_dropdash) exit;
	
	//Add dropdash timer
	if(character == CHAR_SONIC)
	{
		if(press_action && dropdash_timer < 1 && state = ST_JUMP ||
		hold_action && dropdash_timer != 0 && state = ST_JUMP)
		{
			dropdash_timer++;
		}
	}
	//Trigger the dropdash state
	if(dropdash_timer >= 8 && state != ST_DROPDASH)
	{
		play_sound(sfx_dropdash);
		state = ST_DROPDASH;
	}
	
	//Reset the timer
	if(state != ST_JUMP || state == ST_DROPDASH || shield != S_NONE && shield != S_NORMAL)
	{
		
		dropdash_timer = 0;
	}
		
	
	//If not dropdash stop
	if(state != ST_DROPDASH) 
	{
		exit;
	}
	
	//Animate dropdash
	animation_play(animator, ANIM_DROPDASH);
	
	//Make it attack
	attacking = true;
	
	//Go back to jump when not holding the button
	if(!hold_action)
	{
		dropdash_timer = -1;
		state = ST_JUMP;
	}
	
	//Land the dropdash
	if(!landed && ground)
	{
		//Dropdash speeds
		var dashspeed = 8.0;
        var maxspeed = 12.0;
		
		if (facing == -1) {
            if(x_speed <= 0.0)
                ground_speed = max(-maxspeed, -dashspeed + (ground_speed / 4.0));
            else if (ground_angle != 0)
                ground_speed = -dashspeed + (ground_speed / 2.0);
            else
                ground_speed = -dashspeed;
        }
        else{
            if (x_speed >= 0.0)
                ground_speed = min(maxspeed, dashspeed + (ground_speed / 4.0));
            else if (ground_angle != 0)
                ground_speed = dashspeed + (ground_speed / 2.0);
            else
                ground_speed = dashspeed;
        }
		
		//Roll state
		state = ST_ROLL; 
		play_sound(sfx_release);
		
		//Camera lag
		obj_camera.h_lag = 8;
		
		//Create effect
		if(global.chaotix_dust_effect)
		{
			for (var i = 0; i < 8; ++i) 
			{
			     create_effect(x - hitbox_w * facing, y + hitbox_h, spr_dust_effect, 0.4, depth-1, (2.5 * facing) * dcos(random_range(180, 270)), 2.5 * dsin(random_range(180, 270)));
			}
		}
		else
		{
			var o = create_effect(floor(x) - hitbox_w * facing, floor(y) + hitbox_h, spr_effects_dropdash_dust, 0.4, depth-1);
			o.image_xscale = facing;
		}
	}
	
}