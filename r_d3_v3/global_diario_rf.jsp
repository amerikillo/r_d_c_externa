<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.text.*" import="java.lang.*" import="java.util.*" import= "javax.swing.*" import="java.io.*" import="java.text.DateFormat" 
import="java.text.ParseException" import="java.text.SimpleDateFormat" import="java.util.Calendar" import="java.util.Date" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<% Class.forName("org.gjt.mm.mysql.Driver");
NumberFormat nf1 = NumberFormat.getInstance(Locale.US);
DecimalFormat formateador = new DecimalFormat("###,###,###.##");

Connection conn10 = DriverManager.getConnection("jdbc:mysql://localhost/r_d_c_externa", "root", "eve9397");
Connection conn_05 = DriverManager.getConnection("jdbc:mysql://189.197.187.15/ventadiaria","root","Avxkc4");
        Statement stmt__001 = conn10.createStatement();
		Statement stmt_4 = conn10.createStatement();
		Statement stmt_001 = conn10.createStatement();
		Statement stmt05 = conn_05.createStatement();
		Statement stmt06 = conn10.createStatement();
		Statement stmt08 = conn10.createStatement();
		ResultSet rset__001 = null;
		ResultSet rset_7 = null;
		ResultSet rset_001=null;
		ResultSet rset_1=null;
		ResultSet rset05=null;
		ResultSet rset06=null;
		ResultSet rset08=null;
 
 

String llamo_cat_jv="",date1_jv="",date2_jv="",date11_jv="",date22_jv="",boton_jv="",tip_uni_jv="",date_jv="",sol="",sur="",sol_u="",sur_u="",org_jv="",dest="",precio="",present="",sur111="";
int sol1=0,sur1=0,sol11=0,sur11=0,present2=0,multi=0,total2=0,total3=0,resto=0,sur222=0,present22=0,resto_jv=0;
double present1=0.0,total=0.0,sur22=0.0;
int clave_unidad=0;
String descripcion="";
String presentacion="";
int clave_medicamento=0;
int cantidad=0;
	  try {
       		llamo_cat_jv=request.getParameter("unidad");   
			boton_jv=request.getParameter("boton");   
			date1_jv=request.getParameter("f1"); 
			date2_jv=request.getParameter("f2");
			date11_jv=request.getParameter("f1"); 
			date22_jv=request.getParameter("f2");
			org_jv=request.getParameter("org");	   
	  } catch (Exception e) { }
 

     

     int tam=0,tam2=0,x1=0;
	 int cont1=0;
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

					
		if(boton_jv.equals("Show ALL"))
	{
 rset__001=stmt__001.executeQuery("select clave_uni,clave,descrip,sum(cant_sol),sum(cant_sur),present from receta where unidad='"+llamo_cat_jv+"' and fecha_re='"+date1_jv+"'and partida='"+org_jv+"'  and tipo_receta='rf' group by clave order by (clave+0)");
 
	}

