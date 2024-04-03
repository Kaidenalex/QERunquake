// Calculate dot product of two vectors
float dotproduct(vector A, vector B) {
    return (A_x * B_x) + (A_y * B_y) + (A_z * B_z);
}

void DuhRemove()
{
  // self_sprint(self.owner, "RemoveProjectile()\n");
  // sound (self.owner,CHAN_WEAPON,"weapons/lock4.wav",1,ATTN_NORM);

  if ( (self.owner.classname == "player") )
  {
    sprint (self.owner,"Your Shooting Star has burned out\n");
  }

  T_RadiusDamage (RADIUS_NORMAL, self, self.owner, 50, other, "shootingstar");

  self.origin = self.origin - 8 * normalize(self.velocity);

  // WriteByte (MSG_MULTICAST, SVC_TEMPENTITY);
  // WriteByte (MSG_MULTICAST, TE_EXPLOSION);
  // WriteByte(MSG_BROADCAST, SVC_TEMPENTITY);
  // WriteByte(MSG_MULTICAST, TE_EXPLOSION);
  // WriteCoord (MSG_MULTICAST, self.origin_x);
  // WriteCoord (MSG_MULTICAST, self.origin_y);
  // WriteCoord (MSG_MULTICAST, self.origin_z);
  // multicast (self.origin, MULTICAST_PHS);

  create_te_explosion (self.origin, 1);
  self.owner.discfired = FALSE;
  remove (self);
}

vector DuhRandomDir() = {
  local vector new_dir = '0 0 0';

  new_dir_x = random() * 1000;
  if(random() < 0.5) {
    new_dir_x *= -1;
  }
  new_dir_y = random() * 1000;
  if(random() < 0.5) {
    new_dir_y *= -1;
  }
  new_dir_z = random() * 1000;
  if(random() < 0.5) {
    new_dir_z *= -1;
  }
  new_dir = normalize(new_dir);

  return new_dir;
}

vector DuhFortyFive(entity star) = {
  // local vector myangles = vectoangles(star.velocity);
  // local float pitch = myangles_x;
  // local float yaw = myangles_y;

  // local vector myangles = vectoangles(star.velocity);
  local float pitch = 0;
  local float yaw = 0;

  local float longest_trace_fraction = -1;
  local float longest_pitch = -1;
  local float longest_yaw = -1;

  // for(float pitch_ctr = 1; pitch_ctr <= 7; pitch_ctr++) {
  for(float pitch_ctr = 1; pitch_ctr <= 24; pitch_ctr++) {
    // pitch += 45;
    pitch += 15;
    pitch = mathlib_anglemod(pitch);
    // for (float yaw_ctr = 1; yaw_ctr <= 7; yaw_ctr++){
    for (float yaw_ctr = 1; yaw_ctr <= 24; yaw_ctr++){
      // yaw += 25;
      yaw += 15;
      yaw = mathlib_anglemod(yaw);
      local vector newangles;// = pitch + yaw + 0;
      newangles_x = pitch;
      newangles_y = yaw;
      makevectors(newangles);
      traceline(star.origin, star.origin + (v_forward * 512), FALSE, star);

      // self_sprint(star.owner, "trace_fraction: ");
      // self_sprint(star.owner, ftos(trace_fraction));
      // self_sprint(star.owner, "\n");
      if(trace_fraction > longest_trace_fraction) {
        longest_trace_fraction = trace_fraction;
        longest_pitch = pitch;
        longest_yaw = yaw;
      }
    // traceline ((self.origin - (v_forward * 8)),(self.origin + (v_forward * 16)),TRUE,self);
      // self_sprint(star.owner, "pitch: ");
      // self_sprint(star.owner, ftos(pitch));
      // self_sprint(star.owner, "yaw: ");
      // self_sprint(star.owner, ftos(yaw));
      // self_sprint(star.owner, "newangles: ");
      // self_sprint(star.owner, vtos(newangles));
      // self_sprint(star.owner, "v_forward: ");
      // self_sprint(star.owner, vtos(v_forward));
      // self_sprint(star.owner, "\n");
    }
  }

  // self_sprint(star.owner, "longest pitch: ");
  // self_sprint(star.owner, ftos(longest_pitch));
  // self_sprint(star.owner, ", longest yaw: ");
  // self_sprint(star.owner, ftos(longest_yaw));
  // self_sprint(star.owner, ", longest trace fraction: ");
  // self_sprint(star.owner, ftos(longest_trace_fraction));
  // self_sprint(star.owner, "\n");

  local vector newvelocity;
  newvelocity_x = longest_pitch;
  newvelocity_y = longest_yaw;
  newvelocity_z = 0;

  makevectors(newvelocity);
  // newvelocity = v_forward * 400;
  // self_sprint(star.owner, "newvelocity: ");
  // self_sprint(star.owner, vtos(newvelocity));
  // self_sprint(star.owner, "\n");
  newvelocity = normalize(v_forward + v_up + v_right);
  return newvelocity;

  // return newvelocity;

  // // Iterate over pitch angles
  // for (float pitch_step = -90; pitch_step <= 90; pitch_step += 45)
  // {
  //     // Iterate over yaw angles
  //     for (float yaw_step = 0; yaw_step < 360; yaw_step += 45)
  //     {
  //         // Generate a new combination using the current pitch and yaw steps
  //         float new_pitch = pitch_angle + pitch_step;
  //         float new_yaw = yaw_angle + yaw_step;

  //         // Ensure pitch stays within [-90, 90] range
  //         if (new_pitch < -90) new_pitch = -90;
  //         else if (new_pitch > 90) new_pitch = 90;

  //         // Ensure yaw stays within [0, 360) range
  //         new_yaw = fmod(new_yaw, 360);
  //         if (new_yaw < 0) new_yaw += 360;

  //         // Output the current combination (new_pitch, new_yaw)
  //         // You can perform actions with each combination here
  //         // For example, print them or use them for calculations
  //         // e.g., func(new_pitch, new_yaw);
  //     }
  // }
}

