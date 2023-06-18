function lerp_angle(value, angle, amount){
	//This function is used for lerping angles (angles with easing)
	
	//Move value to the target:
	value += (((angle - value + 540) mod 360)-180) * amount;
	
	//Preventing from going to negative:
	value = (value + 360) mod 360;	
	
	//Return the result
	return value;
}