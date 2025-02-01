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
        isColeoptera = 1;
        longJumpCost = 50;
        shortJumpCost = 25;
        maxEnergy = 100;
        takeFromConfig = 0;
        UIcanShow = 1;
        chargeRate = 1; // default settings values
        chargeAmount = 2; // to test these working or not
        camoTypes[] = {
            "BLK",
            "DES",
            "SNO",
            "WDL"
        };
    };
    class COL_Backpack_Coleoptera_BLK2: B_Bergen_dgtl_F {
        scope = 2;
        scopeArsenal = 2;
        displayName = "[COL] Coleoptera Pack 2";
        author = "Gray";
        isColeoptera = 1;
        longJumpCost = 50;
        shortJumpCost = 25;
        maxEnergy = 150;
        takeFromConfig = 1;
        UIcanShow = 1;
        chargeRate = 2;
        chargeAmount = 5;
        camoTypes[] = {
            "BLK",
            "DES",
            "SNO",
            "WDL"
        };
    };
};