void DuhThink() = {
  // if(self.movetype == MOVETYPE_BOUNCE) {
  //   // self_sprint(self.owner, "Changing to MOVETYPE_FLYMISSILE\n");
  //   self.movetype = MOVETYPE_FLYMISSILE;
  //   // self.angles = vectoangles (self.velocity);
  //   float mylen = vlen(self.velocity)
  //   vector myangles = vectoangles(self.velocity);
  //   makevectors(myangles);
  //   eprint(self);
  //   self.velocity = v_forward * mylen * 1.38;
  // }

  if(time > self.runetime) {
    DuhRemove();
    return;
  }

  // vector myangles = vectoangles(self.velocity);
  // makevectors(myangles);
  // self_sprint(self.owner, "vlen: ");
  // self_sprint(self.owner, ftos(vlen(self.velocity)));
  // self_sprint(self.owner, ", vectoangles: ");
  // self_sprint(self.owner, vtos(myangles));
  // self_sprint(self.owner, "v_forward: ");
  // self_sprint(self.owner, vtos(v_forward));
  // self_sprint(self.owner, "v_up: ");
  // self_sprint(self.owner, vtos(v_forward));
  // self_sprint(self.owner, "v_right: ");
  // self_sprint(self.owner, vtos(v_forward));
  // self_sprint(self.owner, "\n");


//   void makevectors(vector angles)
// Constructs an angle = 'pitch yaw 0'. Calculates the unit vectors (a length of 1 "unit") pointing forward, to
// the right, and up (positive x, y and z directions, respectively) from the given angle. Result is returned in
// the global variables:
// vector v_forward; // points forward
// vector v_up; // points up
// vector v_right; // points toward the righ

  // self_sprint(self.owner, "BOUNCED: ");
  // self_sprint(self.owner, ftos(self.bounced));
  // self_sprint(self.owner, "\n");
  // if(self.velocity = '0 0 0' && self.bounced >= 1) {
  //   local vector new_dir = DuhFortyFive(self);
  //   self.velocity = new_dir * (650*self.bounced);
  // }

    // Change velocity to a random direction with increased speed
  if (self.flags & FL_ONGROUND == FL_ONGROUND) {
    self_sprint(self.owner, "ONGROUND\n");
    self.flags = self.flags - FL_ONGROUND;
    self.bounced = (self.bounced + 1);
    // self.velocity_x = random()*1000;
    // self.velocity_y = random()*1000;
    // self.velocity_z = random()*1000;
    // local vector new_dir = DuhRandomDir();
    // self.velocity = new_dir * 400;
    // self.velocity = new_dir * speed;

    // local vector new_dir = DuhRandomDir();
    local vector new_dir = DuhFortyFive(self);
    self.velocity = new_dir * (650*self.bounced);



    // local vector newdir;
    // newdir_x = random();

    // self.velocity_y += random() * 600; // Increase velocity in random direction
    // self.velocity_x += random() * 600;
    // self.velocity_z += random() * 600;
  }

  self.think = DuhThink;
  self.nextthink = time + 0.01;
  /*
  if ( ((self.attack_finished < time) || (self.bounced >= 20)) )
  {

    DuhRemove ();
    return ;

  }
  if ( (self.velocity == '0 0 0') )
  {

    DuhRemove ();
    return ;

  }
  if ( (self.movetype == MOVETYPE_BOUNCE) )
  {

    self.movetype = MOVETYPE_FLYMISSILE;
    self.angles = vectoangles (self.velocity);

  }
  // self.skin = !self.skin;
  if ( (self.flags & FL_ONGROUND) )
  {

    self.flags = (self.flags - FL_ONGROUND);

  }
  self.think = DuhThink;
  //   self.nextthink = .1;  // time;
  */
};

