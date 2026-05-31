// Creado KillzoneKid y editado por Rosen para cine

{with uiNamespace do {   
   1100 cutRsc ["RscMissionScreen","PLAIN"]; 
  _scr = BIS_RscMissionScreen displayCtrl 1100; 
  _scr ctrlSetPosition [-10,-10,0,0]; 
  _scr ctrlSetText "\tragaperras\video.ogv"; 
  _scr ctrlAddEventHandler ["VideoStopped", { 
        (uiNamespace getVariable "BIS_RscMissionScreen") closeDisplay 1; 
  }]; 
  _scr ctrlCommit 0; 
 }; 
 monitor1 setObjectTexture [0,"\tragaperras\video.ogv"];}  remoteExec ["bis_fnc_spawn", -2, true];