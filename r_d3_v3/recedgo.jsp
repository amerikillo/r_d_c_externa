<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.text.*" import="java.lang.*" import="java.util.*" import= "javax.swing.*" import="java.io.*" import="java.text.DateFormat" 
import="java.text.ParseException" import="java.text.SimpleDateFormat" import="java.util.Calendar" import="java.util.Date" errorPage="" %>

<% java.util.Calendar currDate = new java.util.GregorianCalendar();
   // add 1 to month because Calendar's months start at 0, not 1
   int month = currDate.get(currDate.MONTH)+1;
   int day = currDate.get(currDate.DAY_OF_MONTH);
   int year = currDate.get(currDate.YEAR);
	String date="";
	String date2=""; 
   String res=""; 
   String day1="";
   String partida_med="";
   String clave_med1="";
   //String valorradio="";
   double precio_tot=0.0;
   double precio_clave=0.0;
   int cant_sur=0;
   String cause_des="";
   String mpio_uni="";
   String dia="";
   String dia2="";
   String folio_sp="";
   
   DecimalFormat formateador = new DecimalFormat("######,###.00");
   //valorradio= getRadioButtonSelectedValue(document.form.radio_pro); 
 if(month >=1 && month <= 9)  
 {
 res ="0"+month;
   date=" "+day;
   date= date+"/"+res;
   date= date+"/"+year;  
 }
 else 
{
      date=" "+day;
      date= date+"/"+month;
      date= date+"/"+year;  
	  res+=month;
}
 
 
 if(day >=1 && day <= 9)  
 {
 day1 ="0"+day;
// month=Integer.parseInt(res);
   date2=" "+day;
   date2= date2+"/"+day1;
   date2= date2+"/"+year;  
 //out.print(""+res); 
 }
 else 
{
      date2=" "+day;
      date2= date2+"/"+month;
      date2= date2+"/"+year;  
	  day1+=day;
}

%>

<%
   Date dNow = new Date();
   SimpleDateFormat ft = 
   new SimpleDateFormat ("dd/MM/yyyy");
   String currentDate = ft.format(dNow);
%>
<%
Class.forName("org.gjt.mm.mysql.Driver");
 
			      Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/r_d_c_externa", "root", "eve9397");
                  Statement stmt = conn.createStatement();
				  Statement stmtv = conn.createStatement();
				  Statement stmt_total = conn.createStatement();
				  Statement stmt2 = conn.createStatement();
				  Statement stmt1 = conn.createStatement();
				  Statement stmt1m = conn.createStatement();
				  Statement stmt_001 = conn.createStatement();
				   Statement stmt1og1 = conn.createStatement();
				  Statement stmt1og2 = conn.createStatement();
				   Statement stmt_og22 = conn.createStatement();
				  Statement stmt_o1 = conn.createStatement();
				  Statement stmt_o2 = conn.createStatement();
							   	  Statement stmt_precio = conn.createStatement();
                                  Statement stmt_cause = conn.createStatement();
                                  Statement stmt_mpio = conn.createStatement();	
				  ResultSet rset = null;
				  ResultSet rset_total = null;
				  ResultSet rset_001 = null;
				  ResultSet rset1 = null;
				   ResultSet rsetp = null;
				    ResultSet rsetp2 = null;
				  ResultSet rset2 = null;
				  ResultSet rset3 = null; 
				  ResultSet rset_org = null;
				  ResultSet rset_org_o1 = null;
				  ResultSet rset_org_o2 = null;
								  ResultSet rset_precio = null;
                                  ResultSet rset_cause = null;
                                  ResultSet rset_mpio = null;

							  
String t1a_jv="",t2a_jv="",t3a_jv="",t1b_jv="",t2b_jv="",t3b_jv="",t1c_jv="",t2c_jv="",t3c_jv="",noaf_jv="",nom_jv="",ap_jv="",am_jv="",fechana="",fechaini="",fechafin="",nombre1_jv="";
String hora_ini_jv="";
String lugar_jv="";
String cb_jv="",nombre_jv="",edad_jv="",folio_jv="",cause_jv="",foliore_jv="",foliore2_jv="",foliore3_jv="",radiopro_jv="",radiosur_jv="",date_jv="",reloj_jv="",encar_jv="",juris_jv="",clave_jv="",eliminar_jv="",usu_jv="",equipo_jv="",integrantes_jv="",recibe_id_jv="",cv_dgo_jv="",cv_uni_jv="",cv_mpio_jv="",id_med_jv="",part_jv="",layout="",cv_finan_jv="",financiamiento1="",precio_jv="",monto_jv="",exi_jv="",lote2_jv="",cant_jv="",date2_jv="",precio="",carnet_jv="-",programa_jv="",fechanew="",partida_o1_jv="",partida_o2_jv="",cant_o1_jv="",cant_o2_jv="",sumatotal="";
String but="r";
String but2="r"; 
String nom_unidad="",no_jur="",var_radio1="",var_radio2="";
int cont1=0,cont2=0,cont3=0,cv_med2=0,cv_med3=0,pos=0,posf=0,x1=0,sur2=0,sol2=0,cant2_jv=0,resto_jv=0,cant2_o1_jv=0,cant2_o2_jv=0,mtotalot=0,mtotalotsur=0,mtotalotsur2=0,resto22_jv=0;
double monto2=0.0,precio2=0.0,ptotal=0.0,mtotal=0.0,ptotal2=0.0;
double precio_t=0;
String cant_disp="";
//variables medicamento 1
String med1_jv="",descrip1_jv="",indica1_jv="",sol1_jv="",sur1_jv="",present1_jv="",clave1_jv="";

//variables medicamento 1
String med2_jv="",descrip2_jv="",indica2_jv="",sol2_jv="",sur2_jv="",present2_jv="",clave2_jv="";

//variables medicamento 1
String med3_jv="",descrip3_jv="",indica3_jv="",sol3_jv="",sur3_jv="",present3_jv="",clave3_jv="",t1_jv="",t2_jv="",t3_jv="",tfecha_jv="";
//varibles medico
String medico_jv="",uni_jv="",cedu_jv="",nomed_jv="",status="";

String financiamiento[]= new String[5000];
String afiliado[]= new String[5000];
String afiliadoEdad[]= new String[5000];
String origen[]= new String[5000];
String lotes[]= new String[5000];
String exis[]= new String[5000];
String org[]= {"1","3","2"};
//array para fuentes
String finan[] = {"SEGURO POPULAR","OPORTUNIDADES","FASSA","ASE","SMNG","Gasto Catastróficos"};
String encontrado="",oring="";
int ban=0,ban2=0,afi=0;

financiamiento[0]="";
afiliado[0]="";
origen[0]="";
int cont=0,cont5=0;
 String perfil="";
  String turno="";
  String vigencia = "";
try{
		perfil=request.getParameter("perfil");
        nombre_jv=request.getParameter("nombre");
		edad_jv=request.getParameter("edad");      
		folio_jv=request.getParameter("folio");
		descrip1_jv=request.getParameter("descrip1");
		indica1_jv=request.getParameter("indica1");   
		present1_jv=request.getParameter("present1");   
		sol1_jv=request.getParameter("sol1");   
		sur1_jv=request.getParameter("sur1");   
		clave1_jv=request.getParameter("clave1");
		descrip2_jv=request.getParameter("descrip2");
		indica2_jv=request.getParameter("indica2");   
		present2_jv=request.getParameter("present2");   
		sol2_jv=request.getParameter("sol2");   
		sur2_jv=request.getParameter("sur2");   
		clave2_jv=request.getParameter("clave2"); 
		descrip3_jv=request.getParameter("descrip3");
		indica3_jv=request.getParameter("indica3");   
		present3_jv=request.getParameter("present3");   
		sol3_jv=request.getParameter("sol3");   
		sur3_jv=request.getParameter("sur3");   
		clave3_jv=request.getParameter("clave3");
		cause_jv=request.getParameter("cause");
		foliore_jv=request.getParameter("foliore");
		//foliore3_jv=request.getParameter("foliore2");
		encar_jv=request.getParameter("encar");		   
		juris_jv=request.getParameter("juris1");
		clave_jv=request.getParameter("clave_uni");		   
  uni_jv=request.getParameter("univer");
		cedu_jv=request.getParameter("cedu");
		nomed_jv=request.getParameter("nomed");
	
		cv_dgo_jv=request.getParameter("cv_dgo");
		cv_uni_jv=request.getParameter("cv_uni");
		cv_mpio_jv=request.getParameter("cv_mpio");
		
		part_jv=request.getParameter("part");
		id_med_jv=request.getParameter("id_med");
		t1_jv=request.getParameter("day5");
		t2_jv=request.getParameter("mes5");
		t3_jv=request.getParameter("aa5");
		carnet_jv=request.getParameter("carnet");
		programa_jv=request.getParameter("programa");   
		reloj_jv=request.getParameter("reloj");
		 }catch(Exception e){ System.out.print("Doesn't make the altaOK"); }

//out.print(""+foliore3_jv);
try{
        nom_unidad=request.getParameter("uni");
		var_radio2=request.getParameter("var_radio1");		
		
		 }catch(Exception e){ System.out.print("Doesn't make the altaOK"); }
try{
        no_jur=request.getParameter("juris");   
		
		 }catch(Exception e){ System.out.print("Doesn't make the altaOK"); }
try { 


        but=""+request.getParameter("Submit");
		//but2=""+request.getParameter("Submit2");
		//out.print("but ="+but);
        
    }catch(Exception e){System.out.print("not");} 

foliore3_jv=request.getParameter("txtf_foliore");





