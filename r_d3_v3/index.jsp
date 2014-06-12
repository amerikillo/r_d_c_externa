
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<% java.util.Calendar currDate = new java.util.GregorianCalendar();
   // add 1 to month because Calendar's months start at 0, not 1
   int month = currDate.get(currDate.MONTH)+1;
   int day = currDate.get(currDate.DAY_OF_MONTH);
   int year = currDate.get(currDate.YEAR);
	String date=""; 
   String res="",radio_pro=""; 
   int ban=0,cont2=0,cont3=0;
   int ban_ima=0;
   try { 
        ban_ima=Integer.parseInt(request.getParameter("ban"));
        //altaOK="no";
    }catch(Exception e){System.out.print("not");}
	
   String cve_uni_2=""; 	
   String cve_uni="";
    try { 
        //if(cve_uni!="")
           cve_uni=request.getParameter("cve");
		//else
		 //  cve_uni=request.getParameter("cve");
		   
        //altaOK="no";
    }catch(Exception e){System.out.print("not");}
	 

    
 if(month >=1 && month <= 9)  
 {
 res ="0"+month;
// month=Integer.parseInt(res);
   date=" "+day;
   date= date+"/"+res;
   date= date+"/"+year;  

 //out.print(""+res); 
 }
 else 
{
      date=" "+day;
      date= date+"/"+month;
      date= date+"/"+year;  
	  res+=month;
}
   
 
 
%>
<% Class.forName("org.gjt.mm.mysql.Driver");

Connection conn1 = DriverManager.getConnection("jdbc:mysql://localhost/r_d_c_externa", "root", "eve9397");
        Statement stmt1 = conn1.createStatement();
		//Statement stmt2 = conn1.createStatement();
		Statement stmt_01 = conn1.createStatement();
        ResultSet rset1= null;
		ResultSet rset2= null;
     int tam=0,tam2=0,x1=0;
     String cad1[]=new String[1000];  //array for show clients 
     String arr[]= new String[5000];     //array for the importadores
     String name="";
     String service_jv="";
     String mail[]=new String[10];
	 
	 String but="r";
	 String usu_jv="",juris_jv="",no_jv="",receta_jv="",encar_jv="",unidad2_jv="",clave_jv="",cv_dgo_jv="",cv_uni_jv="",cv_mpio_jv="",perfil="";
	 String pass_jv="";
	 int correct1=0,customerIds=0;
	 mail[0]="lasalle_tur@yahoo.com";
     String val="h";
	 String user="h";
     String hora_ini_jv="";
	 int cont=0;
	 try { 
        but=""+request.getParameter("Submit");
        //altaOK="no";
    }catch(Exception e){System.out.print("not");}
	 


     
%>
<%
if(but.equals("Receta"))
      {
	    out.print("hello");
      }

