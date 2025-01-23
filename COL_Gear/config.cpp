class cfgPatches {
    class COL_Gear {
        name = "Coleoptera Gear";
        author = "Gray";
        units[]={};
        weapons[]={};
        requiredVersion = 0.1;
        requiredAddons[] = {
            "A3_Supplies_F_Exp"
        };
    };
};
class cfgVehicles {
    class B_Bergen_dgtl_F;
    class COL_Backpack_Coleoptera_BLK: B_Bergen_dgtl_F {
        scope = 2;
        scopeArsenal = 2;
        displayName = "[COL] Coleoptera Pack";
        author = "Gray";
        camoTypes[] = {
            "BLK",
            "DES",
            "SNO",
            "WDL"
        };
    };
};