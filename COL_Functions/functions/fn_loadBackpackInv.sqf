// should take both [_unit,[_items,_mags]] OR [_unit,_items,_mags]
params [["_unit",objNull,[objNull]],["_items",[],[[]]],["_mags",[],[[],nil]]];

if (isNil _mags) then {
    _mags = _items # 1;
    _items = _items # 0;
};

_unit addItemToBackpack _items;
{_unit addMagazine _x} forEach _mags;