if(but.equals("Mostrar"))
     {
	  //out.print("hi");
	  cb_jv=request.getParameter("txtf_cb");
	  foliore_jv=request.getParameter("txtf_foliore");
	  carnet_jv=request.getParameter("txtf_carnet");
	  t1_jv=request.getParameter("txtf_t1");
	  t2_jv=request.getParameter("txtf_t2");
	  t3_jv=request.getParameter("txtf_t3");
	  edad_jv=request.getParameter("txtf_edad");
	  folio_jv=request.getParameter("txtf_foliosp");
	  tfecha_jv=t1_jv+t2_jv+t3_jv;
	  folio_sp = request.getParameter("txtf_cb");
	  //out.print(""+tfecha_jv);
	  
	 rset3= stmt.executeQuery("select * from receta where folio_re='"+foliore_jv+"' ");
	 while(rset3.next())
	 {
	 cont5++;
	 }
	 if (cont5>0)
	 {
	 %>
	 <script>
	 alert("RECETA EXISTENTE")
	 </script>
	 <%
	 foliore_jv="";
	 edad_jv="0";
	 } else
	 { 
	 rsetp= stmt.executeQuery("select * from seguro_p2 where folio='"+cb_jv+"'    ");
	 
	 rsetp2= stmtv.executeQuery("select * from seguro_p2 where folio='"+cb_jv+"'  and f_fin >= sysdate() ");

	 if(!rsetp2.next())
	{
			vigencia = "false";		 
	}
	 String strFecha = "";
	 Date fechaActual = new Date();
	 SimpleDateFormat formatoDeFecha = new SimpleDateFormat("dd/MM/yyyy");
     strFecha = formatoDeFecha.format(fechaActual);
	 
 	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");  
 	Date fecha1 = sdf.parse(strFecha , new ParsePosition(0));
	 
	while(rsetp.next())
				 {
					
				  String fechaLocal =formatoDeFecha.format(rsetp.getDate("f_fin"));
					 
				  Date fecha2 = sdf.parse(fechaLocal , new ParsePosition(0));
					
				
				if (fecha1.before(fecha2)){
					vigencia = "false";
							
				}else{
					vigencia = "true";		
				}	
				
				if ( strFecha.equals(fechaLocal) ){
					vigencia = "false";
				}
					
					 afiliado[afi]=rsetp.getString("nombre1");    
					  afiliadoEdad[afi]=rsetp.getString("nombre1")+","+rsetp.getString("edad") +","+ vigencia +","+ rsetp.getString("folio") +","+ rsetp.getString("f_fin");    
                     afi++;
					 //edad_jv=rsetp.getString("edad");
					 folio_jv=rsetp.getString("folio");
					 programa_jv=rsetp.getString("programa");
			
	 }
	  
	  
	  
	  
	  }
					
	cb_jv="";
	clave1_jv="";
	descrip1_jv="";
	part_jv="";
	edad_jv="";
 
}


if(but.equals("Clave"))
     {
	  radiopro_jv=request.getParameter("radio_pro");
	  med1_jv=request.getParameter("txtf_med1");
	  //cause_jv=request.getParameter("txtf_cause");
	  //uni_jv=request.getParameter("txtf_uni");	
	  cedu_jv=request.getParameter("txtf_cedu");	
	  nomed_jv=request.getParameter("txtf_nomed");
	  foliore_jv=request.getParameter("txtf_foliore");
		 t1_jv=request.getParameter("txtf_t1");
	  t2_jv=request.getParameter("txtf_t2");
	  t3_jv=request.getParameter("txtf_t3");
	  nombre_jv=request.getParameter("txtf_paciente");	
	  carnet_jv=request.getParameter("txtf_carnet");	
	  edad_jv=request.getParameter("txtf_edad");
	  folio_jv=request.getParameter("txtf_foliosp");
	  	  
		  if(med1_jv.equals(""))
		  {
		  %>
		  <script>
		  alert('CAMPO VACÍO, Ingrese una CLAVE');
		  </script>
		  <%
		  }
		  else{
		  rset1= stmt.executeQuery("select clave from pasti_ampu where clave='"+med1_jv+"' and cant>'1' ");
		  
		  
		       if(rset1.next()){
		 %>	  
			    <script>
					
		 			 alert('Clave por ampuleo el medicamento sera dispensado por pieza' );
					 document.form.getElementById('ampuID').style.visibility="visible";
		  		</script>
		 <%	  
			  }
		%>	
		
		  		
		  
		  
		  <%
		  rset1= null;
	     rset1= stmt.executeQuery("select * from clave_med where codigo='"+med1_jv+"' ");
	  
	  while(rset1.next())
				     {
					/* precio=rset1.getString("precio"); 
					 precio2= Double.parseDouble(precio);*/
					 cont2++;
					 clave2_jv=rset1.getString("clave");
					 cant_disp=rset1.getString("cant_disp");
					 }
					 
	  	  if (cont2>0)
					 {
					 
		rset3= stmt1.executeQuery("select * from h_"+clave_jv+" where clave='"+clave2_jv+"'");
		while(rset3.next())
	  {
	  //cv_finan_jv=rset3.getString("cv_finan");
	  financiamiento[pos]=rset3.getString("descrip_finan");     
                     pos++;
	  cont3++;
	 
	  }
	  //Rutina para obtener la fuente de financiamento
	  for(int k=0;k<6;k++)
	      {
		     for(int z=0;z<pos;z++)
			   {
			     if(financiamiento[z].equals(finan[k]))
				   {
				     encontrado=financiamiento[z];
					 ban=1;
					 break;
				   }
				   if(ban==1)
				      break;
			   }
			   if(ban==1)
			      break;
		  }
	  //
	  
	  
	  
	  // out.print(""+financiamiento[x1]);
	   if (cont3>0)
					 {				 	
		    rset_total= stmt_total.executeQuery("select clave,sum(cant),origen from inventario where clave='"+clave2_jv+"' group by clave");
	  
	  while(rset_total.next())
	  {
	  sumatotal=rset_total.getString("sum(cant)");     
	  }
					 
		rset= stmt.executeQuery("select * from inventario where clave='"+clave2_jv+"' ");
	  
	   while(rset.next())
	  {
     
	   origen[posf]=rset.getString("origen");     
                     posf++;
	  }  
				  //Rutina para obtener la fuente de origen
	  for(int l=0;l<3;l++)
	      {
		     for(int m=0;m<posf;m++)
			   {
			     if(origen[m].equals(org[l]))
				   {
				     part_jv=origen[m];
					 ban2=1;
					 break;
				   }
				   if(ban2==1)
				      break;
			   }
			   if(ban2==1)
			      break;
		  }
		  if (part_jv==null||part_jv.equals("null")){
		  part_jv="2";
		  }

	  rset_org= stmt.executeQuery("select * from inventario where clave='"+clave2_jv+"' and origen='"+part_jv+"' ");
	  
	  while(rset_org.next())
	  {
	   cant_jv=rset_org.getString("cant");
	   cant2_jv=Integer.parseInt(cant_jv);
	   /*part_jv=rset.getString("origen");
	   origen[posf]=rset.getString("origen");     
                     posf++;*/
	  }  
				  
				  
				  
		if(cant2_jv>0)
		{		 
	
	   rset2= stmt.executeQuery("select * from clave_med where codigo='"+med1_jv+"' ");
	  
	  while(rset2.next())
	  {
	                 clave1_jv=rset2.getString("clave");
					 cant_disp=rset2.getString("cant_disp");
 					 descrip1_jv=rset2.getString("descrip");
					 present1_jv=rset2.getString("present");
					 id_med_jv=rset2.getString("id_med");
					// part_jv=rset2.getString("part");
					 }
					 }else{
					 rset2= stmt.executeQuery("select * from clave_med where codigo='"+med1_jv+"' ");
	  
					  while(rset2.next())
					  {
					  %>
					 <script>
					 alert("Clave Sin Existencia, quedará como pendiente por surtir")
					 </script>
					 <%
	                 clave1_jv=rset2.getString("clave");
					 cant_disp=rset2.getString("cant_disp");
 					 descrip1_jv=rset2.getString("descrip");
					 present1_jv=rset2.getString("present");
					 id_med_jv=rset2.getString("id_med");
					 cant_jv="0";
					 part_jv="2";
					// part_jv=rset2.getString("part");
					 }
					 /*
					 %>
					 <script>
					 alert("Clave Sin Existencia")
					 </script>
					 <%
 					 med1_jv="";
					 clave1_jv="";
					 descrip1_jv="";
					 cant_jv="";
					 part_jv="";
					 //financiamiento=pos[];*/
					 }
					 }else{
					 
					 %>
					 <script>
					 alert("Clave No Distribuir")
					 </script>
					 <%
					 med1_jv="";
					 clave1_jv="";
					 descrip1_jv="";
					 part_jv="";
					 }
					 
					 }else
					 {
					 %>
					 <script>
					 alert("Clave Fuera de Catálogo")
					 </script>
					 <%
					 med1_jv="";
					 clave1_jv="";
					 descrip1_jv="";
					 part_jv="";
					 }
					 }
}	

if(but.equals("Médico"))
     {
	 	//out.print("hi");
		radiopro_jv=request.getParameter("radio_pro");
	  medico_jv=request.getParameter("txtf_medico");
	foliore_jv=request.getParameter("txtf_foliore");
	nombre_jv=request.getParameter("txtf_paciente");
	 t1_jv=request.getParameter("txtf_t1");
	  t2_jv=request.getParameter("txtf_t2");
	  t3_jv=request.getParameter("txtf_t3");
	  carnet_jv=request.getParameter("txtf_carnet");
	  edad_jv=request.getParameter("txtf_edad");
	  folio_jv=request.getParameter("txtf_foliosp");
	  	  
	 rset1= stmt.executeQuery("select * from medico where cedula='"+medico_jv+"'");
	  
	  while(rset1.next())
				     {
					 //uni_jv=rset1.getString("num");
 					 cedu_jv=rset1.getString("cedula");
					 nomed_jv=rset1.getString("nombre");
	  
	                 }
	clave1_jv="";
	descrip1_jv="";
	part_jv="";
	
	%>
	<script>
	// alert("hi");
	// document.form.a.focus();
	</script>
	
	<%
 
}	
if(but.equals("Borrar Datos"))
     {
t1_jv="";
t2_jv="";
t3_jv="";
foliore_jv="";
nombre_jv="";
folio_jv="";
nomed_jv="";
cedu_jv="";
clave1_jv="";
descrip1_jv="";
sol1_jv="";
sur1_jv="";
carnet_jv="-";
}



//if(but.equals("Corte"))
//{
	

//	clave_jv=request.getParameter("clave_uni");		   
//	encar_jv=request.getParameter("encar");

//	  stmt.execute("insert into historial_corte_receta (encargado,fecha_corte,unidad) values ('"+encar_jv+"','"+ new java.util.Date().getTime()+"','"+clave_jv+"')");
	  
//	   stmt.execute("update receta_valores_default set valor = 0 where parametro='CORTE_UNIDAD_"+clave_jv+"'");



