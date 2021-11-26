/// @description Insert description here
// You can write your code in this editor

var _down = keyboard_check_pressed(vk_down);
var _up = keyboard_check_pressed(vk_up);
var _enter = keyboard_check_pressed(vk_enter);
var _esc = keyboard_check_pressed(vk_escape);


switch(room) {
	case rm_menu:
		if _down	
			myMenu.MenuDown();
	
		if _up
			myMenu.MenuUp();
	
		if _enter
			myMenu.RunCallback(myMenu.currentItem);
	break;
	case rm_none:
		if _esc
			room_goto_previous();
	break;
}
	
