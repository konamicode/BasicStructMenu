/// @description Insert description here
// You can write your code in this editor


myMenu = new Menu();
myMenu.SetFont(f_game);
myMenu.AddItem("Start", room_goto_next);
myMenu.AddItem("Options", DoNothing);
myMenu.AddItem("Quit", game_end);


imageMenu = new Menu(menuType.image, expandType.horizontal);
imageMenu.AddItem("Back", room_goto_previous, sprMenuBG);
imageMenu.AddItem("Quit", game_end, sprMenuBG);
imageMenu.SetSpacing(sprite_get_width(sprMenuBG) + 6);