if(but.equals("Mostrar"))
      {
	 // out.print("siii");
	  cve_uni_2=request.getParameter("txtf_uni");
	  
	  rset1=stmt1.executeQuery("select * from juris where cve='"+cve_uni_2+"' group by usuario ");
          while (rset1.next()) 
                  {
			cad1[tam2]=rset1.getString("usuario");
			unidad2_jv=rset1.getString("nombre");
			//out.print(""+cad1[tam2]+unidad2_jv);
					tam2++;	   
					ban=1;
		cont2++;
		  		  }
		if(ban==1)
		    ban=4;
	    else				  
	        ban=3;
			if(cont2>0)
			{
		ban_ima=1;
		}
	  }


  	if(but.equals("Validar Usuario"))
      {
	    
unidad2_jv=request.getParameter("txtf_unidad");
receta_jv=request.getParameter("select_receta");
encar_jv=request.getParameter("select_encar");
pass_jv=request.getParameter("txtf_pass");

Connection conn = 
                DriverManager.getConnection("jdbc:mysql://localhost/r_d_c_externa", "root", "eve9397");
                  Statement stmt = conn.createStatement();
				  ResultSet rset = stmt.executeQuery("SELECT STR_TO_DATE('"+date+"', '%d/%m/%Y')"); 
                   while(rset.next())
                       date= rset.getString("STR_TO_DATE('"+date+"', '%d/%m/%Y')");


rset2=stmt1.executeQuery("select * from juris where nombre='"+unidad2_jv+"'and usuario='"+encar_jv+"' and contra='"+pass_jv+"' ");
          while (rset2.next()) 
                  {
				  //out.print(rset2.getString("perfil"));
				  perfil=rset2.getString("perfil");
				  cont3++; 
				  }
				  
//				  out.print(""+cont3);

if (cont3>0)
{
         rset1=stmt1.executeQuery("select * from uni_atn where uni='"+unidad2_jv+"' ");
          while (rset1.next()) 
                  { 
				  juris_jv=rset1.getString("juris");
				  no_jv=rset1.getString("name");
				  clave_jv=rset1.getString("clave");
				  cv_dgo_jv=rset1.getString("cv_dgo");
				  cv_uni_jv=rset1.getString("id_uni");
				  cv_mpio_jv=rset1.getString("cv_mpio");
				  
                    cont++;
                   
                   }
				  
		//out.print(""+juris_jv);
		if ((cont==1) && (receta_jv.equals("Receta por Surtir")))
		{
		%>
<script>
		alert("DATOS CORRECTOS"); 
		 self.location='receta_por_surtir.jsp?uni=<%=unidad2_jv%>&juris=<%=no_jv%>&encar=<%=encar_jv%>&juris1=<%=juris_jv%>&clave_uni=<%=clave_jv%>&nombre=&edad=&folio=&cause=&clave1=&descrip1=&present1=&indica1=&sol1=&sur1=&foliore=&nomed=&cedu=&cv_dgo=<%=cv_dgo_jv%>&cv_uni=<%=cv_uni_jv%>&cv_mpio=<%=cv_mpio_jv%>&part=&id_med=&day5=&carnet=&mes5=&aa5=';
		</script>
<%
		stmt1.execute("insert into pass_rd values (0,'"+pass_jv+"','"+unidad2_jv+"','"+juris_jv+"','"+date+"','CORRECTO')");
		}
		if ((cont==1) && (receta_jv.equals("Receta por Surtir Colectiva")))
		{
		%>
<script>
		alert("DATOS CORRECTOS")
		 self.location='receta_col_surtir.jsp?uni=<%=unidad2_jv%>&juris=<%=no_jv%>&encar=<%=encar_jv%>&juris1=<%=juris_jv%>&clave_uni=<%=clave_jv%>&nombre=&edad=&folio=&cause=&clave1=&descrip1=&present1=&indica1=&sol1=&sur1=&foliore=&nomed=&cedu=&cv_dgo=<%=cv_dgo_jv%>&cv_uni=<%=cv_uni_jv%>&cv_mpio=<%=cv_mpio_jv%>&part=&id_med=&day5=&carnet=&mes5=&aa5=&servicio=&encarser=';
		</script>
<%
		stmt1.execute("insert into pass_rd values (0,'"+pass_jv+"','"+unidad2_jv+"','"+juris_jv+"','"+date+"','CORRECTO')");
		}
		
		if ((cont==1) && (receta_jv.equals("Reporte Global por Fecha")))
		{
		%>
<script>
		alert("DATOS CORRECTOS")
		 self.location='reportes.jsp';
		</script>
<%
		stmt1.execute("insert into pass_rd values (0,'"+pass_jv+"','"+unidad2_jv+"','"+juris_jv+"','"+date+"','CORRECTO')");
		}
		if ((cont==1) && (receta_jv.equals("Receta por Farmacia")))
		{
		%>
<script>
		alert("DATOS CORRECTOS")
		 self.location='recedgo.jsp?radio_pro=<%=radio_pro%>&uni=<%=unidad2_jv%>&juris=<%=no_jv%>&encar=<%=encar_jv%>&juris1=<%=juris_jv%>&clave_uni=<%=clave_jv%>&nombre=&edad=0&folio=&cause=SC&clave1=&descrip1=&present1=&indica1=&sol1=&sur1=&foliore=&nomed=&cedu=&cv_dgo=<%=cv_dgo_jv%>&cv_uni=<%=cv_uni_jv%>&cv_mpio=<%=cv_mpio_jv%>&perfil=<%=perfil%>&part=&id_med=&day5=&carnet=-&mes5=&aa5=&programa';
		</script>
<%
		stmt1.execute("insert into pass_rd values (0,'"+pass_jv+"','"+unidad2_jv+"','"+juris_jv+"','"+date+"','CORRECTO')");
		}
		
		if ((cont==1) && (receta_jv.equals("Receta por Farmacia Fecha Automatica")))
		{
		%>
<script>
		alert("DATOS CORRECTOS")
		 self.location='recedgo_fecha.jsp?radio_pro=<%=radio_pro%>&uni=<%=unidad2_jv%>&juris=<%=no_jv%>&encar=<%=encar_jv%>&juris1=<%=juris_jv%>&clave_uni=<%=clave_jv%>&nombre=&edad=0&folio=&cause=SC&clave1=&descrip1=&present1=&indica1=&sol1=&sur1=&foliore=&nomed=&cedu=&cv_dgo=<%=cv_dgo_jv%>&cv_uni=<%=cv_uni_jv%>&cv_mpio=<%=cv_mpio_jv%>&perfil=<%=perfil%>&part=&id_med=&day5=&carnet=-&mes5=&aa5=&programa';
		</script>
<%
		stmt1.execute("insert into pass_rd values (0,'"+pass_jv+"','"+unidad2_jv+"','"+juris_jv+"','"+date+"','CORRECTO')");
		}
		
		if ((cont==1) && (receta_jv.equals("Receta Colectiva")))
		{
		
		stmt1.execute("insert into folio_rec values(null,'morelia')");
		ResultSet rset_01 = stmt_01.executeQuery("select no_rec from folio_rec");
                  while(rset_01.next())
				  {
                       customerIds = rset_01.getInt("no_rec");
                         }
		
		
		%>
<script>
		alert("DATOS CORRECTOS")
		 self.location='recedgo_col.jsp?uni=<%=unidad2_jv%>&juris=<%=no_jv%>&encar=<%=encar_jv%>&juris1=<%=juris_jv%>&clave_uni=<%=clave_jv%>&nombre=&edad=&folio=&cause=&clave1=&descrip1=&present1=&indica1=&sol1=&sur1=&foliore=<%=customerIds%>&cv_dgo=<%=cv_dgo_jv%>&cv_uni=<%=cv_uni_jv%>&cv_mpio=<%=cv_mpio_jv%>&part=&id_med=&day5=&carnet=-&mes5=&aa5=&servicio=&encarser=';
		</script>
<%
		stmt1.execute("insert into pass_rd values (0,'"+pass_jv+"','"+unidad2_jv+"','"+juris_jv+"','"+date+"','CORRECTO')");
		}
		
		
		if ((cont==1) && (receta_jv.equals("Receta Colectiva Fecha Automatica")))
		{
		
		stmt1.execute("insert into folio_rec values(null,'morelia')");
		ResultSet rset_01 = stmt_01.executeQuery("select no_rec from folio_rec");
                  while(rset_01.next())
				  {
                       customerIds = rset_01.getInt("no_rec");
                         }
						 //out.print(customerIds);
		%>
<script>
		alert("DATOS CORRECTOS")
		 self.location='recedgo_col_fecha.jsp?uni=<%=unidad2_jv%>&juris=<%=no_jv%>&encar=<%=encar_jv%>&juris1=<%=juris_jv%>&clave_uni=<%=clave_jv%>&nombre=&edad=&folio=&cause=&clave1=&descrip1=&present1=&indica1=&sol1=&sur1=&foliore=<%=customerIds%>&cv_dgo=<%=cv_dgo_jv%>&cv_uni=<%=cv_uni_jv%>&cv_mpio=<%=cv_mpio_jv%>&part=&id_med=&day5=&carnet=-&mes5=&aa5=&servicio=&encarser=';
		</script>
<%
		stmt1.execute("insert into pass_rd values (0,'"+pass_jv+"','"+unidad2_jv+"','"+juris_jv+"','"+date+"','CORRECTO')");
		}
		

		if(cont==0){
		%>
<script>
		alert("DATOS INCORRECTOS")
		</script>
<%
		//out.print(""+juris_jv);
		stmt1.execute("insert into pass_rd values (0,'"+pass_jv+"','"+unidad2_jv+"','"+juris_jv+"','"+date+"','INCORRECTO')");
		unidad2_jv="";
		cve_uni="";
		}
       }else{
	   %>
<script>
	   alert("DATOS INCORRECTOS")
	   </script>
<%
	   stmt1.execute("insert into pass_rd values (0,'"+pass_jv+"','"+unidad2_jv+"','"+juris_jv+"','"+date+"','INCORRECTO')");
		unidad2_jv="";
		cve_uni="";
	 }
	   
	   ban_ima=0;
	   }
	   


