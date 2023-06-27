function player_collide_object(side, flag = -1){
	//Collision side macros:
	#macro C_MAIN 0
	#macro C_BOTTOM 1
	#macro C_TOP 2
	#macro C_LEFT 3
	#macro C_RIGHT 4
	#macro C_BOTTOM_EXT 5
	#macro C_TOP_EXT 6
	
	//Temp values:
	var player, left, top, right, bottom;
	
	//Get nearest player object:
	for (var i = 0; i < instance_number(obj_player); ++i)
	{
		player[i] = instance_find(obj_player, i)
	
		//Define hitbox size:
		switch(side)
		{
			//Main hitbox:
			case C_MAIN: 
				left = -player[i].wall_w;
				top = -player[i].hitbox_h;
				right = player[i].wall_w;
				bottom = player[i].hitbox_h;
			break;
		
			//Bottom side of the hitbox:
			case C_BOTTOM: 
				left = -player[i].wall_w;
				top = 0;
				right = player[i].wall_w;
				bottom = player[i].hitbox_h + 1;
			break;
		
			//Bottom side of the hitbox:
			case C_BOTTOM_EXT: 
				left = -player[i].wall_w;
				top = 0;
				right = player[i].wall_w;
				bottom = player[i].hitbox_h + 16;
			break;
		
			//Top side of the hitbox:
			case C_TOP: 
				left = -player[i].wall_w;
				top = -player[i].hitbox_h - 1;
				right = player[i].wall_w;
				bottom = 0;
			break;
		
			//Top side of the hitbox:
			case C_TOP_EXT: 
				left = -player[i].wall_w;
				top = -player[i].hitbox_h - 16;
				right = player[i].wall_w;
				bottom = 0;
			break;
		
			//Left side of the hitbox:
			case C_LEFT: 
				left = -player[i].wall_w - 1;
				top = -player[i].hitbox_h;
				right = 0;
				bottom = player[i].hitbox_h;
			break;
		
			//Right side of the hitbox:
			case C_RIGHT:
				left = 0;
				top = -player[i].hitbox_h;
				right = player[i].wall_w + 1;
				bottom = player[i].hitbox_h;
			break;
		}

		//player[i] events:
		with(player[i])
		{
			var col_flag;
			//Flag stuff
			if(flag == -1) col_flag = collision_allow else col_flag = flag;
			//Check for player[i]'s collision with the object:
			if(collision_rectangle(floor(x)+left, floor(y)+top, floor(x)+right, floor(y)+bottom, other, true, true)) 
			{
				if(col_flag)
				{
					return id;
				}
			}
		}
	}
}