entity DuhFindPlayer(entity star) = {
  local entity find_target;
  // target = world;
  find_target = findradius(star.origin, 8192);
  // float continue_loop = TRUE;
  while(find_target) {
    if(find_target != star && find_target != star.owner && find_target.classname == "player") {
      traceline(star.origin, find_target.origin, TRUE, star);
      if(trace_fraction >= 1) {
        // star_sprint(star.owner, "find_targeting someone\n");
        // vector org = star.origin + PLAYER_WEAPON_OFFSET;
        // traceline (org, find_target.origin, 1, star);
        // create_te_lightning (TE_LIGHTNING2, star, org, trace_endpos);

        // continue_loop = FALSE;
        return find_target;
      }
    }
    find_target = find_target.chain;
  }

  return world;
}

void DuhTouch() = {
  /*
  local float dam;

  if (other == self.owner)
  {
    DuhRemove ();
    return ;
  }
  if (other.classname == "sucker")
  {
    DuhRemove ();
    return ;
  }
  if (self.bounced >= 38)
  {

    DuhRemove ();
    return ;

  }
  if (self.velocity == '0 0 0')
  {

    DuhRemove ();
    return ;

  }
  if (self.flags & FL_ONGROUND)
  {

    self.flags = (self.flags - FL_ONGROUND);

  }
  if ( other.takedamage )
  {

    dam = (50 + (fabs ((self.velocity_x * 0.013)) + fabs ((self.velocity_y * 0.013))));
    T_Damage (other,self,self.owner,dam);
    traceline ((self.origin - (v_forward * 8)),(self.origin + (v_forward * 16)),TRUE,self);
    setorigin (self,(trace_endpos - (v_forward * 2)));
    self.movetype = MOVETYPE_BOUNCE;
    self.bounced = (self.bounced + 1);
    self.nextthink = (time + 0.05);
    self.velocity = (self.velocity * 1.38);
    sound (self,CHAN_WEAPON,"weapons/ax1.wav",1,ATTN_NORM);

  }
  else
  {

    traceline ((self.origin - (v_forward * 8)),(self.origin + (v_forward * 16)),TRUE,self);
    setorigin (self,(trace_endpos - (v_forward * 2)));
    self.movetype = MOVETYPE_BOUNCE;
    self.bounced = (self.bounced + 1);
    self.nextthink = (time + 0.05);
    self.velocity = (self.velocity * 1.38);
    if ( (random () < 0.5) )
    {

      sound (self,CHAN_WEAPON,"player/axhit2.wav",1,ATTN_NORM);

    }
    else
    {

      sound (self,CHAN_WEAPON,"weapons/tink1.wav",1,ATTN_NORM);

    }
  }
  */

  self.bounced = (self.bounced + 1);

  if(self.bounced > 32) {
    DuhRemove();
    return;
  }
  if(other.takedamage) {
    // dam = (50 + (fabs ((self.velocity_x * 0.013)) + fabs ((self.velocity_y * 0.013))));
    T_Damage (other,self,self.owner,1000, "shootingstar");
  }

  local entity maybe_player;
  // DuhFortyFive(self);
  maybe_player = DuhFindPlayer(self);

  if(maybe_player == world) {
    local vector newdir = DuhFortyFive(self);
    self.velocity = newdir*(650*self.bounced);
    /*
    local vector new_dir = DuhRandomDir();
    // self.velocity = new_dir * speed;
    self.velocity = new_dir * (400*self.bounced);
    local float speed = vlen(self.velocity);
    // makevectors(self.velocity);

    vector temp_angles = vectoangles(self.velocity);

    self_sprint(self.owner, "No players detected. Choosing random direction: ");
    self_sprint(self.owner, vtos(new_dir + speed));
    self_sprint(self.owner, " and speed: ");
    self_sprint(self.owner, ftos(speed));
    self_sprint(self.owner, " and angles: ");
    self_sprint(self.owner, vtos(temp_angles));
    self_sprint(self.owner, "\n");
    */
  } else {
    // self_sprint(self.owner, "Player detected. Heading their way.\n")

    local vector new_dir = maybe_player.origin - self.origin;
    // local vector new_dir = self.origin - maybe_player.origin;

    // local float speed = vlen(self.velocity);
    new_dir = normalize(new_dir);
    self.velocity = new_dir * (650*self.bounced);
    local float speed = vlen(self.velocity);



    // makevectors(self.velocity);
    create_te_lightning (TE_LIGHTNING2, self, self.origin, maybe_player.origin);

    self_sprint(self.owner, "Player detected. Heading their way to: ");
    self_sprint(self.owner, vtos(new_dir * speed));
    self_sprint(self.owner, " and speed: ");
    self_sprint(self.owner, ftos(speed));
    self_sprint(self.owner, "\n");
    // self.velocity = new_dir * speed;
  }


// self.velocity = vectoangles(self.velocity); // Convert velocity to angles
// self.velocity_y += random() * 600; // Increase velocity in random direction
// self.velocity_x += random() * 600;
// self.velocity_z += random() * 600;
// vectoangles(self.velocity, self.velocity); // Convert angles back to velocity

        // self.velocity = '500 ' + random() * 1000 + ' 0'; // Adjust values as needed

  // self_sprint(self.owner, "Becoming MOVETYPE_BOUNCE\n");
  // self.movetype = MOVETYPE_BOUNCE;
  // self.think = DuhThink;
  // self.angles = vectoangles(self.velocity);
  // self.velocity = (self.velocity * 1.38);

// vector	v_forward;  // points forward
// vector  v_up;       // points up
// vector  v_right;    // points toward the right
    // makevectors (offang);
  // self.velocity = normalize(self.velocity) * (self.bounced * 1.38);
  self.nextthink = time + 0.1;
};


