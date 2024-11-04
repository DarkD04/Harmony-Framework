/// @description Draw stuff
	if(!instance_exists(obj_water)) exit;
	var tileLayer, layerList;
	
	layerList = ["PlaneFront", "PlaneBack"]

	for(var i = 0; i < array_length(layerList); i++)
	{
		tileLayer = layer_get_id(layerList[i]);
		layer_script_begin(tileLayer, aaz2_water_dist_start);
		layer_script_end(tileLayer, aaz2_water_dist_end);
	}
