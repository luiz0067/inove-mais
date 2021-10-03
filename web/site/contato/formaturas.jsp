<%-- 
    Document   : formaturas
    Created on : 27/09/2012, 17:46:23
    Author     : midiamixdell
--%>
      <%@ page import="java.util.Properties"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.io.*"%>
<%@ page import="javax.mail.*"%>
<%@ page import="javax.activation.*"%>
<%@ page import="javax.mail.internet.*"%>
<%@ page import="java.util.Properties"%>
<%@ page import="javax.mail.*"%>
<%@ page import="javax.mail.internet.*"%>
<%
	String nome= request.getParameter("nome");
        String e_mail= request.getParameter("e-mail");
        String cidade= request.getParameter("cidade");
        String endereco= request.getParameter("endereco");
	String fone= request.getParameter("fone");
	String data_evento= request.getParameter("data_evento");
        String quantidade= request.getParameter("quantidade");
        String quantidade_janta= request.getParameter("quantidade_janta");
        String quantidade_baile= request.getParameter("quantidade_baile");
	String local= request.getParameter("local");
	String local_festa= request.getParameter("local_festa");
	String instituicao= request.getParameter("instituicao");
	String decoracao= request.getParameter("decoracao");
	String buffet= request.getParameter("buffet");
	String salao= request.getParameter("salao");
	String assessoria= request.getParameter("assessoria");
	String foto= request.getParameter("foto");
	String banda= request.getParameter("banda");
	String assunto= request.getParameter("assunto");
	String menssagem= request.getParameter("messagem");
	String acao= request.getParameter("acao");
        if((acao!=null)&&(acao.equals("Enviar"))){
            if(
                (e_mail!=null)
                &&
                (
                    (e_mail.indexOf("@")!=-1)
                    &&
                    (e_mail.indexOf(".")!=-1)
                    &&
                    (e_mail.length()!=-1)                
                )
            ){            
                if((acao!=null)&&(acao.equals("Enviar"))){
                    String acc=" Página de casamentos do site <br>\n";
                    acc+="nome: "+nome+"<br>\n";
                    acc+="Email: "+e_mail+"<br>\n";
                    acc+="Cidade: "+cidade+"<br>\n";
                    acc+="Local: "+local+"<br>\n";
                    acc+="Fone: "+fone+"<br>\n";
                    acc+="Data Evento: "+data_evento+"<br>\n";
                    acc+="Quantidade de Formandos: "+quantidade+"<br>\n";
                    acc+="Quantidade Para a Janta: "+quantidade_janta+"<br>\n";
                    acc+="Quantidade Para o Baile: "+quantidade_baile+"<br>\n";
 

                    acc+="<br>\n";
                    acc+="Orçar Também:";
                    acc+="Decoracao: "+decoracao+"<br>\n";
                    acc+="Buffet: "+buffet+"<br>\n";
                    acc+="Salão: "+salao+"<br>\n";
                    acc+="Assessoria e Cerimonial: "+assessoria+"<br>\n";
                    acc+="Foto e Filmagem: "+foto+"<br>\n";
                    acc+="Banda: "+banda+"<br>\n";
                    
 
                    acc+="<br>\n";
                    acc+=menssagem;
                    menssagem=acc;
                    try{
                        String smtphost = "smtp-web.kinghost.net";
                        InternetAddress remetente    = new InternetAddress("inove@inovemais.com"); 
                        InternetAddress destinatario = new InternetAddress("inove@inovemais.com");
                        Properties p = new Properties();
                        p.put ("mail.smtp.host", smtphost);
                        Session email = Session.getInstance(p, null);
                        MimeMessage msg = new MimeMessage(email);
                        msg.setFrom(remetente);
                        msg.setRecipient(Message.RecipientType.TO, destinatario);
                        msg.setSubject(assunto);
                        msg.setContent(menssagem,"text/html");
                        msg.saveChanges();
                        Transport transport = email.getTransport("smtp");
                        transport.connect(smtphost,"");
                        transport.sendMessage(msg, msg.getAllRecipients());
                        transport.close();
                        menssagem="Enviado com sucesso!";
                    }catch(Exception e){
                        menssagem="Falha no envio.";
                    } 
                }
            }
            else{
                menssagem="Email inválido";
            }
        }
        menssagem=(menssagem==null)?"":menssagem;