if (org_jv.equals("1"))
{
dest="SSD";
}else
{
dest="SORIANA";
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
 
%>


<html xmlns="http://www.w3.org/1999/xhtml">
<!-- DW6 -->
<head>
<script language="javascript" src="list02.js"></script>
<!-- Copyright 2005 Macromedia, Inc. All rights reserved. -->
<title>:: REPORTE CONCENTRADO::</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" href="mm_travel2.css" type="text/css" />
<script language="JavaScript" type="text/javascript">
//--------------- LOCALIZEABLE GLOBALS ---------------
var d=new Date();
var monthname=new Array("January","February","March","April","May","June","July","August","September","October","November","December");
//Ensure correct for language. English is "January 1, 2004"
var TODAY = monthname[d.getMonth()] + " " + d.getDate() + ", " + d.getFullYear();
//---------------   END LOCALIZEABLE   ---------------

//<script language="javascript" src="list02.js"></script>
<style type="text/css">

</style>
</head>
<body bgcolor="#ffffff" onload="fillCategory2()">
<p>
  <%
    
	 if (altaOK==0)
       { 
	  
      
%>
</p>
<table width="1048" border="0" align="center" cellpadding="2">
  <tr>
    <td width="104"><img src="logo_dgo.jpg" width="96" height="88" /></td>
    <td height="63" colspan="2" align="center" valign="bottom" nowrap="nowrap" bgcolor="#FFFFFF" id="logo"><div align="center">
      <span class="Estilo14">REPORTE DIARIO POR FARMACIA<br />
    DE LA UNIDAD: <%=llamo_cat_jv%><br />
    PERIODO: <%=date1_jv%><br /> CONSULTA EXTERNA</span><br />
    <br />
    </div></td>
    <td width="96"><img src="soriana.jpg" width="76" height="77" /></td>
  </tr>
  
</table>
<table width="20%" border="0" align="center" cellpadding="0" cellspacing="0">

  <tr>
    <td colspan="7" bgcolor="#003366"><img src="mm_spacer.gif" alt="" width="1" height="1" border="0" /></td>
  </tr>

  <tr bgcolor="#CCFF99">
  	<td height="25" colspan="7" bgcolor="#2CACAD" id="dateformat">&nbsp;&nbsp;<span class="style76">
  	  <script language="JavaScript" type="text/javascript">
      //document.write(TODAY);	</script>
      <a href="reportes_diario_rf.jsp" class="style76"><span class="Estilo1">Regresar a Men�</span></a></span>&nbsp;Exportar</span>&nbsp;<img src="icono_excel.gif" border="0" usemap="#Map2"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
 <tr>
    <td colspan="7" bgcolor="#003366"><img src="mm_spacer.gif" alt="" width="1" height="1" border="0" /></td>
  </tr>

 <tr>
    
    
    <td colspan="2" valign="top"><form action="global_diario_rf.jsp" method="post" name="form" onSubmit="javascript:return ValidateAbas(this)">
    <table width="434" border="0" align="center">
      <tr>
        <td width="418"><table width="1357" border="1">
            <tr>
              
              <td width="105"> <span class="Estilo13">Clave</span></td>
              <td width="698"> <div align="center"><span class="Estilo13">Descripci&oacute;n</span></div></td>
              
              
              <td width="66"><div align="center"><span class="Estilo13">UM </span></div></td>
              <td width="105"><div align="center"><span class="Estilo13">Total Piezas </span></div></td>
              <td width="112"><div align="center"><span class="Estilo13">Presentaci&oacute;n </span></div></td>
              <td width="89"><div align="center"><span class="Estilo13">Total Cajas </span></div></td>
              <td width="136"><div align="center"><span class="Estilo13">Piezas Pr&oacute;ximas a Cobrar</span></div></td>
            </tr>
			<%
			present="1";
    while(rset__001.next()) 
                  {		
				  clave= rset__001.getString("clave");
				  
				  rset_7=stmt_4.executeQuery("select cant from pasti_ampu where clave='"+clave+"' group by clave;");
					while(rset_7.next())
					{
					present=rset_7.getString("cant");
					present22=Integer.parseInt(present);
					
					}
					present1=Double.parseDouble(present);
					present2=Integer.parseInt(present);
					sur111=rset__001.getString("sum(cant_sur)");
					sur22=Double.parseDouble(sur111);
					sur222=Integer.parseInt(sur111);
					
					if(present2==0)
					{
					present="1";
					present2=1;
					}
					
					total3=sur222/present2;
					multi=total3*present2;
					resto=sur222-multi;
					
					total2+=total3;
					resto_jv+=resto;
											
					clave_unidad=rset__001.getInt("clave_uni");
	%>
            <tr>
              
              <td class="Estilo6"><%=rset__001.getString("clave")%>&nbsp;</td>
              <td class="Estilo6"><%=rset__001.getString("descrip")%>&nbsp;</td>
              
              
              <td align="center" class="Estilo9"><%=precio%><%=rset__001.getString("present")%></td>
              <td align="center" class="Estilo9"><%=rset__001.getString("sum(cant_sur)")%></td>
              <td align="center" class="Estilo9"><%=present%></td>
              <td align="center" class="Estilo9"><%=formateador.format(total3)%></td>
              <td align="center" class="Estilo9"><%=resto%></td>
            </tr>
			<%
			present="1";
			
			}
			rset_1=stmt__001.executeQuery("select sum(cant_sol),sum(cant_sur) from receta where unidad='"+llamo_cat_jv+"' and fecha_re='"+date1_jv+"' and partida='"+org_jv+"' and tipo_receta='rf'");
			while(rset_1.next()) 
                  {
				  sol=rset_1.getString("sum(cant_sol)");
				  sol1= Integer.parseInt(sol);
  				  sur=rset_1.getString("sum(cant_sur)");
				  sur1= Integer.parseInt(sur);
				  		
				  }
			%>
            <tr>
              <td>&nbsp;</td>
              <td></td>
              <td align="center" class="Estilo9">Total</td>
              <td align="center" class="Estilo9"><%=formateador.format(sur1)%></td>
              <td align="center" class="Estilo9">&nbsp;</td>
              <td align="center" class="Estilo9"><%=formateador.format(total2)%></td>
              <td align="center" class="Estilo9">&nbsp;</td>
            </tr>
            
            
            <%//}%>
			<%
			//**************conexion a servidor
			rset05= stmt05.executeQuery("select * from consolidado where clave_unidad='"+clave_unidad+"' and fecha='"+date1_jv+"' and tipo_receta='RF' group by clave_unidad,fecha");
					while(rset05.next())
						{
							    cont1++;
						}
						if(cont1>0)
							  {
									%>
									<script>
		
										alert("ESTA INFORMACION YA FUE ENVIADA...!!!");
									
									</script>
							  <%
								
							  } else{
							  
							    rset06=stmt06.executeQuery("select clave,descrip,sum(cant_sol),sum(cant_sur),present from receta where unidad='"+llamo_cat_jv+"' and fecha_re='"+date1_jv+"'and partida='"+org_jv+"'  and tipo_receta='rf' group by clave order by (clave+0)");
							    while (rset06.next()){
								clave= rset06.getString("clave");
								//*************CHECAR CLAVE EN PASTI AMPU PARA SABER SU PRESENTACION*******************
									rset08=stmt08.executeQuery("select cant from pasti_ampu where clave='"+clave+"' group by clave;");
									present="1";
									while(rset08.next())
											{
											present=rset08.getString("cant");
											present22=Integer.parseInt(present);
											
											}
											present1=Double.parseDouble(present);
											present2=Integer.parseInt(present);
											
											sur111=rset06.getString("sum(cant_sur)");
											sur22=Double.parseDouble(sur111);
											sur222=Integer.parseInt(sur111);
											
											if(present2==0)
											{
											present="1";
											present2=1;
											}
											
											total3=sur222/present2;
											multi=total3*present2;
											resto=sur222-multi;
											
											total2+=total3;
											resto_jv+=resto;
											
																			
								//*******************************SE INSERTA LA INFORMACION EN LA TABLA CONSOLIDADO DEL SERVER*******************************************************
									presentacion=rset06.getString("present");
									clave_medicamento=rset06.getInt("clave");
									descripcion=rset06.getString("descrip");
									cantidad=rset06.getInt("sum(cant_sur)");
							  
									stmt05.execute("insert into consolidado values ('"+clave_unidad+"','"+clave_medicamento+"','"+descripcion+"','"+presentacion+"','"+cantidad+"','"+present+"','"+total3+"','"+resto+"','"+date1_jv+"','RF')");	
								}
							   }
			
			
			
			
			
			%>
           
			
            
            
            
            
            
          </table>
            </td>
        
        
      </tr>
    </table>
    </form>   
	  
	  <div align="center"></div>
    </td>
    
  </tr>
 
</table>
<%

    }
%>
<map name="Map" id="Map">
<area shape="poly" coords="241,165" href="#" />
<area shape="poly" coords="230,40,231,88,270,43" href="#" />
</map>
<map name="Map2" id="Map2">
  <area shape="rect" coords="6,5,33,31" href="excel_rf.jsp?f1=<%=date11_jv%>&boton=Show ALL&unidad=<%=llamo_cat_jv%>&org=<%=org_jv%>" />
</map>
</body>
</html>
