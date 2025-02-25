function sh_instance_create(args)
{
    instance_create_depth(args[1], args[2], args[3], asset_get_index(args[4]))
}

function meta_instance_create()
{
    return 
    {
        description: "create an object",
        arguments: ["<x>", "<y>", "<depth>", "<object>"],
        suggestions: [mouseArgumentType.worldX, mouseArgumentType.worldY, [], []],
        argumentDescriptions: ["the X coordinate to create the object at", "the Y coordinate to create the object at", "the object's depth", "the object to create"]
    };
}

function sh_room_goto(args)
{
	var room_ = asset_get_index(args[1])
    if (asset_get_type(args[1]) != 3)
        return ("Can't find room " + string(args[1]));
    if (asset_get_type(args[1]) == 3)
    {
        fade_to_room(room_, 5);
    }
	
	show_debug_message(room_)
}

function meta_room_goto()
{
    return 
    {
        description: "allows you to go to another room",
        arguments: ["<room>"],
        suggestions: [global.roomlist],
        argumentDescriptions: ["set the target room"]
    };
}

function sh_suicide(args)
{
	if(instance_exists(obj_player))obj_player.knockout_type = 2; else return "There's no player to kill"
}

function sh_play_music(args)
{
	var sound = asset_get_index(args[1])
	play_music(args[1], 0);
}

function meta_play_music()
{
	 return 
    {
        description: "plays BGM",
        arguments: ["<music_id>"],
        //suggestions: [global.roomlist],
        //argumentDescriptions: ["set the target room"]
    };
}