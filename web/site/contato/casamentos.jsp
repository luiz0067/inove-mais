<%-- 
    Document   : Formandos
    Created on : 16/08/2012, 09:52:57
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
                    acc+="Fone: "+fone+"<br>\n";
                    acc+="Data Evento: "+data_evento+"<br>\n";
                    acc+="Quantidade de Formandos: "+quantidade+"<br>\n";
                    acc+="Local da Cerimônia: "+local+"<br>\n";
                    acc+="Local da Festa: "+local_festa+"<br>\n";
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
        <title>Casamentos</title>
        <script language="JavaScript" type="text/javascript"> </script>
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
    <div id="contato">
        <div class="titulo_empresa" style="color:#FF0000; font-size:26px; margin-bottom: 20px; font-family: Trebuchet MS;">
            CASAMENTOS/ANIVERSÁRIOS
        </div>
        <div id="conteudo_empresa"> 
    <!--**************************************************************conteudo_empresa***********************************-->
          <form id="form" name="form" method="post" >                   
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
                            <input name="fone"  class="input" type="text" id="phone" style="width: 193px;"   >
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
    <!--*******************************--*******************************--********************--***************************************-->
                    <div id="formandos" style="float: left; margin-top: 5px;">
                       <div class="form_titulos" style="margin-left: 5px; ">
                            Qtd de Convidados:
                        </div>
                        <div class="form_formandos"  >
                            <input name="quantidade" class="input" type="text" id="quantidade" style="width: 195px;">
                        </div>
                    </div>
    <!--*******************************--*******************************--********************--***************************************-->
                    <div class="clear"></div>                
                    <div id="formandos" style="clear: both; ">
                        <div class="form_titulos" style="margin-left: 5px; padding-top: 5px;">
                                Local da Cerimônia:
                            </div>
                            <div class="form_formandos" style="margin-left:px; ">
                                <input name="local" class="input" type="text" id="local" style="width: 400px;">
                            </div>
                    </div>
    <!--*******************************--*******************************--********************--***************************************-->
                   <div id="formandos">
                        <div class="form_titulos" style="margin-left: 5px; padding-top: 5px;">
                            Local da Festa:
                        </div>
                        <div class="form_formandos" style=" ">
                            <input name="local_festa" class="input" type="text" id="local_festa" style="width: 400px;">
                        </div>
                    </div>
                        
    <!--*******************************--*******************************--********************--***************************************-->
                      <div class="formandos" style="float: left; margin-top:20px; display: block; clear: both;">
                            <div class="form_formandos"  >
                                Orçar
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
                            <div class="form_formandos" style="  margin-left:20px; float: left;" >
                                <input name="buffet" class="input" type="checkbox" id="buffet" size="20">
                           </div>
                            <div   style=" float: left;  margin-left: 2px;">
                                Buffet
                            </div>
                        </div>
                        <div class="formandos" style="float: left;">
                            <div class="form_formandos" style=" margin-left:20px;  float: left;" >
                                <input name="assessoria" class="input" type="checkbox" id="assessoria" size="20">
                            </div>
                            <div   style=" float: left;  margin-left: 2px;">
                                Assessoria e Cerimonial
                              
                            </div>
                        </div>
    <!--*******************************--*******************************--********************--***************************************-->
                        <div class="formandos" style="float: left;">
                        <div class="form_formandos" style="  margin-left:7px; float: left;" >
                                <input name="salao" class="input" type="checkbox" id="salao" size="20">
                            </div>
                        <div   style=" float: left;  margin-left: 2px;">
                                Salão
                                </div>
                               
                        </div>
    <!--*******************************--*******************************--********************--***************************************-->
                       
    <!--*******************************--*******************************--********************--***************************************-->
                        
    <!--*******************************--*******************************--********************--***************************************-->
                        <div class="formandos" style="float: left;">
                            <div   style=" float: left;  margin-left: 58px;">
                                <input name="banda" class="input" type="checkbox" id="banda" size="23">
                            </div>
                            <div   style=" float: left;  margin-left: 2px;">
                                Banda
                            </div>
                        </div>
                        <div class="formandos" style="float: left;">
                            <div class="form_formandos" style="  margin-left:15px; float: left;" >
                                <input name="foto" class="input" type="checkbox" id="foto" size="20">
                            </div>
                           <div   style=" float: left;  margin-left: 2px;">
                                Foto e Filmagem
                            </div>   
                        </div>
                        <div class="form_titulos" style="padding-top: 20px; clear:both;">
                        Mensagem:
                        </div>
                        <div class="form_titulos" style="">
                           <textarea name="messagem" id="textarea" class="textarea" style="width: 400px; text-align: left;"></textarea>
                        </div>
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
                     </form>
    <!--*******************************--*******************************--********************--***************************************-->
                  
                
            </div>
            <div class="clear" style="height:30px;"></div>
    <!--**************************************************************conteudo_empresa***********************************-->
        </div>
    </body>
</html>
