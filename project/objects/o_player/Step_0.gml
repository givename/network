if (our_player == true)
{
	_PLAYER = global.playernum;
	scr_move();

	image_angle = point_direction(x,y,mouse_x,mouse_y);

	if (global.socket != undefined) 
	{
		data = ds_map_create();
		ds_map_add(data,"x",x);
		ds_map_add(data,"y",y);
		ds_map_add(data,"_angle",image_angle);
		ds_map_add(data,"id",id);
		ds_map_add(data,"playernum",global.playernum);
		ds_map_add(data,"hostnum",global.hostnum);
		ds_map_add(data,"_shoot",_shoot);
		ds_map_add(data,"hp",hp);
		ds_map_add(data,"_score",_score);
	
		send_socket( global._ip, global._port,200,data,msgType.statH);
	}
	//show_debug_message(string([_PLAYER,x,y]));
	
if (_shoot)
{
	_shoot = false;
	var ins = instance_create_depth(x,y,0,o_bullet);
	ins.direction = image_angle;
	ins.speed = 25;
	ins.image_angle = image_angle;
	ins._PLAYER = _PLAYER;
	
	audio_play_sound(snd_shoot,0,0);
}
}
else
{
	if (global.socket != undefined) 
	{
		data = ds_map_create();
		ds_map_add(data,"playernum",_PLAYER);
		ds_map_add(data,"hostnum",global.hostnum);
		ds_map_add(data,"playerstat",noone);
	
		send_socket( global._ip, global._port,200,data,msgType.getpH);
	}
}

