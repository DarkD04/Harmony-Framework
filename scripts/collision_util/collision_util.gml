function point_check(radius_x, radius_y, semi_solid = false){
	//Disable collision
	if(!collision_allow) exit;
	
	if(collision_point(floor(x)+radius_x*y_dir+radius_y*x_dir, floor(y)+radius_y*y_dir+radius_x*-x_dir, par_solid, true, true))
	{
		//Get the value from the object with what youre coliding
		var solidCollisions = ds_list_create();
		var SolidCount = collision_point_list(floor(x)+radius_x*y_dir+radius_y*x_dir, floor(y)+radius_y*y_dir+radius_x*-x_dir,par_solid,true,true,solidCollisions,false);
		for (var i = 0; i < SolidCount; i++)
		{
			var Solid =  solidCollisions[| i];
			if(Solid.collision_flag){
				if (Solid.collision_type = "Full Solid" && Solid.collision_layer = "Both Layers"||
				Solid.collision_type = "Full Solid" && Solid.collision_layer = "Layer A" && plane = 0 ||
				Solid.collision_type = "Full Solid" && Solid.collision_layer = "Layer B" && plane = 1 ||
				Solid.collision_type = "Semi Solid" && Solid.platform_check && semi_solid)
				{
					ds_list_destroy(solidCollisions);
					return true;
				}
			}
		}
		ds_list_destroy(solidCollisions);
	}
	
	//Tile collision
	if(layer_exists(global.col_tile[0]) || layer_exists(global.col_tile[1]) ||
	layer_exists(global.col_tile[2]) || layer_exists(global.col_tile[3]))
	{
		if(collision_point(floor(x)+radius_x*y_dir+radius_y*x_dir, floor(y)+radius_y*y_dir+radius_x*-x_dir, layer_tilemap_get_id(global.col_tile[0]), true, true) ||
		collision_point(floor(x)+radius_x*y_dir+radius_y*x_dir, floor(y)+radius_y*y_dir+radius_x*-x_dir, layer_tilemap_get_id(global.col_tile[1]), true, true) && platform_check && semi_solid||
		collision_point(floor(x)+radius_x*y_dir+radius_y*x_dir, floor(y)+radius_y*y_dir+radius_x*-x_dir, layer_tilemap_get_id(global.col_tile[2]), true, true) && plane = 0||
		collision_point(floor(x)+radius_x*y_dir+radius_y*x_dir, floor(y)+radius_y*y_dir+radius_x*-x_dir, layer_tilemap_get_id(global.col_tile[3]), true, true) && plane = 1) 
		{
			return true;
		}
	}
	
	//Debug sensor draw
	draw_point(floor(x)+radius_x*y_dir+radius_y*x_dir, floor(y)+radius_y*y_dir+radius_x*-x_dir);
	
	
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
	//Tile collision
	if(layer_exists(global.col_tile[0]) || layer_exists(global.col_tile[1]) ||
	layer_exists(global.col_tile[2]) || layer_exists(global.col_tile[3]))
	{
		if(collision_point(floor(X), floor(Y), layer_tilemap_get_id(global.col_tile[0]), true, true) ||
		collision_point(floor(X), floor(Y), layer_tilemap_get_id(global.col_tile[1]), true, true) && platform_check ||
		collision_point(floor(X), floor(Y), layer_tilemap_get_id(global.col_tile[2]), true, true) && plane = 0||
		collision_point(floor(X), floor(Y), layer_tilemap_get_id(global.col_tile[3]), true, true) && plane = 1) 
		{
			return true;
		}
	}
}

function line_check(radius_x, radius_y, semi_solid = false){
	//Disable collision
	if(!collision_allow) exit;
	
	var X1, X2, Y1, Y2;
	switch(mode){
		case 0: X1 = radius_x Y1 = 0 X2 = radius_x Y2= radius_y break;
		case 1: X1 = 0 Y1 = -radius_x X2 = radius_y Y2= -radius_x break;
		case 2: X1 = radius_x Y1 = 0 X2 = radius_x Y2= -radius_y-1 break;
		case 3: X1 = 0 Y1 = radius_x X2 = -radius_y-1 Y2= radius_x break;
	}	
	
	//Trigger the collision
	if collision_line(floor(x)+X1,floor(y)+Y1,floor(x)+X2,floor(y)+Y2,par_solid,true,true){
		
		//Get the value from the object with what youre coliding
		var solidCollisions = ds_list_create();
		var SolidCount = collision_line_list(floor(x)+X1,floor(y)+Y1,floor(x)+X2,floor(y)+Y2,par_solid,true,true,solidCollisions,false);
		for (var i = 0; i < SolidCount; i++)
		{
			var Solid =  solidCollisions[| i];
			if(Solid.collision_flag){
				if (Solid.collision_type = "Full Solid" && Solid.collision_layer = "Both Layers"||
				Solid.collision_type = "Full Solid" && Solid.collision_layer = "Layer A" && plane = 0 ||
				Solid.collision_type = "Full Solid" && Solid.collision_layer = "Layer B" && plane = 1 ||
				Solid.collision_type = "Semi Solid" && semi_solid && Solid.platform_check)
				{
					ds_list_destroy(solidCollisions);
					return true;
				}
			}
		}
		ds_list_destroy(solidCollisions);
	}
	
	//Tile collision
	if(layer_exists(global.col_tile[0]) || layer_exists(global.col_tile[1]) ||
	layer_exists(global.col_tile[2]) || layer_exists(global.col_tile[3]))
	{
		if(collision_line(floor(x)+X1, floor(y)+Y1, floor(x)+X2, floor(y)+Y2, layer_tilemap_get_id(global.col_tile[0]), true, true) ||
		collision_line(floor(x)+X1, floor(y)+Y1, floor(x)+X2, floor(y)+Y2, layer_tilemap_get_id(global.col_tile[1]), true, true) && platform_check && semi_solid||
		collision_line(floor(x)+X1, floor(y)+Y1, floor(x)+X2, floor(y)+Y2, layer_tilemap_get_id(global.col_tile[2]), true, true) && plane = 0||
		collision_line(floor(x)+X1, floor(y)+Y1, floor(x)+X2, floor(y)+Y2, layer_tilemap_get_id(global.col_tile[3]), true, true) && plane = 1) 
		{
			return true;
		}
	}
	
	draw_line(floor(x)+X1,floor(y)+Y1,floor(x)+X2,floor(y)+Y2);
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
				if (Solid.collision_type = "Full Solid" || Solid.collision_type = "Semi Solid" && semi_solid && y < Solid.bbox_top+(y-yprevious) && y_speed >= 0)
				{
					ds_list_destroy(solidCollisions);
					return Solid;
				}
			}
		}
		ds_list_destroy(solidCollisions);
	}
}