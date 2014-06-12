<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.text.ParseException" import="java.text.SimpleDateFormat" import="java.util.Calendar" import="java.util.Date" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<% Class.forName("org.gjt.mm.mysql.Driver");
Connection conn10 = DriverManager.getConnection("jdbc:mysql://localhost/r_d_c_externa", "root", "eve9397");
        Statement stmt__001 = conn10.createStatement();
		Statement stmt__002 = conn10.createStatement();
		Statement stmt_001 = conn10.createStatement();
		Statement stmt_4 = conn10.createStatement();
		ResultSet rset__001 = null;
		ResultSet rset__002 = null;
		ResultSet rset_paso = null;
		ResultSet rset_001=null;
		ResultSet rset_1=null;
		ResultSet rset_2=null;
		ResultSet rset_7 = null;
 //ResultSet rset_1 =null;
 

String llamo_cat_jv="",date1_jv="",date2_jv="",date11_jv="",date22_jv="",boton_jv="",tip_uni_jv="",date_jv="",sol="",sur="",org_jv="",precio="",org1_jv="",medico="",cedula="",folio="",estatus="",cantidad="",clave_antibiotico="";
String saldo="";
int sol1=0,sur1=0,folio_re2=0;
	  try {
	        clave_antibiotico=request.getParameter("clave");
       		llamo_cat_jv=request.getParameter("unidad");   
			boton_jv=request.getParameter("boton");   
			date1_jv=request.getParameter("f1"); 
			date2_jv=request.getParameter("f2");
			date11_jv=request.getParameter("f1"); 
			date22_jv=request.getParameter("f2");
			//org_jv=request.getParameter("org");
			//org1_jv=request.getParameter("org");	   
	  } catch (Exception e) { }
 
 if(org1_jv.equals("1"))
{
org1_jv="SSD";
}
if (org1_jv.equals("2")){
org1_jv="SORIANA";
}

if(org1_jv.equals("3"))
{
org1_jv="DONACIÓN";
}

     

     int tam=0,tam2=0,x1=0;
     String cad1[]=new String[1000];  //array for show clients 
     String arr[]= new String[5000];     //array for the 
	 String lotes[]= new String[5000];
	 String lotes2[]= new String[5000];
	 String lotes3[]= new String[5000];
	 String exis[]= new String[5000];
	 
	 String cie[]= new String[5000];
	 
	 String cad[]= new String[5000];
	 String cad2[]= new String[5000];
	 String cad3[]= new String[5000];
	 String censo[]=new String[1000];
	 String censo2[]=new String[1000];
	 lotes[0]="";
	 lotes2[0]="";
	 cad[0]="";
	 cad2[0]="";
     String name="";
     String service_jv="";
	 int pos=0;
	 int pos2=0;
	 int pos3=0;
	 int cont2=0;
	 int cont3=0;
     String mail[]=new String[10];
	 String meses[]=new String[12];
	 meses[0]="Enero";
	 meses[1]="Febrero";
	 meses[2]="Marzo";
	 meses[3]="Abril";
	 meses[4]="Marzo";
	 meses[5]="Abril";
	 meses[6]="Mayo";
	 meses[7]="Junio";
	 meses[8]="Julio";
	 meses[9]="Agosto";
	 meses[10]="Septiembre";
	 meses[11]="Octubre";
	 meses[0]="Noviembre";
	 meses[1]="Diciembre";
	 
     int altaOK=0;
     int altaOKAY=0;	 
     String but="r";
	 String but_juris="e";
	 String clave="";
	 String clave_anti="";
	 String presentacion="-";
	 int cantidadCajas=0;
	 int totalCajasAmpuleo=0;
	 String presentaInfo = "-";
	 int piezasPorAmpula=0;
	 String ampula ="-";

     String juris_jv="";
	 //String juris2_jv="";
     String cs_jv="";
	 String lotes2_jv="";
	 
	 String check=request.getParameter("txtf_5");
	 int c=0;
	 int tam_3=0;
	 mail[0]="lasalle_tur@yahoo.com";
     String val="h";
	 String user="h";
	 //variables para mostrar en campos
	    String clave_jv= "";
		String desc_jv=  "";
	    String lote_jv= "";
		String cadu_jv= "";
		String exis_jv= "";
		String costo_jv= "";
