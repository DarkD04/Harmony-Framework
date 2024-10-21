/// @description Insert description here
// You can write your code in this editor

	for(var i = 0; i < ds_list_size(attached_list); i++)
	{
		with(attached_list[| i])
		{
			if(variable_instance_exists(id, "culling"))
			{
				culling = false;
			}
		}
	}