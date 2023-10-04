function obj_check_rect(X1, Y1, X2, Y2, SemiSolid = true){
	//Trigger the collision
	var col = collision_rectangle(floor(x)+X1,floor(y)+Y1+1,floor(x)+X2,floor(y)+Y2+1,par_solid,true,true)
		
	if(col)
	{
		if(col.collision_flag)
		{
			if (col.collision_type = "Full Solid" || col.collision_type = "Semi Solid" && SemiSolid = true)
			{
					return true;
			}
		}
	}	
	
	
	//Beta
	if(layer_exists(global.col_tile[0]) || layer_exists(global.col_tile[1]))
	{
		if(collision_rectangle(floor(x)+X1,floor(y)+Y1+1,floor(x)+X2,floor(y)+Y2+1,layer_tilemap_get_id(global.col_tile[0]),true,true) ||
		collision_rectangle(floor(x)+X1,floor(y)+Y1+1,floor(x)+X2,floor(y)+Y2+1,layer_tilemap_get_id(global.col_tile[1]),true,true) && SemiSolid = true)
		{
			return true;
		}
	}
}

function obj_check_point(X, Y, SemiSolid = true){
	
	var col = collision_point(X, Y,par_solid,true,true);
	
	if(col)
	{
		if(col.collision_flag)
		{
			if (col.collision_type = "Full Solid" || col.collision_type = "Semi Solid" && SemiSolid = true)
			{
					return true;
			}
		}
	}
	
	//Beta
	if(layer_exists(global.col_tile[0]) || layer_exists(global.col_tile[1]))
	{
		if(collision_point(X, Y,layer_tilemap_get_id(global.col_tile[0]),true,true) ||
		collision_point(X, Y,layer_tilemap_get_id(global.col_tile[1]),true,true) && SemiSolid = true)
		{
			return true;
		}
	}
}

function obj_check_line(X1, Y1, X2, Y2, SemiSolid = true){
	
	var col = collision_line(X1,Y1,X2,Y2,par_solid,true,true);
	
	if(col)
	{
		if(col.collision_flag)
		{
			if (col.collision_type = "Full Solid" || col.collision_type = "Semi Solid" && SemiSolid = true)
			{
					return true;
			}
		}
	}
	
	//Beta
	if(layer_exists(global.col_tile[0]) || layer_exists(global.col_tile[1]))
	{
		if(collision_line(X1,Y1,X2,Y2,layer_tilemap_get_id(global.col_tile[0]),true,true) ||
		collision_line(X1,Y1,X2,Y2,layer_tilemap_get_id(global.col_tile[1]),true,true) && SemiSolid = true)
		{
			return true;
		}
	}
}