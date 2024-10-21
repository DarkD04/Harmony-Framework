function point_check(radius_x, radius_y, semi_solid = false)
{
	if(!collision_allow) exit;
	return collision_point_check(radius_x, radius_y, mode, plane, semi_solid && platform_check);
}

function line_check(radius_x, radius_y, semi_solid = false, true_mode = mode)
{
	if(!collision_allow) exit;
	return collision_line_check(radius_x, radius_y, mode, plane, semi_solid && platform_check);
}

function angle_sensor(X, Y){
	//Disable collision
	if(!collision_allow) exit;
	
	if(collision_point(floor(X), floor(Y), par_solid, true, true))
	{
		//Get the value from the object with what youre coliding
		var solidCollisions = ds_list_create();
		var SolidCount = collision_point_list(floor(X), floor(Y),par_solid,true,true,solidCollisions,false);
		for (var i = 0; i < SolidCount; i++)
		{
			var Solid =  solidCollisions[| i];
			if(Solid.collision_flag){
				if (Solid.collision_type = "Full Solid" && Solid.collision_layer = "Both Layers"||
				Solid.collision_type = "Full Solid" && Solid.collision_layer = "Layer A" && plane = 0 ||
				Solid.collision_type = "Full Solid" && Solid.collision_layer = "Layer B" && plane = 1 ||
				Solid.collision_type = "Semi Solid" && Solid.platform_check)
				{
					ds_list_destroy(solidCollisions);
					return true;
				}
			}
		}
		ds_list_destroy(solidCollisions);
	}
	//Get the size of collision layer array:
	var a_col = array_length(global.col_tile);
	
	//Handle tile collision (Native GameMaker implementation):
	for (var i = 0; i < a_col; ++i) 
	{
	    //Check if given layers exist(Prevents console output from spamming non existing layer):
		if(layer_exists(global.col_tile[i]))
		{
			//Colide with the tile layer:
			if(collision_point(floor(X), floor(Y), layer_tilemap_get_id(global.col_tile[i]), true, true))
			{
				
				//Different layers collide depending on different behaviour:
				switch(i)
				{
					//Full solid:
					case 0:
						return true;
					break;
					
					//Semi solid:
					case 1:
						if(platform_check) return true;
					break;
					
					//Full solid layer A:
					case 2:
						if(plane == 0) return true;
					break;
					
					//Full solid layer B:
					case 3:
						if(plane == 1) return true;
					break;
					
					//Full solid layer C[EVIL]:
					case 4:
						if(plane == 2) return true;
					break;
				}
			}
		}
	}
}

function check_object(x1, y1, x2, y2, semi_solid = false)
{
	//Disable collision
	if(!collision_allow) exit;
	
	//Trigger the collision
	if collision_rectangle(floor(x)-x1,floor(y)-y1,floor(x)+x2,floor(y)+y2,par_solid_object,true,true){
		
		//Get the value from the object with what youre coliding
		var solidCollisions = ds_list_create();
		var SolidCount = collision_rectangle_list(floor(x)-x1,floor(y)-y1,floor(x)+x2,floor(y)+y2,par_solid_object,true,true,solidCollisions,false);
		for (var i = 0; i < SolidCount; i++)
		{
			var Solid =  solidCollisions[| i];
			if(Solid.collision_flag){
				if (Solid.collision_type = "Full Solid" || Solid.collision_type = "Semi Solid" && semi_solid && y < Solid.bbox_top+(y-yprevious) && mode == 0)
				{
					ds_list_destroy(solidCollisions);
					return Solid;
				}
			}
		}
		ds_list_destroy(solidCollisions);
	}
}

function draw_col_line(radius_x, radius_y, true_mode = mode){
	//Disable collision
	if(!collision_allow) exit;
	
	var X1, X2, Y1, Y2;
	switch(true_mode){
		case 0: X1 = radius_x Y1 = 0 X2 = radius_x Y2= radius_y break;
		case 1: X1 = 0 Y1 = -radius_x X2 = radius_y Y2= -radius_x break;
		case 2: X1 = radius_x Y1 = 0 X2 = radius_x Y2= -radius_y-1 break;
		case 3: X1 = 0 Y1 = radius_x X2 = -radius_y-1 Y2= radius_x break;
	}	
	
	draw_line(floor(x)+X1,floor(y)+Y1,floor(x)+X2,floor(y)+Y2);
}

function draw_col_line_wall(radius_x, radius_y, true_mode = mode){
	//Disable collision
	if(!collision_allow) exit;
	
	var X1, X2, Y1, Y2;
	switch(true_mode){
		case 3: X1 = radius_x Y1 = 0 X2 = radius_x Y2= radius_y break;
		case 0: X1 = 0 Y1 = -radius_x X2 = radius_y Y2= -radius_x break;
		case 1: X1 = radius_x Y1 = 0 X2 = radius_x Y2= -radius_y-1 break;
		case 2: X1 = 0 Y1 = radius_x X2 = -radius_y-1 Y2= radius_x break;
	}	
	
	draw_line(floor(x)+X1,floor(y)+Y1,floor(x)+X2,floor(y)+Y2);
}

