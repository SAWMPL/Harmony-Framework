function player_state_jump(){
	//Trigger jump
	if(state == ST_NORMAL || state == ST_ROLL || state == ST_SKID)
	{
		if(press_action && ground && !touching_ceiling && !force_roll)
		{
			//Jump off the terrain
			y_speed -= jump_strenght*dcos(ground_angle);	
			x_speed -= jump_strenght*dsin(ground_angle);
			
			//Trigger the jump flag
			jump_flag = true;
			
			//Detach player off the ground and change state
			ground = false;
			state = ST_JUMP
			
			//Change jump animation duration
			jump_anim_speed = floor(max(0, 4-abs(ground_speed)));
			
			//Reset angle and floor mode
			ground_angle = 0;
			player_reposition_mode(CMODE_FLOOR);
			
			//Play the sound
			play_sound(sfx_jump);
		}
	}
	
	//Do the air roll
	if(press_action && !ground && global.use_airroll)
	{
		if(state == ST_NORMAL || state == ST_SPRING)
		{
			state = ST_JUMP;
			jump_flag = false;
			ceiling_lock = 2;
			jump_anim_speed = floor(max(0, 4-abs(ground_speed)));
		}
	}
	
	//Stop if its not jump state
	if(state != ST_JUMP) exit;
	
	//Change flags
	attacking = true;
	//Limit the jump when key is released
	if(!hold_action && y_speed < -4 / (1 + underwater) && jump_flag)
	{
		jump_flag = false;
		y_speed = -4 / (1 + underwater);
	}

	//Change animation
	animation = ANIM_ROLL;
	
	//Change animation speed
	if(character != CHAR_TAILS)animation_set_speed = jump_anim_speed;
	
	//Reset when grounded
	if(ground) state = ST_NORMAL;
}