// JavaScript Document
function validaBtnClave(){
	var dia = document.form.txtf_t1.value;
	var mes = document.form.txtf_t2.value;
	var servicio = document.form.txtf_servicio.value;
	var encargado = document.form.txtf_encarser.value;
	var clave = document.form.txtf_med1.value;
	var mensaje ="Falta la siguiente información: \n";
	if (clave===""){
		mensaje = mensaje+'Clave del insumo \n';
		document.form.txtf_med1.focus();
	}
	if (encargado===""){
		mensaje = mensaje+'Nombre del encargado \n';
		document.form.txtf_encarser.focus();
	}
	if (servicio===""){
		mensaje = mensaje+'Servicio \n';
		document.form.txtf_servicio.focus();
	}
	if (mes===""){
		mensaje = mensaje+'Mes \n';
		document.form.txtf_t2.focus();
	}
	if (dia===""){
		mensaje = mensaje+'Día \n';
		document.form.txtf_t1.focus();
	}
	if (encargado==="" || servicio === "" || clave==="" || dia==="" || mes===""){
		alert(mensaje);
		return false;
		
	}
	document.form.txtf_sol1.focus();
	return true;
}

function validaBtnDescripcion(){
	var servicio = document.form.txtf_servicio.value;
	var encargado = document.form.txtf_encarser.value;
	var clave = document.form.txtf_descmed.value;
	var mensaje ="Falta la siguiente información: \n";
	if (clave===""){
		mensaje = mensaje+'Descripción del insumo \n';
		document.form.txtf_med1.focus();
	}
	if (encargado===""){
		mensaje = mensaje+'Nombre del encargado \n';
		document.form.txtf_encarser.focus();
	}
	if (servicio===""){
		mensaje = mensaje+'Servicio \n';
		document.form.txtf_servicio.focus();
	}
	if (encargado==="" || servicio === "" || clave===""){
		alert(mensaje);
		return false;
		
	}
	return true;
}

function validaBtnVer(){
	var servicio = document.form.txtf_servicio.value;
	var encargado = document.form.txtf_encarser.value;
	var insumo = document.form.select_servi2.value;
	var mensaje ="Falta la siguiente información: \n";
	if (insumo===""){
		mensaje = mensaje+'Seleccionar insumo del insumo \n';
		document.form.select_servi2.focus();
	}
	if (encargado===""){
		mensaje = mensaje+'Nombre del encargado \n';
		document.form.txtf_encarser.focus();
	}
	if (servicio===""){
		mensaje = mensaje+'Servicio \n';
		document.form.txtf_servicio.focus();
	}
	if (encargado==="" || servicio === "" || insumo===""){
		alert(mensaje);
		return false;
		
	}
	return true;
}