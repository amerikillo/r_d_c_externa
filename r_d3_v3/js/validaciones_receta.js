// JavaScript Document
function validaFolio(){
	var dia = document.form.txtf_t1.value;
	var mes = document.form.txtf_t2.value;
	var folio = document.form.txtf_foliore.value;
	var folio_sp=document.form.txtf_cb.value;
	var mensaje ="Falta la siguiente información: \n";
	if (folio_sp===""){
		mensaje = mensaje+'Número de folio de seguro popular \n';
		document.form.txtf_cb.focus();
	}
	if (folio===""){
		mensaje = mensaje+'Número de folio de receta \n';
		document.form.txtf_foliore.focus();
	}
	if (mes===""){
		mensaje = mensaje+'Mes \n';
		document.form.txtf_t2.focus();
	}
	if (dia===""){
		mensaje = mensaje+'Día \n';
		document.form.txtf_t1.focus();
	}
	if (folio==="" || folio_sp === "" || dia === "" || mes ===""){
		alert(mensaje);
		return false;
		
	}
	return true;
}

function validaBtnMedico(){
	var folio = document.form.txtf_foliore.value;
	var folio_sp=document.form.txtf_paciente.value;
	var cedula=document.form.txtf_medico.value;
	var mensaje ="Falta la siguiente información: \n";
	if (cedula===""){
		mensaje = mensaje+'Cédula del médico \n';
		document.form.txtf_medico.focus();
	}
	if (folio_sp===""){
		mensaje = mensaje+'Capturar o seleccionar Paciente \n';
		document.form.txtf_cb.focus();
	}
	if (folio===""){
		mensaje = mensaje+'Número de folio de receta \n';
		document.form.txtf_foliore.focus();
	}
	if (folio==="" || folio_sp === "" || cedula===""){
		alert(mensaje);
		return false;
		
	}
	return true;
}

function validaBtnClave(){
	var folio = document.form.txtf_foliore.value;
	var folio_sp=document.form.txtf_paciente.value;
	var medico=document.form.txtf_nomed.value;
	var medicamento=document.form.txtf_med1.value;
	var mensaje ="Falta la siguiente información: \n";
	if (medicamento===""){
		mensaje = mensaje+'Clave de medicamento \n';
		document.form.txtf_med1.focus();
	}
	if (medico===""){
		mensaje = mensaje+'Capturar Médico \n';
		document.form.txtf_medico.focus();
	}
	if (folio_sp===""){
		mensaje = mensaje+'Capturar o seleccionar Paciente \n';
		document.form.txtf_cb.focus();
	}
	if (folio===""){
		mensaje = mensaje+'Número de folio de receta \n';
		document.form.txtf_foliore.focus();
	}
	if (folio==="" || folio_sp === "" || medico==="" || medicamento===""){
		alert(mensaje);
		return false;
	}
	return true;
}
