// Constants
float PROJECTILE_SPEED = 400;
float PROJECTILE_DAMAGE = 100;
float PROJECTILE_RADIUS = 100;

// Helper functions
vector RandomVector() {
    local vector rand;
    rand_x = random(-1, 1);
    rand_y = random(-1, 1);
    rand_z = random(-1, 1);
    return rand;
}

vector ProjectionOnNormal(vector v, vector n) {
    return n * (v * n); // Scalar projection of v onto n
}

vector NewDirection(vector normal) {
    local vector rand, proj, newDir;
    rand = RandomVector();
    proj = ProjectionOnNormal(rand, normal);
    newDir = normalize(rand - proj);
    return newDir;
}

void() ProjectileThink;

void RemoveProjectile()
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

// Projectile entity
void() ProjectileTouch = {
  self.bounced = (self.bounced + 1);

  vector start = self.origin;
  vector end = start + self.velocity * frametime;
  traceline(start, end, TRUE, self);

  if (trace_plane_normal == '0 0 1') {
    // self.disclanded = TRUE;
      // self.flags = (self.flags - FL_ONGROUND);
      // self.movetype = MOVETYPE_FLYMISSILE;
      // sprint (self.owner,"OMG FLOOR OMG\n");

      // vector upDir = '0 0 1'; // Straight up direction

      // // Calculate a random direction at 45 degrees to the floor normal
      // vector newDir = NewDirection(trace_plane_normal);

      // // Combine the upward direction with the random 45-degree direction
      // newDir = normalize(newDir + upDir);

      // // self.velocity = newDir * self.speed;
      // self.velocity = '0 0 1' * 1000;
      // self.speed = 1000;
      // self.velocity_z = 1000;
      // vector upDir = '0 0 1'; // Straight up direction

      // Calculate a random direction at 45 degrees to the floor normal
      // vector newDir = NewDirection(trace_plane_normal);

      // Combine the upward direction with the random 45-degree direction
      // newDir = normalize(newDir + upDir);

      // self.velocity = upDir* self.speed;
      // self.think = ProjectileThink;
      // return;
      // self.nextthink = 0.1;
      // return;
  } else {

      vector newDir = NewDirection(trace_plane_normal);
      self.velocity = newDir * PROJECTILE_SPEED;
      self.velocity = self.velocity * (self.bounced * 1.1);
      // self_sprint(self.owner, "SPEED: ");
      // self_sprint(self.owner, ftos(self.speed));
      // self_sprint(self.owner, "\n");
      // self.velocity = self.velocity * (1.38 * self.bounced);
      // self.speed = self.speed * 5; // Increase speed<<
      // self.speed = self.speed * (self.bounced * 5); // Increase speed<<

  }



    /*
    if (trace_plane_normal == '0 0 1') {
        // Collision with floor, trigger explosion
        // RadiusDamage(self, self.owner, PROJECTILE_DAMAGE, PROJECTILE_RADIUS);
        // remove(self);
        self_sprint(self.owner, "touch removeprojectile\n");
        RemoveProjectile();
        return;
    }
    */

    // if (trace_plane_normal == '0 0 1') {
    //   self_sprint(self.owner, "FLOOR OMG FLOOR\n");

    // }

    if(other.takedamage)
    {
      // self_sprint(self.owner, "other.takedamage\n");
      // dam = (50 + (fabs ((self.velocity_x * 0.013)) + fabs ((self.velocity_y * 0.013))));
      T_Damage (other,self,self.owner,1000, "shootingstar");
    }
    if ( (random () < 0.5) )
    {
      sound (self,CHAN_WEAPON,"player/axhit2.wav",1,ATTN_NORM);
    }
    else
    {
      sound (self,CHAN_WEAPON,"weapons/tink1.wav",1,ATTN_NORM);
    }
    self.lastknownvelocity = self.velocity;

    self.think = ProjectileThink;
    self.nextthink = 0.1;
};

