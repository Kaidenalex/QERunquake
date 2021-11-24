/*  $Id: world.qc,v 1.85 2008/08/13 03:54:59 slotzero Exp $

    Copyright (C) 1996, 1997  Id Software, Inc.

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
*/

void () rjs_worldspawn;
void () InitBodyQue ;
void () Light_Setup;
void () place_my_items;
void () check_teamplay;
void () check_console_command;
void () CheckRules;
void () spawn_runes;
void () update_client_pings;

void ()
main =
{

	dprint ("main function\n");
	
// these are just commands the the prog compiler to copy these files

	precache_file ("progs.dat");
	precache_file ("gfx.wad");
	precache_file ("quake.rc");
	precache_file ("default.cfg");

	precache_file ("end1.bin");
	precache_file2 ("end2.bin");

	precache_file ("demo1.dem");
	precache_file ("demo2.dem");
	precache_file ("demo3.dem");

//
// these are all of the lumps from the cached.ls files
//
	precache_file ("gfx/palette.lmp");
	precache_file ("gfx/colormap.lmp");

	precache_file2 ("gfx/pop.lmp");

	precache_file ("gfx/complete.lmp");
	precache_file ("gfx/inter.lmp");

	precache_file ("gfx/ranking.lmp");
	precache_file ("gfx/vidmodes.lmp");
	precache_file ("gfx/finale.lmp");
	precache_file ("gfx/conback.lmp");
	precache_file ("gfx/qplaque.lmp");

	precache_file ("gfx/menudot1.lmp");
	precache_file ("gfx/menudot2.lmp");
	precache_file ("gfx/menudot3.lmp");
	precache_file ("gfx/menudot4.lmp");
	precache_file ("gfx/menudot5.lmp");
	precache_file ("gfx/menudot6.lmp");

	precache_file ("gfx/menuplyr.lmp");
	precache_file ("gfx/bigbox.lmp");
	precache_file ("gfx/dim_modm.lmp");
	precache_file ("gfx/dim_drct.lmp");
	precache_file ("gfx/dim_ipx.lmp");
	precache_file ("gfx/dim_tcp.lmp");
	precache_file ("gfx/dim_mult.lmp");
	precache_file ("gfx/mainmenu.lmp");
	
	precache_file ("gfx/box_tl.lmp");
	precache_file ("gfx/box_tm.lmp");
	precache_file ("gfx/box_tr.lmp");
	
	precache_file ("gfx/box_ml.lmp");
	precache_file ("gfx/box_mm.lmp");
	precache_file ("gfx/box_mm2.lmp");
	precache_file ("gfx/box_mr.lmp");
	
	precache_file ("gfx/box_bl.lmp");
	precache_file ("gfx/box_bm.lmp");
	precache_file ("gfx/box_br.lmp");
	
	precache_file ("gfx/sp_menu.lmp");
	precache_file ("gfx/ttl_sgl.lmp");
	precache_file ("gfx/ttl_main.lmp");
	precache_file ("gfx/ttl_cstm.lmp");
	
	precache_file ("gfx/mp_menu.lmp");
	
	precache_file ("gfx/netmen1.lmp");
	precache_file ("gfx/netmen2.lmp");
	precache_file ("gfx/netmen3.lmp");
	precache_file ("gfx/netmen4.lmp");
	precache_file ("gfx/netmen5.lmp");
	
	precache_file ("gfx/sell.lmp");
	
	precache_file ("gfx/help0.lmp");
	precache_file ("gfx/help1.lmp");
	precache_file ("gfx/help2.lmp");
	precache_file ("gfx/help3.lmp");
	precache_file ("gfx/help4.lmp");
	precache_file ("gfx/help5.lmp");

	precache_file ("gfx/pause.lmp");
	precache_file ("gfx/loading.lmp");

	precache_file ("gfx/p_option.lmp");
	precache_file ("gfx/p_load.lmp");
	precache_file ("gfx/p_save.lmp");
	precache_file ("gfx/p_multi.lmp");

// sounds loaded by C code
	precache_sound ("misc/menu1.wav");
	precache_sound ("misc/menu2.wav");
	precache_sound ("misc/menu3.wav");

	precache_sound ("ambience/water1.wav");
	precache_sound ("ambience/wind2.wav");

// shareware
	precache_file ("maps/start.bsp");

	precache_file ("maps/e1m1.bsp");
	precache_file ("maps/e1m2.bsp");
	precache_file ("maps/e1m3.bsp");
	precache_file ("maps/e1m4.bsp");
	precache_file ("maps/e1m5.bsp");
	precache_file ("maps/e1m6.bsp");
	precache_file ("maps/e1m7.bsp");
	precache_file ("maps/e1m8.bsp");

// registered
	precache_file2 ("gfx/pop.lmp");

	precache_file2 ("maps/e2m1.bsp");
	precache_file2 ("maps/e2m2.bsp");
	precache_file2 ("maps/e2m3.bsp");
	precache_file2 ("maps/e2m4.bsp");
	precache_file2 ("maps/e2m5.bsp");
	precache_file2 ("maps/e2m6.bsp");
	precache_file2 ("maps/e2m7.bsp");

	precache_file2 ("maps/e3m1.bsp");
	precache_file2 ("maps/e3m2.bsp");
	precache_file2 ("maps/e3m3.bsp");
	precache_file2 ("maps/e3m4.bsp");
	precache_file2 ("maps/e3m5.bsp");
	precache_file2 ("maps/e3m6.bsp");
	precache_file2 ("maps/e3m7.bsp");

	precache_file2 ("maps/e4m1.bsp");
	precache_file2 ("maps/e4m2.bsp");
	precache_file2 ("maps/e4m3.bsp");
	precache_file2 ("maps/e4m4.bsp");
	precache_file2 ("maps/e4m5.bsp");
	precache_file2 ("maps/e4m6.bsp");
	precache_file2 ("maps/e4m7.bsp");
	precache_file2 ("maps/e4m8.bsp");

	precache_file2 ("maps/end.bsp");

	precache_file2 ("maps/dm1.bsp");
	precache_file2 ("maps/dm2.bsp");
	precache_file2 ("maps/dm3.bsp");
	precache_file2 ("maps/dm4.bsp");
	precache_file2 ("maps/dm5.bsp");
	precache_file2 ("maps/dm6.bsp");



};