//}
if(but.equals("Capturar"))
     {
	 
	  String  ampuleo= "-" ;
	  int     corte  = 0;
	  programa_jv=request.getParameter("prog");
	  foliore_jv=request.getParameter("txtf_foliore");
	  no_jur=request.getParameter("txtf_njuris");
	  nom_unidad=request.getParameter("txtf_unidadmed");
	  nombre_jv=request.getParameter("txtf_paciente");
	  edad_jv=request.getParameter("txtf_edad");
	  folio_jv=request.getParameter("txtf_foliosp");
	  cedu_jv=request.getParameter("txtf_cedu");	
	  nomed_jv=request.getParameter("txtf_nomed");
	  clave1_jv=request.getParameter("txtf_clave1");
	  descrip1_jv=request.getParameter("txtf_descrip1");
	  sol1_jv=request.getParameter("txtf_sol1");
	  sur1_jv=request.getParameter("txtf_sol1");
	  radiopro_jv=request.getParameter("radio_pro");
	  radiosur_jv=request.getParameter("radiosur");
	  cause_jv=request.getParameter("txtf_cause");	  
	  present1_jv=request.getParameter("txtf_present");
	  id_med_jv=request.getParameter("txtf_idmed");
	  part_jv=request.getParameter("txtf_part");
	  reloj_jv=request.getParameter("reloj");
	  date_jv=request.getParameter("txtf_date");
	  cant_jv=request.getParameter("txtf_exist");	  
	  financiamiento1=request.getParameter("txtf_ff");	  
	  t1_jv=request.getParameter("txtf_t1");
	  t2_jv=request.getParameter("txtf_t2");
	  t3_jv=request.getParameter("txtf_t3");
	  tfecha_jv=t1_jv+"/"+t2_jv+"/"+t3_jv;
	  carnet_jv=request.getParameter("txtf_carnet");
	  fechanew=request.getParameter("txtf_date1");
	  
	  //out.print(radiopro_jv);
	  //out.print(var_radio2);
	  
	  rset2= stmt2.executeQuery("select con_folio from receta_corte where folio='"+foliore_jv+"'");
	  
	    if (rset2.next()){
	  
	  		corte = rset2.getInt("con_folio");
			rset2 = null;

	    }else{
			
			rset2 = null;
			rset2= stmt2.executeQuery("select valor from receta_valores_default where parametro='CORTE_UNIDAD_"+clave_jv+"'");
	 
	         if (rset2.next()){
	  		
	  			corte =rset2.getInt("valor") + 1  ;
	    	}

			
		
	 		  stmt.execute("insert into receta_corte (folio,con_folio,usuario) values ('"+foliore_jv+"','"+corte+"','"+encar_jv+"')");
		
			stmt2.execute("update receta_valores_default set valor='"+corte+"' where parametro='CORTE_UNIDAD_"+clave_jv+"'");
			rset2 = null;
		
		}
	  
	   rset2= stmt2.executeQuery("select clave from pasti_ampu where clave='"+clave1_jv+"' ");
	  

	  if (rset2.next()){
	  
	  	ampuleo = "1" ;
	  }
	  rset2 = null;  
	  rset2= stmt2.executeQuery("select * from clave_med where clave='"+clave1_jv+"'");
	  
	 while(rset2.next())
	  {
	  precio_jv=rset2.getString("precio");
	  precio2= Double.parseDouble(precio_jv);
	  
	  sur2 = Integer.parseInt(sur1_jv);
	  
	  rset3= stmt1.executeQuery("select * from h_"+clave_jv+" where descrip_finan='"+financiamiento1+"'");
		while(rset3.next())
	  {
	  cv_finan_jv=rset3.getString("cv_finan");
	  }
	  
	  if(folio_jv.equals("1")){
            cv_finan_jv="011";
            financiamiento1="FASSA";
            }
	   
           rset_precio = stmt_precio.executeQuery(" select clave,precio from precios_cla where clave='"+clave1_jv+"' ");
            while(rset_precio.next()){
            partida_med = part_jv;
            if (partida_med.equals("1")){
            precio_clave=0.0;
            clave_med1=rset_precio.getString("clave");
            precio_tot =0.0;
            }
            else{            
            precio_clave= rset_precio.getDouble("precio");
            cant_sur= Integer.parseInt(sur1_jv);
            clave_med1=rset_precio.getString("clave");
            precio_tot =precio_clave * cant_sur;
            }
            }
           rset_cause = stmt_cause.executeQuery("select cause,descr_cause from causes where cause='"+cause_jv+"' "); 
           while(rset_cause.next()){
           
           cause_des = rset_cause.getString("descr_cause");


            }
            rset_mpio = stmt_mpio.executeQuery("select mpio from uni_atn where clave='"+clave_jv+"' group by clave "); 
           
           while(rset_mpio.next()){
           
           
           mpio_uni = rset_mpio.getString("mpio");

           }
	  
	  if (id_med_jv.equals("MEDICAMENTO"))
	  {
	  cv_med2=2503001;
	  cv_med3=5025301;
	  }else
	  {
	  cv_med2=2504001;
	  cv_med3=5025401;
	  }
	  
	  layout="1"+"-"+cv_med3+"-"+12+cv_finan_jv+"-"+cv_dgo_jv+"-"+cv_uni_jv+"-"+cv_mpio_jv;
	   
	   rset_001 = stmt_001.executeQuery("SELECT STR_TO_DATE('"+tfecha_jv+"', '%d/%m/%Y')"); 
                    while(rset_001.next()){
                    tfecha_jv= rset_001.getString("STR_TO_DATE('"+tfecha_jv+"', '%d/%m/%Y')");
					}
		//out.print(""+tfecha_jv);			
	   rset1= stmt.executeQuery("select folio_re from receta where folio_re='"+foliore_jv+"'");
	   
	   while (rset1.next())
	   {
	   cont1++;
	   }
	  sol2 = Integer.parseInt(sol1_jv); 
	  sur2 = Integer.parseInt(sur1_jv);
	  cant2_jv = Integer.parseInt(cant_jv);
	  if (!(sur2>cant2_jv))
	  {
	  mtotal=cant2_jv-sur2;
	  
	   
	   resto_jv=sol2-sur2;
	    if (sur2==0)
		{
		status="PENDIENTE POR SURTIR";
		}
		else{
		if (resto_jv==0)
	   {
	   status="SURTIDO COMPLETO";
	   }else{
	   status="SURTIDO PARCIAL";
	   }
	   }
	   rset_001 = stmt_001.executeQuery("SELECT STR_TO_DATE('"+fechanew+"', '%d/%m/%Y')"); 
                    while(rset_001.next()){
						precio_t= sur2 * precio2;
                    fechanew= rset_001.getString("STR_TO_DATE('"+fechanew+"', '%d/%m/%Y')");
					}
		String[] dias={"DOMINGO","LUNES","MARTES", "MIERCOLES","JUEVES","VIERNES","SABADO"};
        Date hoy=new Date();
        int numeroDia=0;
        Calendar cal= Calendar.getInstance();
        cal.setTime(hoy);
        numeroDia=cal.get(Calendar.DAY_OF_WEEK);
        dia = dias[numeroDia - 1];						
					
	   //out.print(""+resto_jv);
	   stmt.execute("insert into receta values ('"+foliore_jv+"','"+tfecha_jv+"','"+reloj_jv+"','"+juris_jv+"','"+no_jur+"','"+nom_unidad+"','"+nombre_jv+"','"+edad_jv+"','"+folio_jv+"','"+radiopro_jv+"','-','"+cedu_jv+"','"+nomed_jv+"','"+cause_jv+"','"+clave1_jv+"','"+descrip1_jv+"','"+sol1_jv+"','"+sur1_jv+"','SI','"+encar_jv+"','"+clave_jv+"','"+id_med_jv+"','"+cv_dgo_jv+"','"+cv_uni_jv+"','"+cv_finan_jv+"','"+financiamiento1+"','"+layout+"','"+part_jv+"','"+present1_jv+"','"+resto_jv+"','"+status+"','RF','"+formateador.format(precio_tot)+"','-','-','-','"+carnet_jv+"','-','"+dia+"','"+cause_des+"','FA','-','-','"+ampuleo+"','-','"+mpio_uni+"','"+formateador.format(precio_clave)+"','"+formateador.format(precio_tot)+"','DURANGO',0)");	
	   cause_jv="SC";
	   if (!(mtotal==0))
	   {
	   stmt1.execute("update inventario set cant='"+mtotal+"' where clave='"+clave1_jv+"' and origen='"+part_jv+"'");
	   
	   stmt1.execute("insert into modificacion values ('"+clave1_jv+"','"+descrip1_jv+"','-','-','"+cant_jv+"','"+part_jv+"','-"+sur1_jv+"','"+mtotal+"','"+fechanew+"','"+encar_jv+"','SALIDA VÍA RECETA','',current_timestamp,'"+foliore_jv+"','"+nomed_jv+"','"+cedu_jv+"','"+nom_unidad+"','-','-',0)");	   
	   }else{
	   
	   
	   stmt1.execute("insert into modificacion values ('"+clave1_jv+"','"+descrip1_jv+"','-','-','"+cant_jv+"','"+part_jv+"','-"+sur1_jv+"','"+mtotal+"','"+fechanew+"','"+encar_jv+"','SALIDA VÍA RECETA','',current_timestamp,'"+foliore_jv+"','"+nomed_jv+"','"+cedu_jv+"','"+nom_unidad+"','-','-',0)");	
	   stmt1.execute("delete from inventario where clave='"+clave1_jv+"' and origen='"+part_jv+"'");
	   }
	   
	   clave1_jv="";
	   descrip1_jv="";
	   sol1_jv="";
	   sur1_jv=""; 
	   cant_jv=""; 
	   part_jv=""; 
	   
	   }else{
	   /*
	    rset_org_o1= stmt_o1.executeQuery("select * from inventario where clave='"+clave1_jv+"' and origen='1' ");
	  
	  while(rset_org_o1.next())
	  {
	  partida_o1_jv=rset_org_o1.getString("origen");
	   cant_o1_jv=rset_org_o1.getString("cant");
	   cant2_o1_jv=Integer.parseInt(cant_o1_jv);
	  }  
	   
	  rset_org_o2= stmt_o2.executeQuery("select * from inventario where clave='"+clave1_jv+"' and origen='2' ");
	  
	  while(rset_org_o2.next())
	  {
	  partida_o2_jv=rset_org_o2.getString("origen");
	   cant_o2_jv=rset_org_o2.getString("cant");
	   cant2_o2_jv=Integer.parseInt(cant_o2_jv);

	  }  
	  /*out.print("org1-->"+cant2_o1_jv);
	  out.print("org2-->"+cant2_o2_jv);
	  out.print("total-->"+mtotalot);*/
	  
	  //mtotalot=cant2_o1_jv+cant2_o2_jv;
	 
	 
	    rset_org_o1= stmt_o1.executeQuery("select * from inventario where clave='"+clave1_jv+"' and origen='1' ");
	  
	  while(rset_org_o1.next())
	  {
	  partida_o1_jv=rset_org_o1.getString("origen");
	   cant_o1_jv=rset_org_o1.getString("cant");
	   cant2_o1_jv=Integer.parseInt(cant_o1_jv);
	  }  
	   
	  rset_org_o2= stmt_o2.executeQuery("select * from inventario where clave='"+clave1_jv+"' and origen='2' ");
	  
	  while(rset_org_o2.next())
	  {
	  partida_o2_jv=rset_org_o2.getString("origen");
	   cant_o2_jv=rset_org_o2.getString("cant");
	   cant2_o2_jv=Integer.parseInt(cant_o2_jv);

	  }  
	  
	  rset_org_o2= stmt_o2.executeQuery("select * from inventario where clave='"+clave1_jv+"' and origen='3' ");
	  String partida_o3_jv = "", cant_o3_jv="";
	  int cant2_o3_jv=0;
	  while(rset_org_o2.next())
	  {
	   partida_o3_jv=rset_org_o2.getString("origen");
	   cant_o3_jv=rset_org_o2.getString("cant");
	   cant2_o3_jv=Integer.parseInt(cant_o3_jv);

	  }  
	  
	  
	  mtotalot=cant2_o1_jv+cant2_o2_jv+cant2_o3_jv;
	  /*out.print("org1-->"+cant2_o1_jv);
	  out.print("org2-->"+cant2_o2_jv);
	  out.print("org3-->"+cant2_o3_jv);
	  out.print("total-->"+mtotalot);
	  */
	 
	 
	  int tot_sol=0;
	  if(1==1)
	  {
	  if(sur2>mtotalot){
	  	sur2=mtotalot;
	  }
	  int sur_cap=0;
	  mtotalotsur=sur2-cant2_o1_jv;
	  sur_cap = mtotalotsur;
	  rset_001 = stmt_001.executeQuery("SELECT STR_TO_DATE('"+fechanew+"', '%d/%m/%Y')"); 
                    while(rset_001.next()){
                    fechanew= rset_001.getString("STR_TO_DATE('"+fechanew+"', '%d/%m/%Y')");
					}
	  if (cant2_o1_jv>0){
	  
	  
	   
					
	  stmt.execute("insert into receta values ('"+foliore_jv+"','"+fechanew+"','"+reloj_jv+"','"+juris_jv+"','"+no_jur+"','"+nom_unidad+"','"+nombre_jv+"','"+edad_jv+"','"+folio_jv+"','"+radiopro_jv+"','-','"+cedu_jv+"','"+nomed_jv+"','"+cause_jv+"','"+clave1_jv+"','"+descrip1_jv+"','"+cant2_o1_jv+"','"+cant2_o1_jv+"','SI','"+encar_jv+"','"+clave_jv+"','"+id_med_jv+"','"+cv_dgo_jv+"','"+cv_uni_jv+"','"+cv_finan_jv+"','"+financiamiento1+"','"+layout+"','"+partida_o1_jv+"','"+present1_jv+"','0','SURTIDO COMPLETO','RF','"+formateador.format(precio_tot)+"','-','-','-','"+carnet_jv+"','-','"+dia+"','"+cause_des+"','FA','-','-','"+ampuleo+"','-','"+mpio_uni+"','"+formateador.format(precio_clave)+"','"+formateador.format(precio_tot)+"','DURANGO',0)");
			sol2=sol2-cant2_o1_jv;
	  //stmt.execute("insert into receta values ('"+foliore_jv+"','"+fechanew+"','"+reloj_jv+"','"+juris_jv+"','"+no_jur+"','"+nom_unidad+"','"+nombre_jv+"','"+edad_jv+"','"+folio_jv+"','"+programa_jv+"','-','"+cedu_jv+"','"+nomed_jv+"','"+cause_jv+"','"+clave1_jv+"','"+descrip1_jv+"','"+cant2_o1_jv+"','"+cant2_o1_jv+"','SI','"+encar_jv+"','"+clave_jv+"','"+id_med_jv+"','"+cv_dgo_jv+"','"+cv_uni_jv+"','"+cv_finan_jv+"','"+financiamiento1+"','"+layout+"','"+partida_o1_jv+"','"+present1_jv+"','0','SURTIDO COMPLETO','RF','-','-','-','-','"+carnet_jv+"','-','"+fechanew+"','A','-','-','-','-','-','-','-','"+corte+"','"+ampuleo+"',0)");	

	
		stmt.execute("insert into modificacion values ('"+clave1_jv+"','"+descrip1_jv+"','-','-','"+cant2_o1_jv+"','"+partida_o1_jv+"','-"+cant2_o1_jv+"','0','"+fechanew+"','"+encar_jv+"','SALIDA VÍA RECETA','',current_timestamp,'"+foliore_jv+"','-','-','-','-','-',0)");
	  //stmt1og1.execute("insert into modificacion values ('"+clave1_jv+"','"+descrip1_jv+"','-','-','"+cant2_o1_jv+"','"+partida_o1_jv+"','-"+cant2_o1_jv+"','0','"+fechanew+"','"+encar_jv+"','SALIDA VÍA RECETA','',current_timestamp,'"+foliore_jv+"','-','-','-','-','-',0)");	
	   stmt.execute("delete from inventario where clave='"+clave1_jv+"' and origen='"+partida_o1_jv+"'");
	  //stmt1.execute("delete from inventario where clave='"+clave1_jv+"' and origen='"+partida_o1_jv+"'");
	  
	  /*resto_jv=sol2-sur2;
	    if (sur2==0)
		{
		status="PENDIENTE POR SURTIR";
		}
		else{
				if (resto_jv==0)
			   {
			  resto22_jv=mtotalotsur;
			   status="SURTIDO COMPLETO";
			   }else{
			   status="SURTIDO PARCIAL";
			   resto22_jv=resto_jv+mtotalotsur;
			   }
	   }
	   */
	   }
	   if (mtotalotsur>0){
		if (cant2_o3_jv>0){
	   //--------------------------------Origen 3------------------------------------------------------------------------
		   int cant_03=cant2_o3_jv;
		   mtotalotsur=mtotalotsur-cant2_o3_jv;
		   if (mtotalotsur<0){
			 cant2_o3_jv=sur_cap;
		   }
		   sur_cap=mtotalotsur;
		  
		  stmt.execute("insert into receta values ('"+foliore_jv+"','"+fechanew+"','"+reloj_jv+"','"+juris_jv+"','"+no_jur+"','"+nom_unidad+"','"+nombre_jv+"','"+edad_jv+"','"+folio_jv+"','"+radiopro_jv+"','-','"+cedu_jv+"','"+nomed_jv+"','"+cause_jv+"','"+clave1_jv+"','"+descrip1_jv+"','"+cant2_o3_jv+"','"+cant2_o3_jv+"','SI','"+encar_jv+"','"+clave_jv+"','"+id_med_jv+"','"+cv_dgo_jv+"','"+cv_uni_jv+"','"+cv_finan_jv+"','"+financiamiento1+"','"+layout+"','"+partida_o3_jv+"','"+present1_jv+"','"+resto_jv+"','"+status+"','RF','"+formateador.format(precio_tot)+"','-','-','-','"+carnet_jv+"','-','"+dia+"','"+cause_des+"','FA','-','-','"+ampuleo+"','-','"+mpio_uni+"','"+formateador.format(precio_clave)+"','"+formateador.format(precio_tot)+"','DURANGO',0)");

			sol2=sol2-cant2_o3_jv;
		  if (mtotalotsur>=0){
			stmt.execute("delete from inventario where clave='"+clave1_jv+"' and origen='"+partida_o3_jv+"'");
		  } else {
		  stmt.execute("update inventario set cant='"+(-mtotalotsur)+"' where clave='"+clave1_jv+"' and origen='"+partida_o3_jv+"'");
		  } 
		  stmt.execute("insert into modificacion values ('"+clave1_jv+"','"+descrip1_jv+"','-','-','"+cant_03+"','"+partida_o3_jv+"','"+(-cant2_o3_jv)+"','"+(cant_03-cant2_o3_jv)+"','"+fechanew+"','"+encar_jv+"','SALIDA VÍA RECETA','',current_timestamp,'"+foliore_jv+"','-','-','-','-','-',0)");
		  }
	   }
	   if (mtotalotsur>0){
		if (cant2_o2_jv>0){
			   //--------------------------------Origen 2------------------------------------------------------------------------
			   mtotalotsur=mtotalotsur-cant2_o2_jv;
			   int cant_02=cant2_o2_jv;
				if (mtotalotsur<0){
				 cant2_o2_jv=-mtotalotsur;
			   }
			   //sur_cap=mtotalotsur;
			  
			  stmt.execute("insert into receta values ('"+foliore_jv+"','"+fechanew+"','"+reloj_jv+"','"+juris_jv+"','"+no_jur+"','"+nom_unidad+"','"+nombre_jv+"','"+edad_jv+"','"+folio_jv+"','"+radiopro_jv+"','-','"+cedu_jv+"','"+nomed_jv+"','"+cause_jv+"','"+clave1_jv+"','"+descrip1_jv+"','"+sur_cap+"','"+sur_cap+"','SI','"+encar_jv+"','"+clave_jv+"','"+id_med_jv+"','"+cv_dgo_jv+"','"+cv_uni_jv+"','"+cv_finan_jv+"','"+financiamiento1+"','"+layout+"','"+partida_o2_jv+"','"+present1_jv+"','"+resto_jv+"','"+status+"','RF','"+formateador.format(precio_tot)+"','-','-','-','"+carnet_jv+"','-','"+dia+"','"+cause_des+"','FA','-','-','"+ampuleo+"','-','"+mpio_uni+"','"+formateador.format(precio_clave)+"','"+formateador.format(precio_tot)+"','DURANGO',0)");

			  if (mtotalotsur>= 0){
				stmt.execute("delete from inventario where clave='"+clave1_jv+"' and origen='"+partida_o2_jv+"'");
			  } else {
			  stmt.execute("update inventario set cant='"+(-mtotalotsur)+"' where clave='"+clave1_jv+"' and origen='"+partida_o2_jv+"'");
			  }
			  stmt.execute("insert into modificacion values ('"+clave1_jv+"','"+descrip1_jv+"','-','-','"+cant_02+"','"+partida_o2_jv+"','"+(-(cant_02-cant2_o2_jv))+"','"+((cant2_o2_jv))+"','"+fechanew+"','"+encar_jv+"','SALIDA VÍA RECETA','',current_timestamp,'"+foliore_jv+"','-','-','-','-','-',0)");
			  }
		}	
		//if (mtotalotsur>0){
		//if (cant2_o2_jv>0){
			   //--------------------------------Pendiente por Surtir------------------------------------------------------------------------
			   
			    String[] dias2={"DOMINGO","LUNES","MARTES", "MIERCOLES","JUEVES","VIERNES","SABADO"};
				Date hoy=new Date();
				int numeroDia2=0;
				Calendar cal2= Calendar.getInstance();
				cal2.setTime(hoy);
				numeroDia2=cal2.get(Calendar.DAY_OF_WEEK);
				dia2 = dias2[numeroDia2 - 1];
				
			  sol2=sol2-sur_cap;
			  if (sol2>0){
			  	stmt.execute("insert into receta values ('"+foliore_jv+"','"+fechanew+"','"+reloj_jv+"','"+juris_jv+"','"+no_jur+"','"+nom_unidad+"','"+nombre_jv+"','"+edad_jv+"','"+folio_jv+"','"+radiopro_jv+"','-','"+cedu_jv+"','"+nomed_jv+"','"+cause_jv+"','"+clave1_jv+"','"+descrip1_jv+"','"+sol2+"','0','NO','"+encar_jv+"','"+clave_jv+"','"+id_med_jv+"','"+cv_dgo_jv+"','"+cv_uni_jv+"','"+cv_finan_jv+"','"+financiamiento1+"','"+layout+"','2','"+present1_jv+"','"+resto_jv+"','"+"PENDIENTE POR SURTIR"+"','RF','"+formateador.format(precio_tot)+"','-','-','-','"+carnet_jv+"','-','"+dia2+"','"+cause_des+"','FA','-','-','"+ampuleo+"','-','"+mpio_uni+"','"+formateador.format(precio_clave)+"','"+formateador.format(precio_tot)+"','DURANGO',0)");
			  }
			  
	   cause_jv="SC";	  
       clave1_jv="";
	   descrip1_jv="";
	   sol1_jv="";
	   sur1_jv=""; 
	   cant_jv=""; 
	   part_jv=""; 	
	  /*
	  mtotalotsur=sur2-cant2_o1_jv;
	   rset_001 = stmt_001.executeQuery("SELECT STR_TO_DATE('"+fechanew+"', '%d/%m/%Y')"); 
                    while(rset_001.next()){
                    fechanew= rset_001.getString("STR_TO_DATE('"+fechanew+"', '%d/%m/%Y')");
					}
	   stmt.execute("insert into receta values ('"+foliore_jv+"','"+tfecha_jv+"','"+reloj_jv+"','"+juris_jv+"','"+no_jur+"','"+nom_unidad+"','"+nombre_jv+"','"+edad_jv+"','"+folio_jv+"','"+radiopro_jv+"','-','"+cedu_jv+"','"+nomed_jv+"','"+cause_jv+"','"+clave1_jv+"','"+descrip1_jv+"','"+cant2_o1_jv+"','"+cant2_o1_jv+"','SI','"+encar_jv+"','"+clave_jv+"','"+id_med_jv+"','"+cv_dgo_jv+"','"+cv_uni_jv+"','"+cv_finan_jv+"','"+financiamiento1+"','"+layout+"','"+partida_o1_jv+"','"+present1_jv+"','0','SURTIDO COMPLETO','RF','"+formateador.format(precio_tot)+"','-','-','-','"+carnet_jv+"','-','"+dia+"','"+cause_des+"','FA','-','-','"+ampuleo+"','-','"+mpio_uni+"','"+formateador.format(precio_clave)+"','"+formateador.format(precio_tot)+"','DURANGO',0)");		
	 
	
					
	  stmt1og1.execute("insert into modificacion values ('"+clave1_jv+"','"+descrip1_jv+"','-','-','"+cant2_o1_jv+"','"+partida_o1_jv+"','-"+cant2_o1_jv+"','0','"+fechanew+"','"+encar_jv+"','SALIDA VÍA RECETA','',current_timestamp,'"+foliore_jv+"','-','-','-','-','-',0)");	
	   
	 stmt1.execute("delete from inventario where clave='"+clave1_jv+"' and origen='"+partida_o1_jv+"'");
	  
	  resto_jv=sol2-sur2;
	    if (sur2==0)
		{
		status="PENDIENTE POR SURTIR";
		}
		else{
				if (resto_jv==0)
			   {
			   status="SURTIDO COMPLETO";
			   resto22_jv=mtotalotsur;
			   }else{
			   status="SURTIDO PARCIAL";
			   resto22_jv=resto_jv+mtotalotsur;
			   }
	   }
	  
	  
	    stmt_og22.execute("insert into receta values ('"+foliore_jv+"','"+tfecha_jv+"','"+reloj_jv+"','"+juris_jv+"','"+no_jur+"','"+nom_unidad+"','"+nombre_jv+"','"+edad_jv+"','"+folio_jv+"','"+radiopro_jv+"','-','"+cedu_jv+"','"+nomed_jv+"','"+cause_jv+"','"+clave1_jv+"','"+descrip1_jv+"','"+resto22_jv+"','"+mtotalotsur+"','SI','"+encar_jv+"','"+clave_jv+"','"+id_med_jv+"','"+cv_dgo_jv+"','"+cv_uni_jv+"','"+cv_finan_jv+"','"+financiamiento1+"','"+layout+"','"+partida_o2_jv+"','"+present1_jv+"','"+resto_jv+"','"+status+"','RF','"+formateador.format(precio_tot)+"','-','-','-','"+carnet_jv+"','-','"+dia+"','"+cause_des+"','FA','-','-','"+ampuleo+"','-','"+mpio_uni+"','"+formateador.format(precio_clave)+"','"+formateador.format(precio_tot)+"','DURANGO',0)");	
	  
	   
	  mtotalotsur2=cant2_o2_jv-mtotalotsur;
	  if(mtotalotsur2==0)
	  {
	  stmt1.execute("delete from inventario where clave='"+clave1_jv+"' and origen='"+partida_o2_jv+"'");
	  }else{
	  stmt1.execute("update inventario set cant='"+mtotalotsur2+"' where clave='"+clave1_jv+"' and origen='"+partida_o2_jv+"'");
	  
	  }
	   stmt1og2.execute("insert into modificacion values ('"+clave1_jv+"','"+descrip1_jv+"','-','-','"+cant2_o2_jv+"','"+partida_o2_jv+"','-"+mtotalotsur+"','"+mtotalotsur2+"','"+fechanew+"','"+encar_jv+"','SALIDA VÍA RECETA','',current_timestamp,'"+foliore_jv+"','-','-','-','-','-',0)");	
	   
	   
	   
	    clave1_jv="";
	   descrip1_jv="";
	   sol1_jv="";
	   sur1_jv=""; 
	   cant_jv=""; 
	   part_jv=""; 
	   
	   
	   
	   
	   //out.print(""+mtotalotsur2+"="+cant2_o2_jv+"-"+mtotalotsur);
	   */
	   }else{
	    %>
	    <script>
	   alert("CANTIDAD SURTIDA ES MAYOR QUE LA EXISTENCIA")
	   </script>
	   <%
	   clave1_jv="";
	   descrip1_jv="";
	   sol1_jv="";
	   sur1_jv="";
	   cant_jv="";
	   }
	   }}
	   
}	
if(but.equals("Imprimir"))
     {
	  radiopro_jv=request.getParameter("radio_pro");
	  foliore2_jv=request.getParameter("txtf_foliore");
	  no_jur=request.getParameter("txtf_njuris");
	  nom_unidad=request.getParameter("txtf_unidadmed");
	  
	  
	  nombre_jv="";
	  edad_jv="";
	  folio_jv="";
	  uni_jv="";
	  cedu_jv="";
	  nomed_jv="";
	  clave1_jv="";
	  descrip1_jv="";
	  sol1_jv="";
	  sur1_jv="";
	  radiopro_jv=request.getParameter("radio_pro");
	  radiosur_jv=request.getParameter("radiosur");
	  cause_jv="";
	  reloj_jv=request.getParameter("reloj");
	  date_jv=request.getParameter("txtf_date");
	  %>
	  <script>
	  self.location='recibo_farm.jsp?var_radio1=<%=radiopro_jv%>&folio=<%=foliore2_jv%>&receta5=RF&encar=<%=encar_jv%>&uni=<%=nom_unidad%>&juris=<%=no_jur%>&juris1=<%=juris_jv%>&clave_uni=<%=clave_jv%>&cv_dgo=<%=cv_dgo_jv%>&cv_uni=<%=cv_uni_jv%>&cv_mpio=<%=cv_mpio_jv%>&part=<%=part_jv%>&id_med=<%=id_med_jv%>';
	  
	  </script>
	  <%
	  foliore_jv="";
	  //
	   	/*  foliore_jv=request.getParameter("txtf_foliore");
	  no_jur=request.getParameter("txtf_njuris");
	  nom_unidad=request.getParameter("txtf_unidadmed");
	  nombre_jv=request.getParameter("txtf_paciente");
	  edad_jv=request.getParameter("txtf_edad");
	  folio_jv=request.getParameter("txtf_foliosp");
	  uni_jv=request.getParameter("txtf_uni");	
	  cedu_jv=request.getParameter("txtf_cedu");	
	  nomed_jv=request.getParameter("txtf_nomed");
	  clave1_jv=request.getParameter("txtf_clave1");
	  descrip1_jv=request.getParameter("txtf_descrip1");
	  sol1_jv=request.getParameter("txtf_sol1");
	  sur1_jv=request.getParameter("txtf_sur1");
	  radiopro_jv=request.getParameter("radio_pro");
	  radiosur_jv=request.getParameter("radiosur");
	  cause_jv=request.getParameter("txtf_cause");
	  reloj_jv=request.getParameter("reloj");
	  date_jv=request.getParameter("txtf_date");
	  
	  
	   */
}


	

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<script  type="text/javascript" >
                           function regresar(url){
                            location.href = url;
                            
                        }
                         function Solo_Numerico(variable){
                             Numer=parseInt(variable);
                    if (isNaN(Numer)){
                             return "";
                                     }
                             return Numer;
                                     }
                        function ValNumero(Control){
                         Control.value=Solo_Numerico(Control.value);
                         
                        }
	function soloLetras(e){
       key = e.keyCode || e.which;
       tecla = String.fromCharCode(key).toLowerCase();
       letras = " áéíóúabcdefghijklmnñopqrstuvwxyz";
       especiales = [8,37,39,46];

       tecla_especial = false
       for(var i in especiales){
            if(key == especiales[i]){
                tecla_especial = true;
                break;
            }
        }

        if(letras.indexOf(tecla)==-1 && !tecla_especial){
            return false;
        }
		function getRadioButtonSelectedValue(ctrl)
			{
					for(i=0;i<ctrl.length;i++)
					if(ctrl[i].checked) return ctrl[i].value;
			}
        }
    
    
