/// @description Insert description here
// You can write your code in this editor

switch(room) {
	case rm_menu:
		myMenu.DrawMenu(x, y, 16);
	break;
	case rm_none:
		draw_text(x, y, "Press Esc to go back");
	break;
}