%>  

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link rel="stylesheet" href="./css/formandos.css" type="text/css" media="all" />
<!-------------------------------------------------Mascara------------------------------------------------------------------->
        <script src="./js/jquery-1.8.0.min.js" type="text/javascript"></script>
        <script src="./js/jquery.maskedinput-1.3.js" type="text/javascript"></script>
        <script src="./js/jquery.maskedinput-1.3.min.js" type="text/javascript"></script>
        <script language="JavaScript" type="text/javascript">
            jQuery(function($){
           $("#date").mask("99/99/9999");
           $("#phone").mask("(99) 9999-9999");
           $("#cel").mask("(99) 9999-9999");
           $("#tin").mask("99-9999999");
           $("#ssn").mask("999-99-9999");
            });
        </script>
<!-------------------------------------------------Mascara------------------------------------------------------------------->
    </head>
    <body>

<div id="conteudo_empresa"> 
  
    
<!--**************************************************************conteudo_empresa***********************************-->
  
        <div id="contato">
            <div class="titulo_empresa" style="color:#FF0000; font-size:26px; margin-bottom: 20px; font-family: Trebuchet MS;">
            FORMATURAS
        </div>
                <form id="form" name="form" method="post">
                     <div id="formandos">
                        <div class="form_titulos" style="margin-left: 5px;">
                            Nome Completo: 
                         </div>
                        <div class="form_formandos"  >
                            <input name="nome"  class="input" type="text" id="nome" style="width: 400px;">
                        </div>
                    </div>
                    <div id="formandos"  style="float: left; margin-top: 5px;">
                        <div class="form_titulos" style="margin-left: 5px;">
                            Cidade:
                          </div>
                        <div class="form_formandos"  >
                            <input name="cidade" class="input" type="text" id="cidade" style="width: 198px;">
                        </div>
                    </div>
                    <div id="formandos" style="float: left; margin-top: 5px;">
                        <div class="form_titulos" style="margin-left: 5px;">
                            Telefone:
                        </div>
                        <div class="form_formandos"  >
                            <input name="fone"  class="input" type="text" id="phone" style="width: 195px;"   >
                        </div>
                    </div>
     <!--*******************************--*******************************--********************--***************************************-->
                    <div id="formandos" style="margin-top: 5px; clear: both;" >
                        <div class="form_titulos" style="margin-left: 5px;">
                            E-Mail:
                         </div>
                        <div class="form_formandos"  >
                            <input name="e-mail"  class="input" type="text" id="telefone" style="width: 400px;" >
                        </div>
                        
                    </div>
<!--*******************************--*******************************--********************--***************************************-->

<!--*******************************--*******************************--********************--***************************************-->
                    <div id="formandos" style="float: left; margin-top: 5px;">
                        <div class="form_titulos" style="margin-left: 5px; ">
                            Data de Evento:
                         </div>
                        <div class="form_formandos"  >
                            <input name="data_evento" class="input" type="text" id="data_evento" style="width: 198px;">
                        </div>
                    </div>
                   <div id="formandos" style="float: left; margin-top: 5px;">
                        <div class="form_titulos" style="margin-left: 5px; ">
                            Local:
                          </div>
                        <div class="form_formandos"  >
                            <input name="local" class="input" type="text" id="local" style="width: 195px;">
                        </div>
                    </div>
<!--*******************************--*******************************--********************--***************************************-->
                    <div id="formandos" style="float: left; margin-top: 5px;">
                        <div class="form_titulos" style="margin-left: 5px; ">
                            Curso:
                          </div>
                        <div class="form_formandos"  >
                            <input name="curso" class="input" type="text" id="curso" style="width: 198px;">
                        </div>
                    </div>
<!--*******************************--*******************************--********************--***************************************-->
                     <div id="formandos" style="float: left; margin-top: 5px;">
                        <div class="form_titulos" style="margin-left: 5px;">
                            Instituição:
                         </div>
                        <div class="form_formandos"  >
                            <input name="instituicao" class="input" type="text" id="instituicao" style="width: 195px;">
                        </div>
                    </div>
