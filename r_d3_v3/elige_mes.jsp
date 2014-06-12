<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.text.*" import="java.lang.*" import="java.util.*" import= "javax.swing.*" import="java.io.*" import="java.text.DateFormat" 
import="java.text.ParseException" import="java.text.DecimalFormat" import="java.text.SimpleDateFormat" import="java.util.Calendar" import="java.util.Date" errorPage="" %>

<%
String noaf_jv="",nom_jv="",ap_jv="",ap5_jv="",am_jv="",nombre1_jv="",clave_jv="",clave2_jv="",descrip_jv="",origen_jv="",exist_jv="",origen2="",exist2_jv="0",total22_jv="",clave22_jv="",origen22_jv="",descrip22_jv="";
String cant_ps_jv="", clave_ps_jv="", total_cant="", total_cajas="", total_resto="";
int tot_cajas_int=0, tot_resto_int=0;
String but="r";
int cont6=0,am2_jv=0,exist=0,ap2_jv=0,total=0;
ResultSet rset_001=null;
ResultSet rset_002=null;
String clave1_jv="",descrip1_jv="",origen1_jv="",exist1_jv="",solo_mes="";
String fecha="",fecha2="",mes="";
mes= request.getParameter("txtf_caduc");
//out.print(mes);

if (mes==null){
	//out.print("si entro");
}else{
	
		if (mes.equals("01")){
				solo_mes="ENERO";
		}
		if (mes.equals("02")){
				solo_mes="FEBRERO";
		}
		if (mes.equals("03")){
				solo_mes="MARZO";
		}
		if (mes.equals("04")){
				solo_mes="ABRIL";
		}
		if (mes.equals("05")){
				solo_mes="MAYO";
		}
		if (mes.equals("06")){
				solo_mes="JUNIO";
		}
		if (mes.equals("07")){
				solo_mes="JULIO";
		}
		if (mes.equals("08")){
				solo_mes="AGOSTO";
		}
		if (mes.equals("09")){
				solo_mes="SEPTIEMBRE";
		}
		if (mes.equals("10")){
				solo_mes="OCTUBRE";
		}
		if (mes.equals("11")){
				solo_mes="NOVIEMBRE";
		}
		if (mes.equals("12")){
				solo_mes="DICIEMBRE";
		}
	

}


fecha=2014+"-"+mes+"-"+01;
fecha2=2014+"-"+mes+"-"+31;


Connection conn__001 = DriverManager.getConnection("jdbc:mysql://localhost/r_d_c_externa", "root", "eve9397");
  Statement stmt = conn__001.createStatement();
  Statement stmt01 = conn__001.createStatement();
  Statement stmt02 = conn__001.createStatement();
  
  
  
  NumberFormat nf1 = NumberFormat.getInstance(Locale.US);

try { 

        but=""+request.getParameter("Submit");
		//out.print(but);
		//but2=""+request.getParameter("Submit2");
		//out.print("but ="+but);
        
    }catch(Exception e){System.out.print("not");} 
	
	

	
	
		 	
	
	
	


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>.: PENDIENTES POR COBRAR:.</title>


<script language="javascript" src="list02.js">

function close1()
{//alert("huge");


top.close();  
/*if(navigator.appName=="Microsoft Internet Explorer") { 
this.focus();self.opener = this;self.close(); } 
else { window.open('','_parent',''); window.close(); } 

*/
}