int cont=1;
//Rutina para obtener las claves 
	 
	 

try{
        altaOK=Integer.parseInt(request.getParameter("altaok"));   
       }catch(Exception e){ System.out.print("Doesn't make the altaOK"); }
	   
   try { 
        but=""+request.getParameter("Submit");
        but_juris=""+request.getParameter("option1");
		
		//altaOK="no";
    }catch(Exception e){System.out.print("not");}



	  
%>
<%
rset_001 = stmt_001.executeQuery("SELECT STR_TO_DATE('"+date1_jv+"', '%d/%m/%Y')"); 
                    while(rset_001.next()){
                    date1_jv= rset_001.getString("STR_TO_DATE('"+date1_jv+"', '%d/%m/%Y')");
					}
rset_001 = stmt_001.executeQuery("SELECT STR_TO_DATE('"+date2_jv+"', '%d/%m/%Y')"); 
                    while(rset_001.next()){
                    date2_jv= rset_001.getString("STR_TO_DATE('"+date2_jv+"', '%d/%m/%Y')");
					}
					
		if(boton_jv.equals("Show ALL"))
	{
       //rset__001=stmt__001.executeQuery("select fecha,folio_re,nombre_medi,cedula_medi,clave,descrip,cant_sol,cant_sur,ampuleo from receta where pendientes not in ('T') and unidad='"+llamo_cat_jv+"' and fecha between '"+date1_jv+"' and '"+date2_jv+"' and partida='"+org_jv+"' and tipo_receta='rf' order by (fecha),folio_re asc");
       rset__001=stmt__001.executeQuery("select clave,cant_anterior,cant_mov,cant_actual,fecha,status,folio,medico,cedula,unidad from modificacion where unidad='"+llamo_cat_jv+"' and clave='"+clave_antibiotico+"' and fecha between '"+date1_jv+"' and '"+date2_jv+"' order by (fecha) asc");
	}

%>



<% java.util.Calendar currDate = new java.util.GregorianCalendar();
   // add 1 to month because Calendar's months start at 0, not 1
   int month = currDate.get(currDate.MONTH)+1;
   int day = currDate.get(currDate.DAY_OF_MONTH);
   int year = currDate.get(currDate.YEAR);
   
   String date=" "+year;
   date= date+"/"+month;
   date= date+"/"+day;  
  // out.println(altaOK);
  
  response.setContentType("application/vnd.ms-excel");
  response.setHeader("Content-Disposition","attachment; filename=REPORTE DE ANTIBIOTICOS.xls");
 
%>


<html xmlns="http://www.w3.org/1999/xhtml">
<!-- DW6 -->
<head>
<script language="javascript" src="list02.js"></script>
<!-- Copyright 2005 Macromedia, Inc. All rights reserved. -->
<title>:: REPORTE SALIDA DE ANTIBIOTICOS ::</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<!--link rel="stylesheet" href="mm_travel2.css" type="text/css" /-->
<script language="JavaScript" type="text/javascript">
//--------------- LOCALIZEABLE GLOBALS ---------------
var d=new Date();
var monthname=new Array("January","February","March","April","May","June","July","August","September","October","November","December");
//Ensure correct for language. English is "January 1, 2004"
var TODAY = monthname[d.getMonth()] + " " + d.getDate() + ", " + d.getFullYear();
//---------------   END LOCALIZEABLE   ---------------

