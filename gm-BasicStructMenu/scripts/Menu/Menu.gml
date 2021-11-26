// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

#macro gray1 make_color_rgb(230,230,230)
#macro gray2 make_color_rgb(153,153,153)
#macro gray3 make_color_rgb(77,77,77)
#macro gray4 make_color_rgb(51,51,51)


function Menu() constructor
{
	items = ds_list_create();
	currentItem = 0;
	static AddItem = function(text, callback) {
		var itemArray;
		itemArray[1]  = callback;
		itemArray[0] = text;
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

			textX = _x;
			textY = _y + ( i * spacing);
				
			draw_text_color(textX + 1, textY + 1, txt,
						shadow, shadow, shadow, shadow, 1);
			draw_text_color(textX, textY, txt,
						highlight, highlight, highlight, highlight, 1);
		}
	}
}

function DoNothing()
{
	show_message("Does nothing!")
	return 0;
}