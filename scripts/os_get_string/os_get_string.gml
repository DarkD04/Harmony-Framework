//Gamemaker should've had this in the first place
function os_get_string(){
	switch(os_type)
	{
		case os_windows: return "Windows"		break; 
		case os_gxgames: return "GX Games"		break; 
		case os_linux: return "Linux"		break; 
		case os_macosx: return "MacOS"		break; 
		case os_ios: return "IOS"		break; 
		case os_tvos: return "tvOS"		break; 
		case os_android: return "Android"		break; 
		case os_ps4: return "PlayStaion 4"		break; 
		case os_ps5: return "PlayStaion 5"		break; 
		case os_gdk: return "GDK"		break; 
		case os_xboxseriesxs: return "Xbox"		break; 
		case os_switch: return "Switch"		break; 
		case os_unknown: return "Unknown"		break; 
		default: return "Unknown"
	}
}