//<script language="javascript" src="list02.js"></script>
<style type="text/css">
<!--
.style1 {
	color: #000000;
	font-weight: bold;
}
.style33 {font-size: x-small}
.style40 {font-size: 9px}
.style41 {font-size: 9}
.style42 {font-family: Arial, Helvetica, sans-serif}
.style32 {font-size: x-small; font-family: Arial, Helvetica, sans-serif; }
.style43 {
	font-size: x-small;
	color: #FFFFFF;
	font-weight: bold;
}
.style47 {font-size: x-small; font-weight: bold; }
.style49 {font-size: x-small; font-family: Arial, Helvetica, sans-serif; font-weight: bold; }
.style50 {color: #000000}
.style51 {color: #BA236A}
.style58 {font-size: x-small; font-weight: bold; color: #666666; }
.style66 {font-size: x-small; font-weight: bold; color: #333333; }
a:hover {
	color: #333333;
}
.style68 {color: #CCCCCC}
.style75 {color: #333333; }
a:link {
	color: #711321;
}
.style76 {color: #003366}
.style77 {
	color: #711321;
	font-weight: bold;
}
.Estilo1 {color: #FFFFFF}
-->
</style>
</head>
<body bgcolor="#ffffff" onload="fillCategory2()">
<p>
  <%
    
	 if (altaOK==0)
       { 
	  
      
%>
</p>
<table width="618" border="0" align="center" cellpadding="2">
  <tr>
    
    <td height="63" colspan="11" align="center"id="logo"><div align="center">
      <p><span> GOBIERNO DEL ESTADO DE DURANGO<br />
        SECRETARIA DE SALUD</br>
        TIENDAS SORIANA S.A DE C.V<br />
        REPORTE DE ANTIBIOTICOS <br />
        DE LA UNIDAD: <%=llamo_cat_jv%><br />
        PERIODO: <%=date1_jv%> al <%=date2_jv%></span></p>
      <p><span>CONSULTA EXTERNA <br />
        </span>
        
        </p>
    </div></td>
    
  </tr>
  
  
</table>
<table width="40%" border="0" align="center" cellpadding="0" cellspacing="0">
  </br>
  </br>  
  </br>
  </br>
  
  <tr>
    <td colspan="1" bgcolor="#003366"><img src="mm_spacer.gif" alt="" width="1" height="1" border="0" /></td>
  </tr>

  <tr bgcolor="#CCFF99">
  	<td height="25" colspan="1" bgcolor="#2CACAD" id="dateformat" align="center">&nbsp;&nbsp;<span class="style76">
  	  <script language="JavaScript" type="text/javascript">
      //document.write(TODAY);	</script>
      </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Estilo1">REPORTE DE ANTIBIOTICOS</span></td>
  </tr>
 <tr>
    <td colspan="1" bgcolor="#003366"><img src="mm_spacer.gif" alt="" width="1" height="1" border="0" /></td>
  </tr>

 <tr>
    
    <td colspan="2" valign="top"><form action="antibioticos_far.jsp" method="post" name="form" onSubmit="javascript:return ValidateAbas(this)">
    <table width="718" border="0" align="center">
      <tr>
        <td width="518"><table width="712" border="1">
            <tr bgcolor="#2CACAD">
			  <td width="161" align="center"><span class="Estilo1"><strong>Fecha Entrada</strong></span></td>
              <td width="161" align="center"><span class="Estilo1"><strong>Fecha Salida</strong></span></td>
			  <td width="259" align="center"> <span class="Estilo1"><strong>Nombre M&eacute;dico </strong></span></td>
			  <td width="50" align="center"> <span class="Estilo1"><strong>Cedula</strong></span></td>
			  <td width="50" align="center"> <span class="Estilo1"><strong>domicilio</strong></span></td>
              <td width="33" align="center"> <span class="Estilo1"><strong>Numero de la Receta o Factura</strong></span></td>    
			  <td width="56" align="center"> <span class="Estilo1"><strong>Clave</strong></span></td>			  
              <td width="56" align="center"> <span class="Estilo1"><strong>Entrada</strong></span></td>
              <td width="193" align="center"> <span class="Estilo1"><strong>Salida</strong></span></td>
              <td width="44" align="center"> <span class="Estilo1"><strong>Saldo</strong></span></td>
			  <td width="44" align="center"> <span class="Estilo1"><strong>Observaciones</strong></span></td>
			  
			
			  
			
            </tr>
			<%
    //out.print(clave_antibiotico);
	while(rset__001.next()) 
                  {		
						clave= rset__001.getString("clave");
						date_jv=rset__001.getString("fecha");
						medico=rset__001.getString("medico");
						cedula=rset__001.getString("cedula");
						folio=rset__001.getString("folio");
						estatus=rset__001.getString("status");
						cantidad=rset__001.getString("cant_mov");
						saldo=rset__001.getString("cant_actual");
						
						
						// SE CONSULTA LA TABLA ANTIBIOTICOS PARA COMPARAR CON LA DE MODIFICACIONES
						rset__002=stmt__002.executeQuery("select clave,descrip,presnt,lab from antibioticos");
						while(rset__002.next()) 
                             {		
									clave_anti= rset__002.getString("clave");
									if (clave.equals(clave_anti)){
												if (estatus.equals("INCREMENTO CARGA INVENTARIO")){
													   %> 		
															<tr>
																<td><span class="style49"><%=date_jv%></span></span></td>
																<td><span class="style49">-</span></span></td>
																<td><span class="style49">-</span></span></td>
																<td><span class="style49">-</span></span></td>
																<td><span class="style49">-</span></span></td>
																<td><span class="style49"><%=folio%></span></span></td>
																<td><span class="style49"><%=clave%></span></span></td>
																<td><span class="style49"><%=cantidad%></span></span></td>
																<td><span class="style49">-</span></span></td>
																<td><span class="style49"><%=saldo%></span></span></td>
																<td><span class="style49">-</span></span></td>
															</tr>
															
													  
													  <%
													  }else{
															%> 		
															<tr>
																<td><span class="style49">-</span></span></td>
																<td><span class="style49"><%=date_jv%></span></span></td>
																<td><span class="style49"><%=medico%></span></span></td>
																<td><span class="style49"><%=cedula%></span></span></td>
																<td><span class="style49"><%=llamo_cat_jv%></span></span></td>
																<td><span class="style49"><%=folio%></span></span></td>
																<td><span class="style49"><%=clave%></span></span></td>
																<td><span class="style49">-</span></span></td>
																<td><span class="style49"><%=cantidad%></span></span></td>
																<td><span class="style49"><%=saldo%></span></span></td>
																<td><span class="style49">-</span></span></td>
															</tr>
															
													  
													  <%
													  
													  } 
									}
							 } 
				  }
 
			%>
			
				  

										<!--tr>
										  <td colspan="5">&nbsp;</td>	
										  <!--td height="24" colspan="5" align="center" class="style49">TOTAL RECETAS EMITIDAS= <%=folio_re2%></td>
										  <td colspan="4" class="style49" align="center">TOTAL PIEZAS DISPENSADAS= ---</td>
										  <td>&nbsp;</td><td>&nbsp;</td>
										  <td>&nbsp;</td><td>&nbsp;</td>
										  </tr-->
				  
           
            
            <%//}%>
           
			
            
            
            
            
            
          </table>
            </td>
       
      </tr>
    </table>
    </form>   
	  
	 
</table>
        </div></td>
        </tr>
    </table>    </td>
    <td width="4">&nbsp;</td>
        <td width="6" valign="top"><br />
	&nbsp;<br /></td>
	<td width="96">&nbsp;</td>
  </tr>
  <tr>
    <td width="4">&nbsp;</td>
    <td width="68">&nbsp;</td>
    <td width="27">&nbsp;</td>
    <td width="1036">&nbsp;</td>
    <td width="4">&nbsp;</td>
    <td width="6">&nbsp;</td>
	<td width="96">&nbsp;</td>
  </tr>
</table>
<%

    }
%>

<map name="Map2" id="Map2">
  <area shape="rect" coords="6,5,33,31" href="antibioticos_excel.jsp?clave=<%=date11_jv%>&f1=<%=date11_jv%>&f2=<%=date22_jv%>&boton=Show ALL&unidad=<%=llamo_cat_jv%>" />
</map>
</body>
</html>
