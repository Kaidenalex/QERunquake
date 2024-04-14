/*  Copyright (C) 1996-2022 id Software LLC

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

    See file, 'COPYING', for details.
*/

void Bot_UseDarkRune() {
	// Rune_Dark();
	// self.nextthink = time + 10;
	// self.think = B
}
/*
========================
Bot_PreThink

Called by the engine every frame before running the bots update in C++

NOTE: "self" will be the calling bot

Example usages of this function:

	1. Telling bots what to do or where to go ( i.e. setting a high level goal ).
	2. Modifying properties on the bot player ( or other players in-game ) that the bots can see/use doing their update.
========================
*/
void Bot_PreThink() {

	/*
	if(self.enemy && self.enemy.classname == "player" && self.enemy.netname == "grasping_at_straws") {
		self.enemy = self;
	}

	if(self.chain) {
		if(self.chain.classname == "player") {
			bprint("prethink chain: ");
			bprint(self.chain.netname);
			bprint("\n");
		}
	}

	if(self.oldenemy) {
		if(self.oldenemy.classname == "player") {
			bprint("prethink oldenemy: ");
			bprint(self.oldenemy.netname);
			bprint("\n");
		}
	}

	if(self.enemy) {
		if(self.enemy.classname == "player") {
			bprint("prethink enemy: ");
			bprint(self.enemy.netname);
			bprint("\n");
		}
	}

	if(self.goalentity) {
		if(self.goalentity.classname == "player") {
			bprint("prethink goalentity: ");
			bprint(self.goalentity.netname);
			bprint("\n");
		}
	}

	if(self.head_chain) {
		if(self.head_chain.classname == "player") {
			bprint("prethink head_chain: ");
			bprint(self.head_chain.netname);
			bprint("\n");
		}
	}
	if(self.viewentity) {
		if(self.viewentity.classname == "player") {
			bprint("prethink viewentity: ");
			bprint(self.viewentity.netname);
			bprint("\n");
		}
	}
	if(self.groundentity) {
		if(self.groundentity.classname == "player") {
			bprint("prethink groundentity: ");
			bprint(self.groundentity.netname);
			bprint("\n");
		}
	}
	if(self.aiment) {
		if(self.aiment.classname == "player") {
			bprint("prethink aiment: ");
			bprint(self.aiment.netname);
			bprint("\n");
		}
	}
	if(self.dmg_inflictor) {
		if(self.dmg_inflictor.classname == "player") {
			bprint("prethink dmg_inflictor: ");
			bprint(self.dmg_inflictor.netname);
			bprint("\n");
		}
	}
	if(self.movetarget) {
		if(self.movetarget.classname == "player") {
			bprint("prethink movetarget: ");
			bprint(self.movetarget.netname);
			bprint("\n");
		}
	}
	*/
	// if(sight_entity) {
	// 	bprint("sight_entity");
	// }
	// if(self.chain) {
	// 	if(self.chain.classname == "player") {
	// 		bprint(self.netname);
	// 		bprint(" is targeting: ");
	// 		bprint(self.chain.netname);
	// 		bprint("\n");
	// 	}
	// }

	// if(self.dmg_inflictor) {
	// 	if(self.dmg_inflictor.classname == "player") {
	// 		bprint(self.netname);
	// 		bprint(" is targeting: ");
	// 		bprint(self.dmg_inflictor.netname);
	// 		bprint("\n");
	// 	}
	// }

	// if(self.enemy && self.enemy != self) {
	// 	if (self.enemy.classname == "player") {
	// 		bprint(self.netname);
	// 		bprint(" is targeting: ");
	// 		bprint(self.enemy.netname);
	// 		bprint("\n");
	// 	}
	// }


	// eprint(self);

	// if(self.enemy && self.enemy != self){//&& self.aiment.classname == "player") {
	// 	bprint(self.netname);
	// 	bprint(" has an enemy!\n");
	// 	// bprint(self.aiment.netname);
	// 	// bprint(":( \n");

	// }
	// // add your code here!
	// bprint(self.netname);
	// bprint(" is thinking\n");
	if(self.runetype == RN_DARK) {
		if(self.botrunethink == 0) {
			bprint("Setting ");
			bprint(self.netname);
			bprint(" think time to 5 seconds from now\n");
			self.botrunethink = time + 5;
			return;
		}

		if(self.botrunethink < time) {
			// self.nextthink = time + 5;
			bprint(self.netname);
			bprint(" launching Darkness rune now\n");
			// self.think = Bot_UseDarkRune;
			Rune_Dark();
			// self.think = Bot_UseDarkRune;
			// self.nextthink = time + 5;
			self.botrunethink = time + 60;
		}
	}
};

/*
========================
Bot_PostThink

Called by the engine every frame after running the bots update in C++

NOTE: "self" will be the calling bot

Example usages of this function:

	1. Overriding/modifying bot user cmds.
	2. Overriding/modifying bot player properties.
========================
*/
void Bot_PostThink() {
	// add your code here!
	// if(self.runetype > 0) {
	// 	bprint(self.netname);
	// 	bprint(" has rune ");
	// 	bprint(ftos(self.runetype));
	// 	bprint("\n");
	// }
	// if()
	// if(self.goalentity) {
	// 	bprint("bot's goalentity: ");
	// 	bprint(self.goalentity.classname);
	// 	bprint("\n");
	// }
	// if(self.enemy && self.enemy != self) {
	// 	if (self.enemy.classname == "player") {
	// 		bprint(self.netname);
	// 		bprint(" is targeting: ");
	// 		bprint(self.enemy.netname);
	// 		bprint("\n");
	// 	}
	// }
	/*
	if(self.chain) {
		if(self.chain.classname == "player") {
			bprint("postthink chain: ");
			bprint(self.chain.netname);
			bprint("\n");
		}
	}

	if(self.oldenemy) {
		if(self.oldenemy.classname == "player") {
			bprint("postthink oldenemy: ");
			bprint(self.oldenemy.netname);
			bprint("\n");
		}
	}

	if(self.enemy) {
		if(self.enemy.classname == "player") {
			bprint("posthink enemy: ");
			bprint(self.enemy.netname);
			bprint("\n");
		}
	}

	if(self.goalentity) {
		if(self.goalentity.classname == "player") {
			bprint("postthink goalentity: ");
			bprint(self.goalentity.netname);
			bprint("\n");
		}
	}
	if(self.head_chain) {
		if(self.head_chain.classname == "player") {
			bprint("postthink head_chain: ");
			bprint(self.head_chain.netname);
			bprint("\n");
		}
	}
	if(self.viewentity) {
		if(self.viewentity.classname == "player") {
			bprint("postthink viewentity: ");
			bprint(self.viewentity.netname);
			bprint("\n");
		}
	}
	if(self.groundentity) {
		if(self.groundentity.classname == "player") {
			bprint("postthink groundentity: ");
			bprint(self.groundentity.netname);
			bprint("\n");
		}
	}
	if(self.aiment) {
		if(self.aiment.classname == "player") {
			bprint("postthink aiment: ");
			bprint(self.aiment.netname);
			bprint("\n");
		}
	}
	if(self.dmg_inflictor) {
		if(self.dmg_inflictor.classname == "player") {
			bprint("postthink dmg_inflictor: ");
			bprint(self.dmg_inflictor.netname);
			bprint("\n");
		}
	}
	if(self.movetarget) {
		if(self.movetarget.classname == "player") {
			bprint("postthink movetarget: ");
			bprint(self.movetarget.netname);
			bprint("\n");
		}
	}
	*/
};