if(Input.StartPress || Input.ActionPress){
	if delay > 2 
	{
		global.process_objects = true;
		audio_resume_all();
		surface_free(pausemenu);
		pausemenu = -1;
		instance_destroy();
	}
}