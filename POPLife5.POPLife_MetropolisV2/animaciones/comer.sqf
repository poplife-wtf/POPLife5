/////////////////////////////
// TDR ACJ
// Animaciones
//////////////////////////

if (!isNil "life_fnc_animsync") then
{
[player,"CL3_anim_eat"] remoteExec ["life_fnc_animSync",-2];
} else
{
player switchmove "CL3_anim_eat"
};

[] spawn
{
sleep 7;
[player,""] remoteExec ["life_fnc_animSync",-2];
A3L_isDancing = false;
};
//player switchmove "CL3_anim_drink";