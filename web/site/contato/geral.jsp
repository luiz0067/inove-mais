<%-- 
    Document   : formaturas
    Created on : 17/08/2012, 08:38:47
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
        String endereco= request.getParameter("endereco");
	String fone= request.getParameter("fone");
	String e_mail= request.getParameter("e-mail");
	String cidade= request.getParameter("cidade");
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
                    String acc=" Página de contato do site <br>\n";
                    acc+="Nome: "+nome+"<br>\n";
                    acc+="Endereco: "+endereco+"<br>\n";
                    acc+="Fone: "+fone+"<br>\n";
                    acc+="Email: "+e_mail+"<br>\n";
                    acc+="Cidade: "+cidade+"<br>\n";

                    
                    
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
        <title>Contato</title>
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
        <div class="texto_contato">
            <!--Se tiver texto fora da imagem, ele vem aqui -->
        </div>
        <div id="contato">
             <div class="titulo_empresa" style="color:#FF0000; font-size:26px; margin-bottom: 20px; font-family: Trebuchet MS;">
            GERAL
            </div>
             <div class="clear" style="height:10px;"></div>
            <div id="form_contato">
                <form id="form" name="form" method="post">
                    <div id="formandos_conteudo">
                        <div class="form_titulos" style="margin-left: 5px;" >
                            Nome:
                        </div>
                        <div class="form_formandos"  >
                            <input name="nome" class="input2" type="text" id="nome" style="width: 400px;">
                        </div>
                    </div>
                      <div class="formandos" style="float: left;">
                        <div class="form_formandos"  >
                            Endereço:
                        </div>
                        <div class="form_formandos"  >
                             <input name="endereco" class="input2" type="text" id="endereco" style="width: 400px;">
                        </div>
                    </div>
                    <div class="formandos" style="float: left;">
                        <div class="form_formandos"  >
                            Cidade:
                        </div>
                        <div class="form_formandos">
                            <input name="cidade" class="input" type="text" id="assunto" style="width: 198px;">
                        </div>
                     </div>
                    <div class="formandos" style="float: left;">
                        <div class="form_formandos">
                             Telefone:
                        </div>
                        <div class="form_formandos"  >
                            <input maxlength="14" name="fone" class="input" type="text" id="phone" style="width: 194px;">
                        </div>
                    </div>
                    <div class="formandos" style="float: left;">
                        <div class="form_formandos"  >
                            E-mail:
                        </div>
                        <div class="form_formandos"  >
                            <input name="e-mail" class="input" type="text" id="e-mail" style="width: 400px;">
                        </div>
                    </div>
                    <div class="formandos" style="float: left;">
                        <div class="form_formandos"  >
                             Mensagem:
                        </div>
                        <div class="form_titulos" style="margin-left: 5px;">
                            <textarea name="messagem" style="width: 400px;" id="textarea" class="textarea" style=" text-align: left;"></textarea>
                        </div>	
                    </div>	
                    <div id="menus_contato">
                       
                        <div class="aproxima">
                            <input size="25" name="acao" id="Enviar" value="Enviar" type="submit">
                        </div>
                        <div class="campo_aproxima">
                           
                            <div class="aproxima">
                                <input size="25" name="Enviar" id="Limpar" value="Limpar" type="reset">
                            </div>
                        </div>
                    </div>
                     <div class="campo_aproxima">
                         <div class="aproxima" style="margin-top: 5px;">
                               <%=menssagem%>
                        </div>
                     </div>    
                </form>
            </div>
            </div>
        </div>
    </body>
</html>
