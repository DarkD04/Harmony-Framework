function dev_menu_add_character(character_name)
{
	char_name[character_id] = character_name;
	character_id++;
}

function dev_menu_add_category(name)
{
	scene_id = 0;
	category_name[category_id] = name;
	category_id++;
}

function dev_menu_add_entry(name, room_id)
{
	scene_name[category_id][scene_id] = name;
	scene_room[category_id][scene_id] = room_id;
	scene_id++;
}

function dev_menu_add_option_number(name, variable, minimum, maxium, number = 1.0)
{
	option_name[option_id] = name;
	option_variable[option_id] = variable;
	option_number[option_id] = number
	option_min[option_id] = minimum;
	option_max[option_id] = maxium;
	option_flag[option_id] = false;
	option_id++;
}

function dev_menu_add_option_flag(name, variable)
{
	option_name[option_id] = name;
	option_variable[option_id] = variable;
	option_flag[option_id] = true;
	option_id++;
}