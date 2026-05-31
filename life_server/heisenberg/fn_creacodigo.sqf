
/*
por: Heisenberg White

Función: Muestra lo que le envies como parametro en un codigo
Params:
	0: STRING - Metes codigo y te crea dialogo con el.
	


	returns: SCALAR
*/


_p = param [0,"ERROR"];



disableserialization;
createdialog "papelh";
((uinamespace getvariable "papelh") displayctrl 1400) ctrlsettext (format ["%1", _p]);
	