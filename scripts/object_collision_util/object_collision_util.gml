function obj_check_rect(X1, Y1, X2, Y2, SemiSolid = true){
	//Trigger the collision
	if collision_rectangle(floor(x)+X1,floor(y)+Y1+1,floor(x)+X2,floor(y)+Y2+1,par_solid,true,true){
		
		//Get the value from the object with what youre coliding
		var solidCollisions = ds_list_create();
		var SolidCount = collision_rectangle_list(floor(x)+X1,floor(y)+Y1+1,floor(x)+X2,floor(y)+Y2+1,par_solid,true,true,solidCollisions,false);
		for (var i = 0; i < SolidCount; i++)
		{
			var Solid =  solidCollisions[| i];
			if(Solid.collision_flag){
				if (Solid.collision_type = "Full Solid" || Solid.collision_type = "Semi Solid" && SemiSolid = true)
				{
					ds_list_destroy(solidCollisions);
					return true;
				}
			}
		}
		ds_list_destroy(solidCollisions);
	}
}

function obj_check_point(X, Y, SemiSolid = true){
	//Trigger the collision
	if collision_point(X, Y,par_solid,true,true){
		
		//Get the value from the object with what youre coliding
		var solidCollisions = ds_list_create();
		var SolidCount = collision_point_list(X, Y,par_solid,true,true,solidCollisions,false);
		for (var i = 0; i < SolidCount; i++)
		{
			var Solid =  solidCollisions[| i];
			if(Solid.collision_flag){
				if (Solid.collision_type = "Full Solid" || Solid.collision_type = "Semi Solid" && SemiSolid = true)
				{
					ds_list_destroy(solidCollisions);
					return true;
				}
			}
		}
		ds_list_destroy(solidCollisions);
	}
}