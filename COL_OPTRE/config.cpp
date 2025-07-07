class cfgPatches {
    class COL_OPTRE {
        name = "Coleoptera OPTRE Compat";
        authors[]={
            "Gray"
        };
        units[]={};
        weapons[]={};
        requiredVersion=0.1;
        requiredAddons[]={
            "OPTRE_Weapons_Backpacks"
        };
    };
};
class cfgVehicles {
    class OPTRE_S12_SOLA_Jetpack;
    class OPTRE_S12_SOLA_Jetpack_On;
    class OPTRE_S12_SOLA_Jetpack_Spartan;
    class OPTRE_S12_SOLA_Jetpack_On_Spartan;
    
    // normal people size
    class COL_Backpack_OPTRE_Jetpack: OPTRE_S12_SOLA_Jetpack {
        scope = 2;
        scopeArsenal = 2;
        displayName = "[COL] S-12 SOLA (A)";
        author = "Gray";
        isColeoptera = 1;
        longJumpCost = 50;
        shortJumpCost = 25;
        maxEnergy = 100;
        takeFromConfig = 0;
        UIcanShow = 1;
        chargeRate = 1; // default settings values
        chargeAmount = 2; // to test these working or not
        colCanOpen = 1;
        colOpenBag = "COL_Backpack_OPTRE_Jetpack_On";
    };
    class COL_Backpack_OPTRE_Jetpack_On: OPTRE_S12_SOLA_Jetpack_On {
        scope = 1;
        scopeArsenal = 1;
        displayName = "[COL] S-12 SOLA (A)";
        author = "Gray";
        model = "\OPTRE_weapons\backpacks\jetpack_on.p3d";
        isColeoptera = 1;
        longJumpCost = 50;
        shortJumpCost = 25;
        maxEnergy = 100;
        takeFromConfig = 0;
        UIcanShow = 1;
        chargeRate = 1; // default settings values
        chargeAmount = 2; // to test these working or not
        colClosedBag = "COL_Backpack_OPTRE_Jetpack";
    };

    // spartan people size
    class COL_Backpack_Spartan_Jetpack: OPTRE_S12_SOLA_Jetpack_Spartan {
        scope = 2;
        scopeArsenal = 2;
        displayName = "[COL] S-12 SOLA (Spartan A)";
        author = "Gray";
        isColeoptera = 1;
        longJumpCost = 50;
        shortJumpCost = 25;
        maxEnergy = 100;
        takeFromConfig = 0;
        UIcanShow = 1;
        chargeRate = 1; // default settings values
        chargeAmount = 2; // to test these working or not
        colOpenBag = "COL_Backpack_Spartan_Jetpack_On";
    };
    class COL_Backpack_Spartan_Jetpack_On: OPTRE_S12_SOLA_Jetpack_On_Spartan {
        scope = 1;
        scopeArsenal = 1;
        displayName = "[COL] S-12 SOLA (Spartan A)";
        author = "Gray";
        model = "\OPTRE_weapons\backpacks\jetpack_on_Spartan.p3d";
        isColeoptera = 1;
        longJumpCost = 50;
        shortJumpCost = 25;
        maxEnergy = 100;
        takeFromConfig = 0;
        UIcanShow = 1;
        chargeRate = 1; // default settings values
        chargeAmount = 2; // to test these working or not
        colClosedBag = "COL_Backpack_Spartan_Jetpack";
    };
};