class Dialogo_Multa
    {
        idd = 19997;
        duration = 10;     
        fadein = 1;
        fadeout = 1;
        movingEnable = false;
        movingEnabled = false;
        onLoad = "uiNamespace setVariable ['dialogmulta',_this select 0]";
 
        controlsBackground[] = {};
 
        class controls {
 
            class MULTA: RscPicture
            {
                idc = 1200;
                text = "\pop_codigo\pics\multa.jpg";
                x = 0.00499997 * safezoneW + safezoneX;
                y = 0.016 * safezoneH + safezoneY;
                w = 0.397031 * safezoneW;
                h = 0.297 * safezoneH;
            };
            class NOMBRE: MultaRscButton
            {
                text = "";
                idc = 1600;
                x = 0.108125 * safezoneW + safezoneX;
                y = 0.17 * safezoneH + safezoneY;
                w = 0.0928125 * safezoneW;
                h = 0.044 * safezoneH;
            };
            class VEHICULO: MultaRscButton
            {   text = "";
 
                idc = 1601;
                x = 0.247344 * safezoneW + safezoneX;
                y = 0.17 * safezoneH + safezoneY;
                w = 0.139219 * safezoneW;
                h = 0.044 * safezoneH;
            };
            class TIPO: MultaRscButton
            {   text = "";
 
                idc = 1602;
                x = 0.0617187 * safezoneW + safezoneX;
                y = 0.236 * safezoneH + safezoneY;
                w = 0.139219 * safezoneW;
                h = 0.044 * safezoneH;
            };
            class MATRICULA: MultaRscButton
            {   text = "";
 
                idc = 1603;
                x = 0.206094 * safezoneW + safezoneX;
                y = 0.258 * safezoneH + safezoneY;
                w = 0.0773437 * safezoneW;
                h = 0.033 * safezoneH;
            };
            class ABONO: MultaRscButton
            {   text = "";
 
                idc = 1604;
                x = 0.319531 * safezoneW + safezoneX;
                y = 0.247 * safezoneH + safezoneY;
                w = 0.0721875 * safezoneW;
                h = 0.044 * safezoneH;
            };
            class FECHA: MultaRscButton
            {   text = "";
 
                idc = 1605;
                x = 0.04625 * safezoneW + safezoneX;
                y = 0.115 * safezoneH + safezoneY;
                w = 0.0928125 * safezoneW;
                h = 0.044 * safezoneH;
            };
            class HORA: MultaRscButton
            {   text = "";
 
                idc = 1606;
                x = 0.164844 * safezoneW + safezoneX;
                y = 0.115 * safezoneH + safezoneY;
                w = 0.0360937 * safezoneW;
                h = 0.044 * safezoneH;
            };
            class EXPEDIENTE: MultaRscButton
            {   text = "";
 
                idc = 1607;
                x = 0.206094 * safezoneW + safezoneX;
                y = 0.049 * safezoneH + safezoneY;
                w = 0.180469 * safezoneW;
                h = 0.055 * safezoneH;
            };
 
        };
    };