void Derp(entity fireball) = {
  // fireball.velocity = '1 1 1';
  entity wanted = findradius(fireball.origin, 8192);
  // float continue_loop = TRUE;
  while(wanted) {
    if(wanted != fireball && wanted != fireball.owner && wanted.classname == "player") {
      traceline(fireball.origin, wanted.origin, TRUE, fireball);
      if(trace_fraction >= 1) {
        // self_sprint(fireball.owner, "targeting someone\n");
        // vector org = fireball.origin + PLAYER_WEAPON_OFFSET;
        // traceline (org, wanted.origin, 1, fireball);
        // create_te_lightning (TE_LIGHTNING2, fireball, org, trace_endpos);

        // vector target_dir = trace_endpos - fireball.origin;
        // vector angles = vectoangles(target_dir);
        // makevectors(angles);
        vector new_dir = wanted.origin - fireball.origin;
        new_dir  = normalize(new_dir);
        fireball.velocity = new_dir * 300;

        // vector new_pos = self.origin_x *

        return;

        // continue_loop = FALSE;
      }
    }
    wanted = wanted.chain;
  }
}

void ShootingStar() = {
  local entity missile;
  local entity mpuff;
  local vector start;
  local vector finish;
  local vector dir;
  local float speedfactor;

  if ( self.discfired )
  {
    // self.mydisc.think = DuhRemove;
    // self_sprint(self, "JKKSKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK");
    Derp(self.mydisc);
    // self.mydisc.think = DuhThink;
    // self.mydisc.nextthink = time;
    // if ( !self.mydisc.bounced )
    // {
    //   self.mydisc.bounced = TRUE;

    // }
    return ;

  }
  sound (self,CHAN_WEAPON,"knight/sword1.wav",1.000,ATTN_NORM);
  speedfactor = self.disccount;
  if ( (speedfactor > 50) )
  {

    speedfactor = 50;

  }
  speedfactor = ((speedfactor / 50) * 1.5);
  missile = spawn ();
  missile.owner = self;
  self.mydisc = missile;
  self.discfired = TRUE;
  self.disccount = 0;
  self.disclanded = FALSE;
  missile.movetype = MOVETYPE_FLYMISSILE;
  missile.bounced = 0.000;
  missile.classname = "disc";
  missile.solid = SOLID_BBOX;
  makevectors (self.v_angle);
  // start = (self.origin + '0.000 0.000 16.000');
  // finish = (start + (v_forward * 600.000));
  // dir = (finish - start);
  // if (missile.owner.super_damage_finished > time)
  // {
  //   missile.velocity = ((normalize (dir) * 680) * 4);
  // }
  // else
  // {
  //   missile.velocity = (normalize (dir) * 680);
  // }
  // missile.velocity = (missile.velocity * (1 + speedfactor));
  missile.velocity = normalize(v_forward) * 650;
  missile.angles = vectoangles (missile.velocity);
  missile.touch = DuhTouch;
  missile.attack_finished = (time + 8);
  missile.nextthink = time + 0.1;
  missile.think = DuhThink;
  // missile.skin = 0;
  setmodel (missile,"progs/lavaball.mdl");
  setsize (missile,'0.000 0.000 0.000','0.000 0.000 0.000');
  setorigin (missile,((self.origin + (v_forward * 8.000)) + '0.000 0.000 16.000'));
  missile.runetime = time + 5;
};