/// @description Insert description here
// You can write your code in this editor

	if(obj_player.x >= x)
	{
		with(par_background)
		{
			for(var i = 0; i <= bg_id; i++)
			{
				offset_x[i] -= (obj_player.x - obj_loop_start.x) * (1-factor_x[i]);
			}
		}
		obj_camera.target_x -= obj_player.x - obj_loop_start.x;
		obj_player.x -= obj_player.x - obj_loop_start.x;
	
	}