%>
<html lang="en">
<!-- DW6 -->
<head>

<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="list02.js"></script>
<!-- Copyright 2005 Macromedia, Inc. All rights reserved. -->
<title>:: RECETA ELECTR&Oacute;NICA WEB ::</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
<script language="JavaScript" type="text/javascript">
//--------------- LOCALIZEABLE GLOBALS ---------------
var d=new Date();
var monthname=new Array("Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre");
//Ensure correct for language. English is "January 1, 2004"
var TODAY = monthname[d.getMonth()] + " " + d.getDate() + ", " + d.getFullYear();
//---------------   END LOCALIZEABLE   ---------------
</script>
</head>
<body onLoad="hora_Inv()">
<div class="container">
	<div class="row">
		<div class="col-lg-2">
			<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="134" height="118">
		  <param name="movie" value="anima2.swf" />
		  <param name="quality" value="high" />
		  <embed src="anima2.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="134" height="118"></embed>
		</object>
		</div>
		<div class="col-lg-8">
			<h1 class="text-center text-success">SISTEMA DE RECETA ELECTR&Oacute;NICA</h1>
			<h3 class="text-center text-success">M&Oacute;DULO CONSULTA EXTERNA</h3>
		</div>
		<div class="col-lg-2">
			<img src="logo_soriana2.jpg" width="191" height="105" />
		</div>
	</div>
	<div class="row">
	
		<div class="col-lg-3">
			<div class="btn-group-vertical">
					<a href="carga_inven_clave.jsp" class="btn btn-default">CARGA INVENTARIO</a>
					<a href="index_reporte.jsp" class="btn btn-default">REPORTE VALIDACION</a>
					<a href="inventarios.jsp" class="btn btn-default">VER EXISTENCIAS</a>
					<a href="index_reporte_consumo.jsp" class="btn btn-default">CONSUMO SEMANAL </a>
					<a href="index_movi.jsp" class="btn btn-default">MOVIMIENTO AL INVENTARIO </a>
					<a href="kardex.jsp" class="btn btn-default">KARDEX </a>
					<a href="pass_compras.jsp" class="btn btn-default">REPORTE SOLICITADO/SURTIDO</a>
					<a href="tipo_pendiente.jsp" class="btn btn-default">PENDIENTES POR COBRAR</a>
					<a href="antibioticos_farmacia.jsp" class="btn btn-default">REPORTE DE ANTIBIOTICOS</a>
					<a href="index_diario.jsp" class="btn btn-default">REPORTE DIARIO</a>
			</div>
		</div>
		
		<div class="col-lg-9">
			<div class="panel panel-success">
				<div class="panel-heading">
					Formulario de Inicio 
					<div class="text-right"><script language="JavaScript" type="text/javascript">document.write(TODAY);</script></div>
				</div>
				<div class="panel-body">
					<form action="index.jsp?cve=<%=cve_uni%>&ban=<%=ban_ima%>" method="post" name="form" class="form-horizontal" >					  
					  <h5>Ingrese el N&uacute;mero de la Unidad:</h5>
					  <div class="row">
						<input type="text" name="txtf_hf" id="txtf_hf" readonly="true" class="hidden" />
						<label for="txtf_uni" class="col-sm-2 control-label">No. de Unidad</label>
						<div class="col-md-2">
						<input type="text" name="txtf_uni" value="<%=cve_uni_2!=""?cve_uni_2:(cve_uni!=null?cve_uni:"")%>" class="form-control" />
						</div>
						<div class="col-lg-2">
						<input type="submit" name="Submit" value="Mostrar" class="btn btn-success"/>
						</div>
						<div class="col-lg-2">
						<a href="tab.jsp" accesskey="n" target="_self" class="btn btn-default">Ver Unidad</a>
						</div>
						<%
						if(ban_ima==0)
						{
						%>
						<img src="paso1.jpg"  />
						<%
						}
						if(ban==3)
						{
						cve_uni="-";
						//out.print("cve_uni"+cve_uni);
						%>
					  </div>
					  <br />
					<div class="row">
					Unidad inexistente CHECAR UNIDADES
					<script>
					document.form.txtf_uni.focus();
					</script>
					<%
					}
					%>
					<script>
					document.form.select_encar.focus();
					</script>
					</div>
					<br />
					<div class="row">
					  <label for="txtf_unidad" class="col-sm-3 control-label">Nombre de la Unidad:</label>
					  <div class="col-lg-6">
					  	<input name="txtf_unidad" id="txtf_unidad" type="text" value="<%=unidad2_jv%>" class="form-control"/>
					  </div>
					</div>
					<br />
					<div class="row">
					  <label for="select_encar" class="col-sm-3 control-label">Encargado:</label>
					  <div class="col-lg-6">
						<select name="select_encar" class="form-control" onChange="cerrar()" >
							<option selected="selected">--Escoja Encargado--</option>
							<%
							for(x1=0;x1<tam2;x1++)
							{
								%>
								<option value="<%=cad1[x1]%>"><%=cad1[x1]%></option>
								<%
							}
							%>
						</select>
					  </div>
					  <%
						if(ban_ima==1)
						{
							%>
							<div id="flotante" style="display:block;"> <img src="emp.jpg" /> </div>
							<%
						}
						%>
					</div>
					<br />
					<div class="row">
					  <label for="select_receta" class="col-sm-3 control-label">Tipo de Receta:</label>
					  <div class="col-lg-6">
						<select name="select_receta" class="form-control" onChange="cerrar2()">
						<option selected="selected">--Escoja Receta--</option>
						<option value="Receta por Farmacia">Receta por Farmacia Fecha Manual</option>
						<option value="Receta por Farmacia Fecha Automatica">Receta por Farmacia Fecha Automatica</option>
						<option value="Receta Colectiva">Receta Colectiva Fecha Manual</option>
						<option value="Receta Colectiva Fecha Automatica">Receta Colectiva Fecha Automatica</option>
						<option value="Receta por Surtir">Pendiente por Surtir/Checar Datos</option>
						<option value="Receta por Surtir Colectiva">Pendiente por Surtir Colectiva/Checar Datos</option>
						<!--option value="Reporte Global por Fecha">Reporte Global por Fecha</option-->
					  </select>
					  </div>
						<div id="recetas" style="display:none;">
						<img src="rece.jpg" width="160" height="39" />							
						</div>
					</div>
					<br />
					<div class="row">
					  <label for="select_receta" class="col-sm-3 control-label">Contrase&ntilde;a:</label>
					  <div class="col-lg-6">
						<input type="password" name="txtf_pass" id="txtf_pass" value="" class="form-control" onKeyPress="return handleEnter(this, event)" />
					  </div>
					  <div id="contra" style="display:none;">
					  <img src="contr.jpg" width="154" height="39" />							
					  </div>
					</div>
					<br />
					<div class="row">
					  <label for="select_receta" class="col-sm-3 control-label"></label>
					  <div class="col-lg-6">
						<input type="submit" name="Submit" value="Validar Usuario" class="btn btn-success btn-block" />
					  </div>
					</div>
					  <input type="hidden" value="1" name="altaOK" />
					  <input type="hidden" name="cmd" value="1" />
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
