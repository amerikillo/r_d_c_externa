<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.text.*" import="java.lang.*" import="java.util.*" import= "javax.swing.*" import="java.io.*" import="java.text.DateFormat" 
import="java.text.ParseException" import="java.text.SimpleDateFormat" import="java.util.Calendar" import="java.util.Date" errorPage="" %>
<%
Class.forName("org.gjt.mm.mysql.Driver");

				  Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/r_d_c_externa", "root", "eve9397");
                  Statement stmt = conn.createStatement();
				  Statement stmt1 = conn.createStatement();
				  Statement stmt2 = conn.createStatement();
				  Statement stmt3 = conn.createStatement();
				  ResultSet rset = null;
				  ResultSet rset1 = null;
				  ResultSet rset3 = null;
				  ResultSet rset4 = null;
				  
				  
String folio_re="",afiliado_jv="",receta1="",folio_re2="",encar_jv="",nom_unidad="",no_jur="",juris_jv="",clave_jv="",cv_dgo_jv="",cv_uni_jv="",cv_mpio_jv="";
try{
        folio_re=request.getParameter("folio");
		receta1=request.getParameter("receta5");
		folio_re2=request.getParameter("folio2");
		nom_unidad=request.getParameter("uni");
		no_jur=request.getParameter("juris");
		encar_jv=request.getParameter("encar");
		juris_jv=request.getParameter("juris1");
		clave_jv=request.getParameter("clave_uni");
		cv_dgo_jv=request.getParameter("cv_dgo");
		cv_uni_jv=request.getParameter("cv_uni");
		cv_mpio_jv=request.getParameter("cv_mpio");
		
	 }catch(Exception e){ System.out.print("Doesn't make the altaOK"); }
//out.print(""+folio_re+receta1);
%>




<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<style type="text/css">
<!--
.style5 {font-family: Arial, Helvetica, sans-serif; font-size: 12; }
.style6 {font-size: 12}
.style7 {	font-size: 12px;
	font-weight: bold;
}
.style8 {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 10px;
}
-->
</style>
</head>

<body>
<table width="384" height="404"  border="3" align="left" cellpadding="2">
  <tr>
    <td width="372" height="92"><table width="370" border="0" cellpadding="2">
      <tr>
        <td width="362" class="style7"><div align="center"><strong><span class="style5">TIENDAS SORIANA  S.A DE C.V. </span></strong><a href="javascript:history.back(1)">*</a></div></td>
      </tr>
      <tr>
        <td class="style7"><div align="center"><strong><span class="style5">AV. HEROICO COLEGIO MILITAR Y AV. 20 DE NOVIEMBRE #109 COL. NUEVA VIZCAYA</span></strong><strong><span class="style5"></span></strong></div></td>
      </tr>
      <tr>
        <td class="style7"><div align="center">DURANGO, DGO C.P. 34080  </div></td>
      </tr>
      
      <tr>
        <td class="style7"><div align="center"><%=nom_unidad%><br />CONSULTA EXTERNA</div></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="158"><table width="370" border="0" cellpadding="2">
      <tr>
        <td width="364"><div align="right" class="style6 style8">FECHA DE RECETA COLECTIVA:&nbsp;&nbsp; &nbsp;  </div></td>
      </tr>
	  <%
	  rset=stmt.executeQuery("select * from receta_colectiva where folio_re='"+folio_re+"' group by folio_re");
 
   while(rset.next()) 
                  { 
				  //afiliado_jv=rset.getString("afiliado");
				  if (afiliado_jv.equals("SP"))
				  {
				  afiliado_jv="SEGURO POPULAR";
				  }else if (afiliado_jv.equals("PA"))
				  {
				  afiliado_jv="POBLACION ABIERTA";
				  } else if (afiliado_jv.equals("OP"))
				  {
				  afiliado_jv="OPORTUNIDADES";
				  }
	  %>
      <tr>
        <td><table width="364" border="0" cellpadding="2">
          <tr>
            <td width="196" class="style8">FOLIO:
              RC-<%=rset.getString("clave_uni")%>&nbsp;-&nbsp;<%=rset.getString("folio_re")%></td>
            <td width="77" class="style8"><%=rset.getString("fecha_re")%></td>
            <td width="71" class="style8">
              <%=rset.getString("hora")%></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td><span class="style8">CLIENTE:
           <%=rset.getString("unidad")%></span></td>
      </tr>
      <tr>
        <td class="style8">SUB-CLIENTE: 
          SERVICIOS DE SALUD DE DURANGO</td>
      </tr>
      <tr>
        <td class="style8">SERVICIO: <%=rset.getString("servicio")%></td>
      </tr>
      
      <tr>
        <td class="style8"><table width="352" border="0" cellpadding="2">
         
         <%
		 }
		 rset4=stmt.executeQuery("select * from receta_colectiva where folio_re='"+folio_re+"' group by fuente");
 
   while(rset4.next()) 
                  { 
		 
		 
		 %>
          
          
          <tr>
            <td width="94" class="style8">PROGRAMA:</td>
            <td width="244" class="style8"><%=rset4.getString("fuente")%></td>
          </tr>
          <tr>
            <td class="style8">SUB-PROGRAMA:</td>
            <td class="style8"><%=rset4.getString("fuente")%></td>
          </tr>
		  <%}%>
        </table></td>
      </tr>

    </table></td>
  </tr>
  <tr>
    <td height="25"><table width="373" border="0" cellpadding="2">
      <tr>
        <td width="258" class="style8">DESCRIPCION</td>
        <td width="52" class="style8"><div align="center">CANTIDAD</div></td>
        <td width="42" class="style8"><div align="center">ORIGEN</div></td>
      </tr>
	  <%
	  rset1=stmt1.executeQuery("select * from receta_colectiva where folio_re='"+folio_re+"'");
 
   while(rset1.next()) 
                  { 
	  %>
      <tr>
        <td height="21" class="style8"><%=rset1.getString("clave")%> - <%=rset1.getString("descrip")%></td>
        <td class="style8" align="center"><%=rset1.getString("cant_sur")%></td>
        <td height="21" class="style8" align="center"><%=rset1.getString("partida")%></td>
      </tr>
      <%}%>

    </table></td>
  </tr>
  
  <tr>
    <td height="66"><table width="369" border="0" cellpadding="2">
      <tr>
        <td width="361"></td>
      </tr>
      <tr>
        <td class="style8">&nbsp;</td>
      </tr>
      <tr>
        <td class="style8"><div align="center">FIRMA DE RECIBIDO </div></td>
      </tr>
      <%
	  rset3=stmt.executeQuery("select * from receta_colectiva where folio_re='"+folio_re+"' group by folio_re");
 
   while(rset3.next()) 
                  { 
				  
	  %>
      
      <tr>
        <td height="22" class="style8">ELABOR� COLECTIVO: 
          <%=rset3.getString("encargado")%></td>
      </tr>
      <tr>
        <td class="style8">FECHA DE IMPRESION: 
          <%=rset3.getString("fecha_re")%>&nbsp;-&nbsp;<%=rset3.getString("hora")%></td>
      </tr>
	  <%}%>
    </table></td>
  </tr>
  
</table>
</body>
</html>
