function player_collide_object(side){
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
	var player = instance_nearest(x, y, obj_player);
	
	//Define hitbox size:
	switch(side)
	{
		//Main hitbox:
		case C_MAIN: 
			left = -player.wall_w;
			top = -player.hitbox_h;
			right = player.wall_w;
			bottom = player.hitbox_h;
		break;
		
		//Bottom side of the hitbox:
		case C_BOTTOM: 
			left = -player.wall_w;
			top = 0;
			right = player.wall_w;
			bottom = player.hitbox_h + 1;
		break;
		
		//Bottom side of the hitbox:
		case C_BOTTOM_EXT: 
			left = -player.wall_w;
			top = 0;
			right = player.wall_w;
			bottom = player.hitbox_h + 16;
		break;
		
		//Top side of the hitbox:
		case C_TOP: 
			left = -player.wall_w;
			top = -player.hitbox_h - 1;
			right = player.wall_w;
			bottom = 0;
		break;
		
		//Top side of the hitbox:
		case C_TOP_EXT: 
			left = -player.wall_w;
			top = -player.hitbox_h - 16;
			right = player.wall_w;
			bottom = 0;
		break;
		
		//Left side of the hitbox:
		case C_LEFT: 
			left = -player.wall_w - 1;
			top = 1;
			right = 0;
			bottom = 5;
		break;
		
		//Right side of the hitbox:
		case C_RIGHT:
			left = 0;
			top = 1;
			right = player.wall_w + 1;
			bottom = 5;
		break;
	}
	
	//Player events:
	with(player)
	{
		//Check for player's collision with the object:
		if(collision_rectangle(floor(x)+left, floor(y)+top, floor(x)+right, floor(y)+bottom, other, true, true) && collision_allow) return true;
	}
}