</script> 
<head>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>.:Receta Electr&oacute;nica WEB:.</title>
<script language="javascript" src="list02.js">

</script>
<script type="text/javascript">
function validar(e) { // 1
    tecla = (document.all) ? e.keyCode : e.which; // 2
    if (tecla==8) return true; // 3
  patron = /\d/; // Solo acepta números



  //SOLO LETRAS-->patron =/[A-Za-z\s]/; // 4
  //SOLO LETRAS Y NUMEROS --> patron = /\d/; // Solo acepta números
  //numeros y letras --> patron = /\w/; // Acepta números y letras
//no aceptan numeros --> patron = /\D/; // No acepta números
//aceptan las letras ñÑ --> patron =/[A-Za-zñÑ\s]/; // igual que el ejemplo, pero acepta también las letras ñ y Ñ  
//determinado letras y numeros --> patron = /[ajt69]/;//También se puede hacer un patrón que acepte determinados caracteres, poniendolos entre corchetes. Veamos un ejemplo para validar que solo se acepte a, j, t, 6 y 9:
   
    te = String.fromCharCode(tecla); // 5
    return patron.test(te); // 6
} 

function foco_inicial(){
	if(document.form.txtf_med1.value==""){
	document.form.txtf_med1.focus();
	}
	else if(document.form.txtf_clave1.value!==""){
	document.form.unidades.focus();
	}
	else if(document.form.txtf_cedu.value==""){
	document.form.txtf_medico.focus();
	}
	if((document.form.txtf_foliosp!="")&&(document.form.txtf_nomed.value=="")){
	document.form.slct_afiliados.focus();
	}
	if(document.form.txtf_foliosp.value==""){
	document.form.txtf_cb.focus();
	}
	
	
	if (document.form.txtf_t1.value==""){
	document.form.txtf_t1.focus();
	}
	
	
	
	mueveReloj();
	
}
function foco_fecha(){
	if (document.form.txtf_t3.value!="2014"){
	mitexto=document.form.txtf_t3.value;
	document.form.txtf_t3.value=mitexto;
	document.form.txtf_t3.focus();
	//document.form.txtf_t3.value=mitexto;
	}
	/*else {
	document.form.txtf_t3.value="2014";
	document.form.txtf_foliore.focus();
	}*/
}

