var enemy = instance_place(x,y,obj_en_parent);

if (enemy != noone) {
    with (obj_player) {
        
        
        if (!swing_has_hit) {
            var damnage = 0;
            if (equipped == OHS_ID)
                damnage = OHS_DMG;
            else if (equipped == CANDLE_ID)
                damnage = CANDLE_DMG;
            else if (equipped == THS_ID)
                damnage = THS_DMG;
                
            enemy.en_health -= damnage;
            swing_has_hit = true;
            
            if (equipped == OHS_ID) {
                with (obj_snd_player) {
                    //sndOHSswing();
                    sndOHSdmg();
                }
            } else if (equipped == THS_ID) {
                with (obj_snd_player) {
                    //sndOHSswing();
                    sndTHSdmg();
                }
            } else if (equipped == CANDLE_ID) {
                with (obj_snd_player) {
                    //sndOHSswing();
                    sndCandleDmg();
                }
            }
        }
    }
}
