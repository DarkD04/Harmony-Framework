	//Temp values
	var player;
	
	//Get player
	player = instance_nearest(x, y, obj_player);
	
	//Reset collision flag
	collision_flag = true;	
	
	//Collision flag changes
	if(player.x + player.wall_w > bbox_left && player.x - player.wall_w < bbox_right && player.y + player.hitbox_h + abs(player.y_speed)+2 > bbox_top
	&& player.attacking && player.y_speed > 0)
	{
		collision_flag = false;	
	}
	
	//Destroy the block
	if(player_collide_object(C_MAIN) && !collision_flag)
	{
		player.y_speed = abs(player.y_speed)*-1;
		instance_destroy();	
	}
	
	if(!on_screen()) instance_deactivate_object(id);