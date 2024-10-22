switch ds_map_find_value(async_load, "event_type")
{
    case "gamepad discovered":
        global.gamepad_slot = ds_map_find_value(async_load, "pad_index")
        break
    case "gamepad lost":
        global.gamepad_slot = ds_map_find_value(async_load, "pad_index")
        break
}