</script>
<script>
function foco_inicial(){
if (document.form.txtf_clave2.value==""){
document.form.txtf_clave.focus();
}
else
{
document.form.txtf_cant.focus();
}
}
</script>
<link rel="stylesheet" href="mm_restaurant1.css" type="text/css" />
<style type="text/css">
<!--
body {
	background-color: #E6E6E6;
}
.style1 {color: #000000}
.style2 {
	font-size: 8px;
	color: #009999;
}
.style5 {font-size: 36}
.Estilo8 {color: #FFFFFF}
.Estilo9 {font-size: 14px}
.Estilo10 {
	font-size: 12px;
	font-weight: bold;
}
.Estilo11 {font-size: 12px}
.Estilo12 {font-size: 14px; font-weight: bold; }
.Estilo13 {color: #009999}
.Estilo14 {color: #FFFFFF; font-size: 14px; }
-->
</style></head>

<body onLoad="foco_inicial();">
<table width="866" height="346" border="3" align="center" cellpadding="2" bgcolor="#FFFFFF">
  <tr>
  
    <td width="650"><form id="form" name="form" method="post" action="elige_mes.jsp">
        <a href="tipo_pendiente.jsp">Regresar a Menú</a>
        <table width="999" height="227" border="0" align="center" cellpadding="2">
        <tr>
          <td height="90" colspan="6" bgcolor="#FFFFFF" class="logo style1">
            <div align="center">
  <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="114" height="78">
    <param name="movie" value="anima1p.swf" />
    <param name="quality" value="high" />
    <embed src="anima1p.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="114" height="78"></embed>
  </object>
  <a name="Arriba" id="Arriba"></a>&nbsp;PENDIENTES POR COBRAR DEL 2014
              <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="114" height="78">
                <param name="movie" value="anima4p.swf" />
                <param name="quality" value="high" />
                <embed src="anima4p.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="114" height="78"></embed>
              </object>
            </div></td>
          </tr>
		  <tr>
			<td align="center" colspan="4" bgcolor="#FFFFFF" class="logo style1">RECETA COLECTIVA<br /> CONSULTA EXTERNA</td>
		  </tr>
		  <tr>
			<td align="center" colspan="4" bgcolor="#FFFFFF" class="logo style1"><%=solo_mes%></td>
		  </tr>
       
<tr>
          <td height="14" colspan="6" bgcolor="#009999" align="center">
		  <span class="style2">ii<span class="Estilo8">
		  <input type="submit" name="Submit" value="Mostrar"/>
		  <select name="txtf_caduc" class="ver">
              <option value="00">-- Seleccione Mes--</option>
                <option value="01">Enero</option>
				<option value="02">Febrero</option>
				<option value="03">Marzo</option>
				<option value="04">Abril</option>
				<option value="05">Mayo</option>
				<option value="06">Junio</option>
				<option value="07">Julio</option>
				<option value="08">Agosto</option>
				<option value="09">Septiembre</option>
				<option value="10">Octubre</option>
				<option value="11">Noviembre</option>
				<option value="12">Diciembre</option>

            </select>
          </tr>
	    <tr>
  <%if (but.equals("Mostrar")){%>        
		  <td height="14" colspan="6" bgcolor="#009999">		
		  <span class="style2">ii<span class="Estilo8">
		  <span class="Estilo9">Exportar&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
		  <img src="icono_excel.gif" border="0" usemap="#Map2"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span><span class="Estilo13"><span class="Estilo14"><a href="#Total"></a></span></span></td>
       </tr>
		  
        
		<tr>
		  
          <td height="20" bgcolor="#FFFFFF" class="logo style1"><div align="center">CLAVE</div></td>
          <td bgcolor="#FFFFFF" class="logo style1"><div align="center">DESCRIPCI&Oacute;N</div></td>
          <td bgcolor="#FFFFFF" class="logo style1"><div align="center" >CANTIDAD</div></td>
		  <td bgcolor="#FFFFFF" class="logo style1"><div align="center" >ORIGEN</div></td>
        </tr>
		
		<%
			rset_001=stmt.executeQuery ("select clave, descrip, pendientes, origen from pendientes_col where mes between '"+fecha+"' and '"+fecha2+"' order by (clave+0)");
			
			//out.print(mes);
			//out.print(solo_mes);
			
			//out.print(solo_mes);
			
			while (rset_001.next())
			 {
				 %>
				<tr>
				  
				  <td width="157" height="20"><div align="center"><%=rset_001.getString("clave") %></div></td>
				  <td width="484" class="bodyText"><%=rset_001.getString("descrip") %></td>
				  <td width="114"><div align="center"><%=rset_001.getString("pendientes") %></div></td>
				  <td width="114"><div align="center"><%=rset_001.getString("origen") %></div></td>
				</tr>
				<%
			}
		
		
		
		
		%>
		
		<tr>
		<!--td height="22"><a href="#Arriba">Ir al Inicio</a></td-->
		<td>
		  <p align="right" class="Estilo9"><strong><a name="Total" id="Total"></a></strong></p>		  </td>
		<td><div align="center" class="Estilo12">
		      
		    </div></td>
			<td><div align="center" class="Estilo11"> 
			
		    
			 
			 <%
					
			 %>
			 
			 
			 
			 
			 
			 
		<%}%>
		    </div></td>
			
			<td>
			<div align="center" class="Estilo9"></div>			</td>
		</tr>
      </table>
          </form>
    </td>
  </tr>
</table>
<map name="Map2" id="Map2">
  <area shape="rect" coords="4,2,31,28" href="elige_mes_excel.jsp?fecha=<%=fecha%>&fecha2=<%=fecha2%>&mesrep=<%=solo_mes%>" />
</map>
</body>
</html>