void() ProjectileThink = {
// void (float attn, entity inflictor, entity attacker, float damage, entity ignore, string dtype)
// T_RadiusDamage
  // T_RadiusDamage (RADIUS_150, self, self.owner,20,self.owner, "shootingstar");

  if(self.runetime < time) {
    RemoveProjectile();
    return;
  }

  if(self.owner.health <= 0) {
    RemoveProjectile();
    return;
  }

  if(self.lastdmgtime + 0.45 < time) {
    // T_RadiusDamage (RADIUS_NORMAL, self, self.owner,80,self.owner, "shootingstar");
    T_RadiusDamage (RADIUS_150, self, self.owner,20,self.owner, "shootingstar");
    self.lastdmgtime = time;
  }
  // T_RadiusDamage (RADIUS_150, self, self.owner,5,self.owner, "shootingstar");

  local vector start, end;

    // sprint (self.owner,"last known:");
    // sprint (self.owner,vtos(self.lastknownvelocity));
    // sprint (self.owner,"\n");

  // if ( ((self.attack_finished < time) || (self.bounced >= 20)) )
  // {
  //   RemoveProjectile();
  //   return ;
  // }

  // if (self.velocity == '0 0 0')
  // {
  //   RemoveProjectile();
  //   return ;
  // }

  // if (self.flags & FL_ONGROUND)
  // {
  //   // self.flags = (self.flags - FL_ONGROUND);
  //   RemoveProjectile();
  //   return ;
  // }


  // if ( ((self.attack_finished < time) || (self.bounced >= 20)) )
  // {
  //   RemoveProjectile();
  //   return ;

  // }
  // if ( (self.velocity == '0 0 0') )
  // {
  //   RemoveProjectile();
  //   return ;
  // if (self.velocity == '0 0 0') {
  //   self_sprint(self.owner, "hmm we're stuck\n");
  // }

  // if (self.disclanded) {
  if (self.flags & FL_ONGROUND == FL_ONGROUND) {
    self.flags = self.flags - FL_ONGROUND;
    // self_sprint(self.owner, "we've landed.. weird\n");
    // self.movetype = MOVETYPE_BOUNCE;
    vector upDir = '0 0 1'; // Straight up direction

    // Calculate a random direction at 45 degrees to the floor normal
    vector newDir = NewDirection(trace_plane_normal);

    // Combine the upward direction with the random 45-degree direction
    newDir = normalize(newDir + upDir);


    // self.velocity = newDir * 1000;
    // self.velocity = newDir * (self.bounced * 5);

    self.velocity = newDir * PROJECTILE_SPEED;
    self.velocity = self.velocity * (self.bounced * 1.1);


    // float oldvelocity = 1000; // DEFAULT

    // if(self.lastknownvelocity_x != 0) {
    //   oldvelocity = self.lastknownvelocity_x;
    // } else if (self.lastknownvelocity_y != 0) {
    //   oldvelocity = self.lastknownvelocity_y;
    // } else {
    //   oldvelocity = self.lastknownvelocity_z;
    // }
    // sprint (self.owner,"last known:");
    // sprint (self.owner,vtos(self.lastknownvelocity));
    // sprint (self.owner,"\n");

    // sprint (self.owner,"old velocity:");
    // sprint (self.owner,ftos(oldvelocity));
    // sprint (self.owner,"\n");

        //  self.velocity = '0 0 1' * (lastVelocity * '0 0 1'); // Set upward velocity based on last known velocity
    // self.velocity = newDir * oldvelocity; // Reset speed to initial value


    // self.velocity = self.velocity * (self.lastknownvelocity * '0 0 1') * (self.bounced * 5);

    // self.velocity = self.lastknownvelocity;


    // self.speed = self.bounced * 5; // Increase speed<<
    // self.speed = 1000; // Reset speed to initial value
    // self.disclanded = FALSE;


        //     self.velocity = '0 0 1' * 1000; // Set velocity to straight up
        // self.speed = 1000; // Reset speed to initial value
    self.nextthink = 0.1;
  }

  // }
  // Update position
  // self.origin = self.origin + self.velocity * frametime;

  // // Check for collisions
  // start = self.origin;
  // end = start + self.velocity * frametime;
  // traceline(start, end, TRUE, self);

  // if (trace_plane_normal == '0 0 1') {
  //     sprint (self.owner,"OMG THINK FLOOR OMG\n");
  // }
  // if (trace_fraction < 1.0) {
  //   self_sprint(self.owner, "trace_fraction < 1.0\n");
  //   self.touch = ProjectileTouch;
  //   self.touch();
  // } else {
  //   self_sprint(self.owner, "trace_fraction >= 1.0\n");
  //   self.think = ProjectileThink;
  // }
};

// void() ShootingStar  = {
void ShootingStar() = {
  local entity missile;
  local entity glowEffect;
  local entity mpuff;
  local vector start;
  local vector finish;
  local vector dir;
  local float speedfactor;

  if ( self.discfired )
  {
    self.mydisc.think = RemoveProjectile;
    self.mydisc.nextthink = time;
    if ( !self.mydisc.bounced )
    {
      self.mydisc.bounced = TRUE;

    }
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
  // self.disclanded = FALSE;
  missile.disclanded = FALSE;
  missile.movetype = MOVETYPE_FLYMISSILE;
  missile.bounced = 0.000;
  missile.classname = "shootingstar";
  missile.solid = SOLID_BBOX;
  makevectors (self.v_angle);
  start = (self.origin + '0.000 0.000 16.000');
  finish = (start + (v_forward * 600.000));
  dir = (finish - start);
  if (missile.owner.super_damage_finished > time)
  {
    missile.velocity = ((normalize (dir) * 680) * 4);
  }
  else
  {
    missile.velocity = (normalize (dir) * 680);
  }
  missile.velocity = (missile.velocity * (1 + speedfactor));
  missile.angles = vectoangles (missile.velocity);
  missile.attack_finished = (time + 8);
  missile.nextthink = time;
  missile.touch = ProjectileTouch;
  missile.think = ProjectileThink;
  // missile.skin = 0;
  setmodel (missile,"progs/lavaball.mdl");
  setsize (missile,'0.000 0.000 0.000','0.000 0.000 0.000');
  setorigin (missile,((self.origin + (v_forward * 8.000)) + '0.000 0.000 16.000'));
  missile.lastknownvelocity = missile.velocity;

    // // Spawn glow effect entity
    // glowEffect = spawn();
    // glowEffect.movetype = MOVETYPE_NOCLIP;
    // glowEffect.solid = SOLID_NOT;
    // glowEffect.effects = EF_SPHERETRANSLUCENT; // Set the desired glow effect
    // glowEffect.scale = GLOW_RADIUS; // Set the glow radius

    // missile.glowEffect = glowEffect; // Attach the glow effect to the projectilekk
  missile.effects = missile.effects & EF_MUZZLEFLASH;
  missile.lastdmgtime = time;
  missile.runetime = time + 5; // Destroy self after 5 seconds;
};

