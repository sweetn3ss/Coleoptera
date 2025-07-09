params [["_unit",objNull,[objNull]]];

private _items = backpackItems _unit;

private _mags = magazinesAmmoCargo backpackContainer _unit;

{_items - _x # 0} forEach _mags;

// return format [backpackItems,backpackMagazines]
[_items,_mags]