entity	lastspawn;

//=======================
/*QUAKED worldspawn (0 0 0) ?
Only used for the world entity.
Set message to the level name.
Set sounds to the cd track to play.

World Types:
0: medieval
1: metal
2: base
*/
//=======================
void ()
worldspawn =
{

	// custom map title
	self.message = GetMapName(self.message);
	//InternalInit ();
	InitBodyQue ();
	rjs_worldspawn ();
	precaches ();
	Light_Setup ();
	place_my_items ();
	//IN_POQ(InitSearchHunk();)
};

void ()
StartFrame =
{
	check_teamplay ();
	check_console_command ();
	CheckRules ();
	spawn_runes ();
	update_client_pings ();
	//IN_QW(update_deathmatch ();)
};

/*
==============================================================================

BODY QUE

==============================================================================
*/

entity	bodyque_head;

void ()
InitBodyQue =
{
	bodyque_head = spawn ();
	bodyque_head.classname = "bodyque";
	bodyque_head.owner = spawn ();
	bodyque_head.owner.classname = "bodyque";
	bodyque_head.owner.owner = spawn ();
	bodyque_head.owner.owner.classname = "bodyque";
	bodyque_head.owner.owner.owner = spawn ();
	bodyque_head.owner.owner.owner.classname = "bodyque";
	bodyque_head.owner.owner.owner.owner = bodyque_head;
};

// make a body que entry for the given ent so the ent can be
// respawned elsewhere
void (entity ent)
CopyToBodyQue =
{
	if (gamemode == MODE_HEADS)
		return;

	bodyque_head.angles	= ent.angles;
	bodyque_head.model	= ent.model;
	bodyque_head.modelindex	= ent.modelindex;
	bodyque_head.frame	= ent.frame;
	bodyque_head.colormap	= ent.colormap;

	if (ent.movetype == MOVETYPE_WALK)
	{
		dprint ("bad movetype for bodyque by ", ent.netname, "\n");
		bodyque_head.movetype	= MOVETYPE_TOSS;
	}
	else
		bodyque_head.movetype	= ent.movetype;

	bodyque_head.velocity	= ent.velocity;
	bodyque_head.flags	= 0;

	setorigin (bodyque_head, ent.origin);
	setsize (bodyque_head, ent.mins, ent.maxs);

	bodyque_head		= bodyque_head.owner;
};