</script>

<style type="text/css">
<!--
.style2 {
	font-size: 10px;
	font-family: Arial, Helvetica, sans-serif;
}
.style4 {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 14px;
}
.style5 {font-size: 14px}
.style7 {
	font-size: 16px;
	font-family: Arial, Helvetica, sans-serif;
	font-weight: bold;
}
.style11 {font-size: 12px}
.style13 {
	font-size: 12px;
	color: #990000;
	font-weight: bold;
}
.Estilo1 {color: #000000}
.Estilo4 {
	color: #000066;
	font-weight: bold;
}
.Estilo5 {
	font-size: 16px;
	font-weight: bold;
}
.Estilo7 {color: #990000}
.Estilo11 {font-size: 10px; font-family: Arial, Helvetica, sans-serif; color: #003399; font-weight: bold; }
.Estilo12 {color: #003399}
.Estilo13 {color: #003366}
-->
</style>

<link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
<style type="text/css">
<!--
.style111 {	font-size: 12px;
	color: #000;
}
-->
</style>
</head>

<body onLoad="foco_inicial();">
<form name="form" method="post" action="recedgo.jsp?var_radio1=<%=radiopro_jv%>&uni=<%=nom_unidad%>&juris=<%=no_jur%>&nombre=<%=nombre_jv%>&edad=<%=edad_jv%>&folio=<%=folio_jv%>&clave1=<%=clave1_jv%>&descrip1=<%=descrip1_jv%>&present1=<%=present1_jv%>&indica1=<%=indica1_jv%>&sol1=<%=sol1_jv%>&sur1=<%=sur1_jv%>&cause=<%=cause_jv%>&foliore=<%=foliore_jv%>&encar=<%=encar_jv%>&juris1=<%=juris_jv%>&clave_uni=<%=clave_jv%>&univer=<%=uni_jv%>&cedu=<%=cedu_jv%>&nomed=<%=nomed_jv%>&cv_dgo=<%=cv_dgo_jv%>&cv_uni=<%=cv_uni_jv%>&cv_mpio=<%=cv_mpio_jv%>&day5=<%=t1_jv%>&mes5=<%=t2_jv%>&aa5=<%=t3_jv%>&programa=<%=programa_jv%>&perfil=<%=perfil%>">
<a href="index.jsp" class="style2">REGRESAR A MENÚ</a>
<table width="924" height="644" border="3" align="center" cellpadding="2">
  <tr>
    <td width="908" height="114"><table width="837" border="0" align="center" cellpadding="2">
      <tr>
        <td width="114" height="59"><img src="logo_salud.jpg" width="75" height="55" /></td>
        <td width="339"><div align="center" class="style7">SERVICIO DE SALUD DE DURANGO<br />
        RECETA M&Eacute;DICA <br /> CONSULTA EXTERNA</div>
          <span class="style13"><span class="Estilo1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Estilo12">&nbsp;&nbsp;</span></span></span><span class="Estilo11">&nbsp;BIENVENIDO (A):&nbsp;</span><span class="style2"><span class="Estilo4"><%=encar_jv%></span></span></td>
        <td width="225"><img src="logo_dgo.jpg" width="109" height="76" /><!--input name="Submit"  type="reset" class="bodyText" value="Borrar Datos" /--></td>
      </tr>
    </table>
      <table width="854" height="45" border="0" align="center" cellpadding="2">
        <tr>
          <td width="311" height="41">
            <table width="270" height="0%" border="0" cellpadding="2">
              <tr>
                <td width="221" height="100%" class="style2">FECHA:
                        
                  <input name="txtf_date" type="text" class="style13" onKeyPress="return handleEnter(this, event)" value="<%=day1%>/<%=res%>/<%= year %>" size="1" readonly style="visibility:hidden"/>
                  &nbsp;
                  <input name="txtf_t1" type="text" onKeyPress="return handleEnter(this, event)" onKeyUp="putDays()" value="<%=t1_jv%>" size="1" maxlength="2"/>
			        <strong>                    /</strong>
                    <input name="txtf_t2" type="text" size="1" maxlength="2" onKeyUp="putMonthss()" value="<%=t2_jv%>" onKeyPress="return handleEnter(this, event)" />
                    <strong>                    /</strong>
                    <input name="txtf_t3" type="text" size="2" maxlength="4" onKeyUp="putYearss(this.form)" value="2014" onBlur="foco_fecha();" onKeyPress="return foco_fecha();"/><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>&nbsp;<span class="Estilo7">&nbsp;&nbsp;DD&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MM&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;AAAA</span></strong></td>
              </tr>
          </table>          </td>
          <td width="197"><table width="167" height="0%" border="0" cellpadding="2">
            <tr>
              <td width="225" height="100%" class="style2">HORA:
                <input name="reloj" type="text" class="style13" onKeyPress="return handleEnter(this, event)" size="15" readonly ></td>
            </tr>
          </table>          </td>
          <td width="326" align="center" class="style2">Ingrese No. Folio
            <input name="txtf_foliore" type="text" class="style13"  value="<%=foliore_jv%>" size="20" onKeyPress="return handleEnter(this, event)"/>
            <!--onKeyPress="return validar(event)"-->
            <a href="reempresion.jsp?uni=<%=nom_unidad%>&juris=<%=no_jur%>&nombre=<%=nombre_jv%>&edad=<%=edad_jv%>&folio=<%=folio_jv%>&clave1=<%=clave1_jv%>&descrip1=<%=descrip1_jv%>&present1=<%=present1_jv%>&indica1=<%=indica1_jv%>&sol1=<%=sol1_jv%>&sur1=<%=sur1_jv%>&cause=<%=cause_jv%>&foliore=<%=foliore_jv%>&encar=<%=encar_jv%>&juris1=<%=juris_jv%>&clave_uni=<%=clave_jv%>&univer=<%=uni_jv%>&cedu=<%=cedu_jv%>&nomed=<%=nomed_jv%>&cv_dgo=<%=cv_dgo_jv%>&cv_uni=<%=cv_uni_jv%>&cv_mpio=<%=cv_mpio_jv%>&day5=<%=t1_jv%>&mes5=<%=t2_jv%>&aa5=<%=t3_jv%>&programa=<%=programa_jv%>&carnet=-&part=<%=part_jv%>" target="_blank">Reimprir Ticket</a>
            <table width="152" height="0%" border="0" align="right" cellpadding="2">
          </table></td>
        </tr>
    </table>    </td>
  </tr>
        <tr>
          <td height="2" colspan="3" class="style4"><div id="item7" style="display:none" align="justify" ><span class="style2">
            <input name="txtf_date1" type="text" size="20" value="<%= day>10?day:day %>/<%= month>10?month:month %>/<%= year %>" onKeyPress="return handleEnter(this, event)" readonly/>
          </span></div></td>
        </tr>
        <tr>
          <td height="41" colspan="3" class="style4"><table width="710" border="0" align="center" cellpadding="2">
            <tr>
              <td width="533" class="style2">UNIDAD DE SALUD
              <input type="text" name="txtf_unidadmed" size="60" colspan="3" class="style13"  value="<%=nom_unidad%>" readonly onKeyPress="return handleEnter(this, event)"/></td>
              <td width="170"><table width="170" border="0" align="left" cellpadding="2">
                <tr>
                  <td width="162" align="center"><div align="center" class="style2">JURISDICCION&nbsp;&nbsp;<input name="txtf_njuris" type="text" class="style13" value="<%=no_jur%>" size="1" readonly onKeyPress="return handleEnter(this, event)"/>
                  </div></td>
                </tr>
              </table></td>
            </tr>
            
          </table></td>
        </tr>
        <tr>
          <td height="91" colspan="3" class="style4"><table width="753" border="0" align="center" cellpadding="2">
            <tr>
              <td height="27" colspan="2" class="style2">Introduzca C&oacute;digo  Paciente: 
                <input name="txtf_cb" type="text" id="txtf_cb"  onchange="<%=but="Mostrar"%>" />
              <input name="Submit" type="submit" class="subHeader" value="Mostrar" onClick="return validaFolio();"/>&nbsp;&nbsp;
			 
			 <select name="slct_afiliados" id="slct_afiliados" class="style2" onkeypress="return handleEnter(this, event)" onChange="putNom(this.form);">
        <option>---- AFILIADOS------</option>
        <%
		   if(afi>0)
		   {
		%>
        <span class="style2">AFILIADOS
                  
					
                
        
        
        
        
        
        <%
		     
             for(x1=0;x1<afi;x1++)
                {
                  // out.print(""+x1);
           %>
        <option value="<%=afiliadoEdad[x1]%>"><%=afiliado[x1]%></option>
        <%
					  }
					%>
        <%
					  }
					%>
      </select>
                  <a href="paciente.jsp" target="_blank">Nuevo paciente</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <a href="renovacion.jsp" target="popup"
						onClick="window.open(this.href, this.target, 'toolbar=0 , location=0 						, status=0 , menubar=0 , scrollbars=0 , resizable=0 				  						,left=580pt,top=170pt,width=730px,height=450px'); return false;">
						Renovación De Vigencia </a>
              </td>
            </tr>
            <tr>
              <td width="602" height="52" class="style2">NOMBRE DEL PACIENTE:
                <label> </label>
                <span class="style5">
                <label> </label>
                <input name="txtf_paciente" type="text" onkeypress="return soloLetras(event);" onfocusout="this.value=this.value.toUpperCase()" class="style13" value="<%=nombre_jv%>" size="50"  onKeyPress="return handleEnter(this, event)"/>
                </span>
                <label><span class="style2"> Carnet:&nbsp;
                <input name="txtf_carnet" type="text" class="style13" value="<%=carnet_jv%>" size="8"  onKeyPress="return handleEnter(this, event)"/>
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;APELLIDO PATERNO </span><span class="style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;APELLIDO MATERNO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;NOMBRE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></label></td>
              <td width="137"><table width="137" border="0" align="right" cellpadding="2">
                <tr>
                  <td width="129"><div align="right"><span class="style2">
                    <input name="txtf_edad" type="text" onkeyUp="return ValNumero(this);" maxlength="3" class="style13" value="<%=edad_jv%>" size="10"  onkeypress="return handleEnter(this, event)"/>
                    <br />
                    EDAD</span></div></td>
                </tr>
              </table></td>
            </tr>
          </table>          </td>
        </tr>
        <tr>
          <td height="82" colspan="3" maxlength="3" class="style4"><table width="733" border="0" align="center" cellpadding="2">
            <tr>
              <td width="87"  class="style2"><div align="center">POBLACION ABIERTA </div></td>
              <td width="135" class="style2"><div align="center">OPORTUNIDADES</div></td>
              <td width="140" class="style2"><div align="center">SEGURO POPULAR </div></td>
              <td width="345" class="style2"><div align="center">No. DE FOLIO S.P. </div></td>
			  
            </tr>
            <%
						radiopro_jv=request.getParameter("radio_pro");
						if (radiopro_jv.equals("")){														
						%>	
			
								<tr>
								   
								  <td class="style11"><label> <br />
									<input name="radio_pro" type="radio" value="PA" onKeyPress="return handleEnter(this, event)" />
								  </label></td>
								  <td class="style11"><label>
									<input name="radio_pro" type="radio" value="OP" onKeyPress="return handleEnter(this, event)" />
									<img src="oportunidades.jpg" width="107" height="32" /></label></td>
								  <td class="style11"><label>
									<input name="radio_pro" type="radio" value="SP" checked="checked" onKeyPress="return handleEnter(this, event)" />
									<img src="salud_seguro_popu.jpg" width="107" height="32" /></label></td>
								  <td class="style11"><input name="txtf_foliosp" type="text" class="style13" value="<%=folio_jv%>" size="50" onKeyPress="return handleEnter(this, event)"/>
								  </td>
								</tr>
						<%}%>
						<%
						if (radiopro_jv.equals("SP")){														
						%>	
			
								<tr>
								   
								  <td class="style11"><label> <br />
									<input name="radio_pro" type="radio" value="PA" onKeyPress="return handleEnter(this, event)" />
								  </label></td>
								  <td class="style11"><label>
									<input name="radio_pro" type="radio" value="OP" onKeyPress="return handleEnter(this, event)" />
									<img src="oportunidades.jpg" width="107" height="32" /></label></td>
								  <td class="style11"><label>
									<input name="radio_pro" type="radio" value="SP" checked="checked" onKeyPress="return handleEnter(this, event)" />
									<img src="salud_seguro_popu.jpg" width="107" height="32" /></label></td>
								  <td class="style11"><input name="txtf_foliosp" type="text" class="style13" value="<%=folio_jv%>" size="50" onKeyPress="return handleEnter(this, event)"/>
								  </td>
								</tr>
						<%}%>
						<%
						if (radiopro_jv.equals("PA")){														
						%>	
			
								<tr>
								   
								  <td class="style11"><label> <br />
									<input name="radio_pro" type="radio" value="PA" checked="checked" onKeyPress="return handleEnter(this, event)" />
								  </label></td>
								  <td class="style11"><label>
									<input name="radio_pro" type="radio" value="OP" onKeyPress="return handleEnter(this, event)" />
									<img src="oportunidades.jpg" width="107" height="32" /></label></td>
								  <td class="style11"><label>
									<input name="radio_pro" type="radio" value="SP" onKeyPress="return handleEnter(this, event)" />
									<img src="salud_seguro_popu.jpg" width="107" height="32" /></label></td>
								  <td class="style11"><input name="txtf_foliosp" type="text" class="style13" value="<%=folio_jv%>" size="50" onKeyPress="return handleEnter(this, event)"/>
								  </td>
								</tr>
						<%}%>
						<%if (radiopro_jv.equals("OP")){%>
								<tr>
								   
								  <td class="style11"><label> <br />
									<input name="radio_pro" type="radio" value="PA" onKeyPress="return handleEnter(this, event)" />
								  </label></td>
								  <td class="style11"><label>
									<input name="radio_pro" type="radio" value="OP" checked="checked" onKeyPress="return handleEnter(this, event)" />
									<img src="oportunidades.jpg" width="107" height="32" /></label></td>
								  <td class="style11"><label>
									<input name="radio_pro" type="radio" value="SP" onKeyPress="return handleEnter(this, event)" />
									<img src="salud_seguro_popu.jpg" width="107" height="32" /></label></td>
								  <td class="style11"><input name="txtf_foliosp" type="text" class="style13" value="<%=folio_jv%>" size="50" onKeyPress="return handleEnter(this, event)"/>
								  </td>
								</tr>
						<%}%>	
            
          </table></td>
        </tr>
        <tr>
          <td height="38" colspan="3" class="style4"><table width="763" border="0" align="center" cellpadding="2">
            <tr>
              <td width="755" class="style2"><a href="medico.jsp" target="_blank">NUEVO MÉDICO</a> | CÉDULA: 
                <input name="txtf_medico" id="txtf_medico" type="text" size="10"  onchange="<%=but2="Medico"%>" onKeyPress="return handleEnter(this, event)" /><input name="Submit" type="submit" class="subHeader" value="Médico"  onclick=" return validaBtnMedico();"/>
              NOMBRE:
              <input name="txtf_nomed" type="text" class="style13" value="<%=nomed_jv%>" size="35"  onKeyPress="return handleEnter(this, event)" />
              <span class="style2">C&Eacute;DULA: 
              <input name="txtf_cedu" id="a" type="text" class="style13" value="<%=cedu_jv%>" size="10"  onKeyPress="return handleEnter(this, event)"/>
              </span></td>
            </tr>
          </table></td>
        </tr>
        <tr>
          <td height="219" colspan="3" class="style4"><table width="825" border="0" align="center" cellpadding="2">
            
            <tr>
              <td colspan="3" class="style11">Ingrese Clave:
              <input type="text" name="txtf_med1" size="10" value="<%=med1_jv%>" id="txtf_med1" onKeyPress="return handleEnter(this, event)"/><input name="Submit" type="submit" class="subHeader" value="Clave" onClick="return validaBtnClave();" />&nbsp;<a href="index_carga_clave.jsp" target="_blank">Agregar Clave al Inventario</a><span class="style111"> | <a href="inventarios.jsp" target="_blank">Ver Inventario</a></span></td>
              <td colspan="6" class="style11"><span class="style2"><span class="Estilo13">TOTAL EXISTENCIAS:</span><span class="Estilo5"> <%=sumatotal%>&nbsp;</span></span></td>
              <td width="155" class="style11"><label>
                <div align="center">
                  <input type="text" name="txtf_idmed" size="1" value="<%=id_med_jv%>" style="visibility:hidden" />
                 <span class="style2">FUENTE                </span>
                  <input type="text" name="txtf_present" size="1" value="<%=present1_jv%>" style="visibility:hidden"/>
                  
                  <input type="text" name="txtf_finan" size="1"  style="visibility:hidden"/>
                  
                  <input type="text" class="style2" name="txtf_ff" value="<%=encontrado%>" readonly />
                </div>
                
              </label></td>
            </tr>
            <tr>
              <td width="76" class="style11"><span class="style2">CLAVE</span></td>
              <td width="217" class="style11"><span class="style2">DESCRIPCI&Oacute;N</span></td>
              <td width="74" class="style11"><span class="style2">TAB/AMP</span></td>
              <td class="style11"><span class="style2">HORAS</span></td>
              <td width="59" class="style11"><span class="style2">D&Iacute;AS</span></td>
              <td width="59" class="style11"><span class="style2">Sol</span></td>
              <td width="59" class="style11">&nbsp;</td>
              <td width="59" class="style11"><span class="style2">CAUSES</span></td>
              <td class="style11" colspan="2"><span class="style2"> EXIST.</span>
                <input type="text" name="txtf_exist" size="1"  class="style2" value="<%=cant_jv%>" onKeyPress="return handleEnter(this, event)" readonly/>&nbsp;<span class="style2">Origen</span>
              
                <input name="txtf_part" type="text" class="style2" value="<%=part_jv%>" size="1" readonly />              </td>
            </tr>
            <tr>
              <td class="style11">
              <input type="text" name="txtf_clave1" size="10" class="style2" value="<%=clave1_jv%>"  readonly="true"/>
              <input type="text" name="cant_disp" size="10" class="hidden" value="<%=cant_disp%>"  readonly="true"/>
              </td>
              <td class="style11"><textarea name="txtf_descrip1" cols="50"  class="style2" readonly><%=descrip1_jv%></textarea></td>
              <td class="style11"><input type="text" name="unidades" id="unidades" size="5" onKeyUp="sumar();" onKeyPress="return validar(event)" /></td>
              <td class="style11"><input type="text" name="horas" id="horas" size="5" onKeyUp="sumar();" onKeyPress="return validar(event)"   /></td>
              <td class="style11"><input type="text" name="dias" id="dias" size="5" onKeyUp="sumar();"  onKeyPress="return validar(event)" /></td>
              <td class="style11">
              <input type="text" name="piezas_sol" id="piezas_sol" size="5" class="hidden" />
              <input type="text" name="txtf_sol1" size="5" value="0" readonly onChange="setSur(this.form)" onKeyPress="return validar(event)" />
              </td>
              <td class="style11">
              <input type="text" name="txtf_sur1" size="5" value="0" class="hidden" readonly onChange="setSur(this.form)" onKeyPress="return validar(event)" />
              </td>
              <td class="style11"><div align="center">
                <input name="txtf_cause" type="text" class="style13" onKeyPress="return handleEnter(this, event)" value="<%=cause_jv%>" size="1" onClick="putEmpty()" />
              </div></td>
              <td class="style11">&nbsp;
              <input name="Submit" type="submit" id="capturaid" class="but" value="Capturar" onClick="return verificaN_Fa(document.forms.form);" onChange="setSur(this.form)" />
             	 
	          </td>
            </tr>
            <tr>
              <td class="style11">&nbsp;</td>
              <td colspan="6" class="style11">&nbsp;</td> 
            </tr>
			
            <tr>
              <td class="style11" align="center"><span class="style2">CLAVE</span></td>
              <td class="style11" align="center"><span class="style2">DESCRIPCI&Oacute;N</span></td>
              <td class="style11" align="center"><span class="style2">CANT. SOL</span></td>
              <td width="67" align="center" class="style11"><span class="style2">CANT. SUR </span></td>
              <td class="style11" align="center"><span class="style2">SE SURTI&Oacute;</span></td>
              <td class="style11" align="center"><span class="style2">ORIGEN</span></td>
              <td class="style11">&nbsp;</td>
            </tr>
			 <%
			 int ban_imp=0;
  Connection conn__001 = DriverManager.getConnection("jdbc:mysql://localhost/r_d_c_externa", "root", "eve9397");
  Statement stmt__001 = conn__001.createStatement();
  ResultSet rset__001=stmt__001.executeQuery("select clave,descrip,cant_sol,cant_sur,surtido,id,partida from receta where folio_re='"+foliore_jv+"'");
 
   while(rset__001.next()) 
                  { 
				  ban_imp=1; 
  %>
            <tr>
              <td class="style11" align="center"><span class="style2"><%=rset__001.getString("clave")%></span></td>
              <td class="style11" align="center"><span class="style2"><%=rset__001.getString("descrip")%></span></td>
              <td class="style11" align="center"><span class="style2"><%=rset__001.getString("cant_sol")%></span></td>
              <td class="style11" align="center"><span class="style2"><%=rset__001.getString("cant_sur")%></span></td>
              <td class="style11" align="center"><span class="style2"><%=rset__001.getString("surtido")%></span></td>
			  <td class="style11" align="center"><span class="style2"><%=rset__001.getString("partida")%></span></td>
			  <% 
	  eliminar_jv=rset__001.getString("id");
	  //out.print("valor 1"+eliminar_jv);
	  %>
              <td class="style11" colspan="3"><input  type="button" id="btn_<%=eliminar_jv%>" name="btn_<%=eliminar_jv%>" class="subHeader" value="Eliminar" onclick='location.href="eliminar.jsp?var_radio1=<%=radiopro_jv%>&id_prov=<%=eliminar_jv%>&uni=<%=nom_unidad%>&juris=<%=no_jur%>&nombre=<%=nombre_jv%>&edad=<%=edad_jv%>&folio=<%=folio_jv%>&clave1=<%=clave1_jv%>&descrip1=<%=descrip1_jv%>&present1=<%=present1_jv%>&indica1=<%=indica1_jv%>&sol1=<%=sol1_jv%>&sur1=<%=sur1_jv%>&clave2=<%=clave2_jv%>&descrip2=<%=descrip2_jv%>&present2=<%=present2_jv%>&indica2=<%=indica2_jv%>&sol2=<%=sol2_jv%>&sur2=<%=sur2_jv%>&clave3=<%=clave3_jv%>&descrip3=<%=descrip3_jv%>&present3=<%=present3_jv%>&indica3=<%=indica3_jv%>&sol3=<%=sol3_jv%>&sur3=<%=sur3_jv%>&cause=<%=cause_jv%>&foliore=<%=foliore_jv%>&encar=<%=encar_jv%>&juris1=<%=juris_jv%>&clave_uni=<%=clave_jv%>&univer=<%=uni_jv%>&cedu=<%=cedu_jv%>&nomed=<%=nomed_jv%>&cv_dgo=<%=cv_dgo_jv%>&cv_uni=<%=cv_uni_jv%>&cv_mpio=<%=cv_mpio_jv%>&part=<%=part_jv%>&id_med=<%=id_med_jv%>&day5=<%=t1_jv%>&carnet=<%=carnet_jv%>&day5=<%=t1_jv%>&mes5=<%=t2_jv%>&aa5=<%=t3_jv%>&programa=<%=programa_jv%>"'/>&nbsp;<input  type="button" id="btn_<%=eliminar_jv%>2" name="btn_<%=eliminar_jv%>2" class="subHeader" value="Modificar" onclick='location.href="modificar_new.jsp?radio_pro=<%=radiopro_jv%>&id_prov=<%=eliminar_jv%>&uni=<%=nom_unidad%>&juris=<%=no_jur%>&nombre=<%=nombre_jv%>&edad=<%=edad_jv%>&folio=<%=folio_jv%>&clave1=<%=clave1_jv%>&descrip1=<%=descrip1_jv%>&present1=<%=present1_jv%>&indica1=<%=indica1_jv%>&sol1=<%=sol1_jv%>&sur1=<%=sur1_jv%>&clave2=<%=clave2_jv%>&descrip2=<%=descrip2_jv%>&present2=<%=present2_jv%>&indica2=<%=indica2_jv%>&sol2=<%=sol2_jv%>&sur2=<%=sur2_jv%>&clave3=<%=clave3_jv%>&descrip3=<%=descrip3_jv%>&present3=<%=present3_jv%>&indica3=<%=indica3_jv%>&sol3=<%=sol3_jv%>&sur3=<%=sur3_jv%>&cause=<%=cause_jv%>&foliore=<%=foliore_jv%>&encar=<%=encar_jv%>&juris1=<%=juris_jv%>&clave_uni=<%=clave_jv%>&univer=<%=uni_jv%>&cedu=<%=cedu_jv%>&nomed=<%=nomed_jv%>&cv_dgo=<%=cv_dgo_jv%>&cv_uni=<%=cv_uni_jv%>&cv_mpio=<%=cv_mpio_jv%>&part=<%=part_jv%>&id_med=<%=id_med_jv%>&day5=<%=t1_jv%>&carnet=<%=carnet_jv%>&mes5=<%=t2_jv%>&aa5=<%=t3_jv%>&programa=<%=programa_jv%>"'/></td>
            </tr>
			<%
			}
			%>
            <tr>
              <td height="28" class="style11">&nbsp;</td>
              <td class="style11">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <label>              </label></td>
              <td class="style11">&nbsp;</td>
              <td class="style11">&nbsp;</td>
              <td class="style11">&nbsp;</td>
              <td class="style11">&nbsp;</td>
              <td class="style11">
			  <%
				if (ban_imp==1){
				%>
			  	<input name="Submit" type="submit" class="subHeader" value="Imprimir" />
				<%
				}
				%></td>
            </tr>
          </table></td>
  </tr>
        </tr>
</table>

<p>&nbsp;</p>
</body>

<script>
function sumar() {
    var unidades = document.form.unidades.value;
    if (unidades === "")
        unidades = 0;
    var horas = document.form.horas.value;
    if (horas === "")
        horas = 0;
    var dias = document.form.dias.value;
    if (dias === "")
        dias = 0;
    //alert(horas);
    var hrs = 24 / parseInt(horas);
    //alert(unidades+"-"+hrs+"-"+dias);
    var total = parseInt(unidades) * hrs * parseInt(dias);
    var amp = document.form.cant_disp.value;
	//alert(amp)
    var cajas = total / amp;
	if (isNaN(total)){
		total=0;
		cajas=0;
	}
    document.form.piezas_sol.value = Math.ceil(total);
    document.form.txtf_sol1.value = Math.ceil(cajas);
}
</script>
<script type="text/javascript" src="js/validaciones_receta.js"></script>
</html>