<!--*******************************--*******************************--********************--***************************************-->
                    <div id="formandos" style="float: left; font-size: 11px; margin-top: 10px;">
                        <div class="form_titulos" style="margin-left: 5px; ">
                            Quantitade de Formandos:
                          </div>
                        <div class="form_formandos"  >
                            <input name="quantidade" class="input" type="text" id="quantidade" style="width: 130px;">
                        </div>
                    </div>
                   <div id="formandos" style="float: left; font-size: 11px; margin-top: 10px;">
                        <div class="form_titulos" style="margin-left: 5px;">
                            Quantitade Para a Janta:
                         </div>
                        <div class="form_formandos"  >
                            <input name="quantidade_janta" class="input" type="text" id="quantidade" style="width: 130px;">
                        </div>
                    </div>
                   <div id="formandos" style="float: left; font-size: 11px; margin-top: 10px;">
                        <div class="form_titulos" style="margin-left: 5px;">
                            Quantitade Para o Baile:
                          </div>
                        <div class="form_formandos"  >
                            <input name="quantidade_baile" class="input" type="text" id="quantidade" style="width: 124px;">
                        </div>
                    </div>
<!--*******************************--*******************************--********************--***************************************-->
                    <div class="formandos" style="float: left; clear: both; ">
                        <div class="form_formandos"  >
                            Orçar:
                        </div>
                    </div>
                   <div class="formandos" style="float: left; clear: both;">
                        <div class="form_formandos" style="  margin-left:7px; float: left;" >
                            <input name="decoracao" class="input" type="checkbox" id="decoracao" size="20">
                       </div>
                        <div   style=" float: left;  margin-left: 3px;">
                            Decoração
                        </div>
                    </div>
<!--*******************************--*******************************--********************--***************************************-->
                   <div class="formandos" style="float: left;">
                        <div class="form_formandos" style="  margin-left:7px; float: left;" >
                            <input name="buffet" class="input" type="checkbox" id="buffet" size="20">
                        </div>
                        <div   style=" float: left;  margin-left: 3px;">
                            Buffet:
                        </div>
                    </div>
<!--*******************************--*******************************--********************--***************************************-->
                    <div class="formandos" style="float: left;">
                        <div class="form_formandos" style="  margin-left:9px; float: left;" >
                            <input name="assessoria" class="input" type="checkbox" id="assessoria" size="20">
                        </div>
                        <div   style=" float: left;  margin-left: 3px;">
                            Assessoria e Cerimonial:
                        </div>
                    </div>
                    <div class="formandos" style="float: left; clear: both;">
                        <div class="form_formandos" style="  margin-left:7px; float: left;" >
                            <input name="salao" class="input" type="checkbox" id="salao" size="20">
                         </div>
                        <div   style=" float: left;  margin-left: 3px;">
                            Salão:
                        </div>
                        
                    </div>
<!--*******************************--*******************************--********************--***************************************-->
                   
<!--*******************************--*******************************--********************--***************************************-->
 
                   
<!--*******************************--*******************************--********************--***************************************-->
 
                   <div class="formandos" style="float: left;">
                        <div class="form_formandos" style="  margin-left:40px; float: left;" >
                            <input name="banda" class="input" type="checkbox" id="banda" size="20">
                         </div>
                        <div   style=" float: left;  margin-left: 3px;">
                            Banda:
                        </div>
                    </div>
                  <div class="formandos" style="float: left;">
                        <div class="form_formandos" style="  margin-left:5px; float: left;" >
                            <input name="foto" class="input" type="checkbox" id="foto" size="20">
                       </div>
                        <div   style=" float: left;  margin-left: 2px;">
                            Foto e Filmagem:
                        </div>
                       
                    </div>
                    <div class="formandos" style="float: left; ">
                        <div class="form_formandos"  style=" ">
                            Observação
                        </div>
                     <div class="form_titulos" style="">
			<textarea name="messagem" id="textarea" style="width: 400px;" class="textarea" style=" text-align: left;"></textarea>
                     </div>
                    </div>
                   
<!--*******************************--*******************************--********************--***************************************-->
 
<!--*******************************--*******************************--********************--***************************************-->
                     <div id="menus_contato" style="clear: both;">
                            <div class="aproxima">
                                <input size="30" name="acao" type="submit" id="Enviar" value="Enviar">
                            </div>
                            <div class="campo_aproxima">
                                <div class="aproxima">
                                    <input size="30" name="reset" type="reset" id="reset" value="Limpar">
                                </div>
                            </div>
                        </div>
                        <div class="campo_aproxima">
                             <div class="aproxima" style="margin-top: 5px;">
                                   <%=menssagem%>
                            </div>
                         </div>     
<!--*******************************--*******************************--********************--***************************************-->
                </form>
           
        </div>
    <div class="clear" style="height:30px;"></div>
    </body>
</html>
