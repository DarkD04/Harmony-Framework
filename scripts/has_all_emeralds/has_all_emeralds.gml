function has_all_emeralds(){
	for (var i = 0; i < array_length(global.emeralds); ++i) {
	    if (!global.emeralds[i]) {
			return false;
		}
	}
	return true;
}