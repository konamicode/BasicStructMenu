/// @description Insert description here
// You can write your code in this editor


myMenu = new Menu();

myMenu.AddItem("Start", room_goto_next);
myMenu.AddItem("Options", DoNothing);
myMenu.AddItem("Quit", game_end);


imageMenu = new Menu(menuType.image);
imageMenu.AddItem("Back", room_goto_previous, sprMenuBG);
imageMenu.AddItem("Quit", game_end, sprMenuBG);
