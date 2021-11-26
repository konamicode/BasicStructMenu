// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

#macro gray1 make_color_rgb(230,230,230)
#macro gray2 make_color_rgb(153,153,153)
#macro gray3 make_color_rgb(77,77,77)
#macro gray4 make_color_rgb(51,51,51)


enum menuType {
	text,
	image
}

enum expandType {
		vertical,
		horizontal
}

function Menu(type = menuType.text, _expand = expandType.vertical) constructor
{
	items = ds_list_create();
	currentItem = 0;
	expand = _expand;
	
	static AddItem = function(text, callback, image_bg = -4) {
		var itemArray;
		itemArray[0] = text;
		itemArray[1]  = callback;
		itemArray[2] = image_bg;
		ds_list_add(items, itemArray);
	}
	static Destroy = function() {
		ds_list_destroy(items);
	}
	static MenuDown = function(){
		//PlaySound(sfxMenuTick, 1, false);
		if ((currentItem + 1) < ds_list_size(items))
			currentItem += 1;
		else
			currentItem = 0;
	}

	static MenuUp = function() {
		//PlaySound(sfxMenuTick, 1, false);
		if (currentItem == 0)
			currentItem = ds_list_size(items) - 1;
		else
			currentItem -= 1;
	}

	static GetText = function(index)
	{
		var text = items[| index]
		return text[0];
	}
	
	static GetSprite = function(index)
	{
		var sprite = items[| index];		
		return sprite[2];
	}
	
	static RunCallback = function(index)
	{
		var _func = items[| index][1];
		_func();
	}
	
	function DrawMenu(_x, _y, spacing = 12) {
		for ( var i = 0; i < ds_list_size(items); i++)
		{
			var txt = GetText(i);
			var highlight = (currentItem = i) ? gray1 : gray2;
			var shadow = gray4;			

			var bg = GetSprite(i);

			//If we have a background sprite, center the text based on it's position.
			if bg != noone
			{
				var bgHeight = sprite_get_height(bg);
				var bgWidth = sprite_get_width(bg);
				var bgAlpha = 1; //currentItem = i ? 1 : .25;
				var textX = _x + (i * spacing * (expand)) + (bgWidth / 2);
				var textY = _y + ( i * spacing * (1 -expand));
								
				draw_sprite_ext(bg,  currentItem = i ? 0 : 1, _x + (i * spacing * expand), _y + ( i * spacing * (1- expand)), 1, 1, 0, -1, bgAlpha);
				draw_set_halign(fa_center);
			}
			else
			{
				textX = _x + (i * spacing * (expand));
				textY = _y + ( i * spacing * (1 - expand));
			}

			draw_text_color(textX + 1, textY + 1, txt,
						shadow, shadow, shadow, shadow, 1);
			draw_text_color(textX, textY, txt,
						highlight, highlight, highlight, highlight, 1);
						
			draw_set_halign(fa_left);	
		}
	}
}

function DoNothing()
{
	show_message("Does nothing!")
	return 0;
}