/// @description Creation
	//General dev menu variables
	surface = noone;
	cool_down = 4;
	hold_h = 0;
	hold_v = 0;
	state = dev_menu_state.normal;
	menu_list = ["Resume", "Restart", "Stage Select", "Options", "Exit"];
	menu_select = 0;
	
	//Suspend the game
	global.process_objects = false;
	
	//Character select variables
	character_id = 0;
	character_select = 0;
	character_select_offset = 0;
	char_name = [];
	
	//Category select variables
	category_name = [];
	category_id = 0;
	category_select = 0;
	category_offset = 0;
	
	//Scene select variables
	scene_name = [[]];
	scene_room = [[]];
	scene_id = 0;
	scene_select = 0;
	scene_offset = 0;
	
	//Option variables
	option_id = 0;
	option_select = 0;
	option_offset = 0;
	option_name = [];
	option_variable = [];
	option_number = [];
	option_flag = [];
	option_min = [];
	option_max = [];
	
	//Dev menu colors
	bg_color = #000084;
	unselected_text_color = #848294;
	text_color = #f7f3f7;
	highlight_color = #f7f384;
	
	//Dev menu states
	enum dev_menu_state
	{
		normal,
		character_select,
		category_select,
		stage_select,
		options
	}
	
	//Add all of the characters
	dev_menu_add_character("SONIC");
	dev_menu_add_character("TAILS");
	dev_menu_add_character("KNUCKLES");
	dev_menu_add_character("METAL");
	
	//Add all of option entries
	dev_menu_add_option_number("Sound Volume", "sfx_volume", 0.0, 1.0, 0.05);
	dev_menu_add_option_number("Music Volume", "bgm_volume", 0.0, 1.0, 0.05);
	dev_menu_add_option_number("Window Width", "window_width", 128, 1920, 1);
	dev_menu_add_option_number("Window Height", "window_height", 128, 1920, 1);
	dev_menu_add_option_number("Window Size", "window_size", 1, 4, 1);
	//dev_menu_add_option_number("Camera Pan", "camera_pan_type", 0, 2, 1);
	dev_menu_add_option_flag("Mania Camera", "camera_type");
	dev_menu_add_option_flag("Spindash Flag", "use_spindash");
	dev_menu_add_option_flag("Airroll Flag", "use_airroll");
	dev_menu_add_option_flag("Dropdash Flag", "use_dropdash");
	dev_menu_add_option_flag("Peelout Flag", "use_peelout");
	
	//Add the presentation category
	dev_menu_add_category("Presentation");
	dev_menu_add_entry("Stage Select", rm_stage_select);
	
	//Add the presentation category
	dev_menu_add_category("Regular Stages");
	dev_menu_add_entry("MARBLE TEMPLE ACT 1", rm_marble_temple1);
	dev_menu_add_entry("ARBOREAL AGATE ACT 1", rm_arboreal_agate1);
	dev_menu_add_entry("ARBOREAL AGATE ACT 2", rm_arboreal_agate2);
	
	//Add all of the rooms
	dev_menu_add_category("Every Scene");
	for (var i = 0; i < room_last; ++i) 
	{
	    dev_menu_add_entry(room_get_name(i), i);
	}