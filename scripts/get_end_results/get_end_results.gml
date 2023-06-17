function get_end_results(){
	//Ring bonus
	ring_bonus = global.rings * 100;
	
	//Ring bonus
	var sec, minute;
	
	sec = floor(global.stage_timer/1000) mod 60;
	minute = floor(global.stage_timer/60000);
	time_bonus = 0;
	
	//Time result
	if(minute = 0 && sec <= 59) time_bonus = 50000;
	if(minute = 1 && sec <= 29) time_bonus = 10000;
	if(minute = 1 && sec >= 30 && sec <= 59) time_bonus = 5000;
	if(minute = 2 && sec <= 29) time_bonus = 4000;
	if(minute = 2 && sec >= 30 && sec <= 59) time_bonus = 3000;
	if(minute = 3 && sec <= 29) time_bonus = 1000;
	if(minute >= 3 && minute <= 9 && sec >= 30 && sec <= 59) time_bonus = 100;
	
	
}