function create_ringloss(ring_counter){
	var ring_angle = 101.25;
	var flip = false
	var spd = 4
	var max_ring = min(ring_counter, 32);
	
	//Create rings
	for (var i = 1; i <= max_ring; ++i)
	{
	    //Create ring objects
	    var ring = instance_create_depth(x, y, depth, obj_ring);
	    ring.x_speed = dcos(ring_angle) * spd;
	    ring.y_speed = -dsin(ring_angle) * spd;
		ring.ringloss = true;
		
	    //Make ring go in circle
	    if(flip)
	    {
			ring.x_speed *= -1;
	        ring_angle += 22.5;
	    }
    
	    //Toggle flip flag
	    flip = !flip;
    
	    //Inner circle
	    if (i = 16)
	    {
	        spd = 2;
			ring_angle = 101.25;
	    }
	}
}