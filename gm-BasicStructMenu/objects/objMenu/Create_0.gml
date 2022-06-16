/// @description Insert description here
// You can write your code in this editor


myMenu = new Menu();
myMenu.SetFont(f_game);
myMenu.SetMenuBG(sprMenu9Slice);
myMenu.AddItem("Start", room_goto_next);
myMenu.AddItem("Options", DoNothing);
myMenu.AddItem("Quit", game_end);
myMenu.SetSpacing(16);

imageMenu = new Menu(menuType.image, expandType.horizontal);
imageMenu.AddItem("Back", room_goto_previous, sprItemBG);
imageMenu.AddItem("Quit", game_end, sprItemBG);
imageMenu.SetMenuBG(sprMenu9Slice);
imageMenu.SetMargin(16);
imageMenu.SetSpacing(sprite_get_width(sprItemBG) + 6);

