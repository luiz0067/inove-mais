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
	String CPF= request.getParameter("CPF");
	String rg= request.getParameter("rg");
	String emisor= request.getParameter("emisor");
	String nascimento= request.getParameter("nascimento");
        String endereco= request.getParameter("endereco");
        String numero= request.getParameter("numero");
        String bairro= request.getParameter("bairro");
        String cep= request.getParameter("cep");
        String cidade= request.getParameter("cidade");       
        String estado= request.getParameter("estado");       
        String turma= request.getParameter("turma");       
	String instituicao= request.getParameter("instituicao");        
	String telefone= request.getParameter("telefone");       
	String celular= request.getParameter("celular");       
        String e_mail= request.getParameter("e-mail");       
        String camiseta= request.getParameter("camiseta");       
        String camisete= request.getParameter("camisete");       
        String camisa_p= request.getParameter("camisa_p");       
        String camisa_m= request.getParameter("camisa_m");       
        String camisa_g= request.getParameter("camisa_g"); 
        String camisa_gg= request.getParameter("camisa_gg"); 
        String semanal= request.getParameter("semanal");    
        String mensal= request.getParameter("mensal");    
        String trimestral= request.getParameter("trimestral");                      
        String anual= request.getParameter("anual");       
        String trinta= request.getParameter("trinta");       

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
                    String acc=" Página de Formandos do site <br>\n";
                    acc+="Nome: "+nome+"<br>\n";
                    acc+="CPF: "+CPF+"<br>\n";
                    acc+="RG: "+rg+"<br>\n";
                    acc+="Emisor: "+emisor+"<br>\n";
                    acc+="Data de Nascimento: "+nascimento+"<br>\n";
                    acc+="Endereco: "+endereco+"<br>\n";                    
                    acc+="Número: "+numero+"<br>\n";                    
                    acc+="Bairro: "+bairro+"<br>\n";                    
                    acc+="CEP: "+cep+"<br>\n";                    
                    acc+="Cidade: "+cidade+"<br>\n";                   
                    acc+="Estado: "+estado+"<br>\n";                   
                    acc+="Turma: "+turma+"<br>\n";                   
                    acc+="Instituição de Ensino:"+instituicao+"<br>\n";                   
                    acc+="Telefone: "+telefone+"<br>\n";                    
                    acc+="Celular: "+celular+"<br>\n";                    
                    acc+="Email: "+e_mail+"<br>\n";                    
                    acc+="<br>\n";
                    acc+="Orçar:";
                    acc+="Camiseta: "+camiseta+"<br>\n";
                    acc+="Camisete: "+camisete+"<br>\n";
                    acc+="Camisa P: "+camisa_p+"<br>\n";
                    acc+="Camisa M: "+camisa_m+"<br>\n";
                    acc+="Camisa G: "+camisa_g+"<br>\n";
                    acc+="Camisa GG: "+camisa_gg+"<br>\n";
                    acc+="<br>\n";
                    acc+="Forma de Pagamento:";
                    acc+="Semanal: "+semanal+"<br>\n";
                    acc+="Mensal: "+mensal+"<br>\n";
                    acc+="Trimestral: "+trimestral+"<br>\n";
                    acc+="Anual: "+anual+"<br>\n";
                    acc+="30 + 70%: "+trinta+"<br>\n";

                    
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
<%-- 
    Document   : Formandos
    Created on : 16/08/2012, 09:52:57
    Author     : midiamixdell
--%>
<html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <script>
           
         
        function trocardecor(elemento,cor){
            elemento.style.color=cor;
        }	
        </script>
    <script language="JavaScript" >
        function validaCPF(cpf)   
        {  
          erro = new String;  

            if (cpf.value.length == 11)  
            {     
                    cpf.value = cpf.value.replace('.', '');  
                    cpf.value = cpf.value.replace('.', '');  
                    cpf.value = cpf.value.replace('-', '');  

                    var nonNumbers = /\D/;  

                    if (nonNumbers.test(cpf.value))   
                    {  
                            erro = "A verificacao de CPF suporta apenas números!";   
                    }  
                    else  
                    {  
                    if (cpf.value == "00000000000" ||   
                            cpf.value == "11111111111" ||   
                            cpf.value == "22222222222" ||   
                            cpf.value == "33333333333" ||   
                            cpf.value == "44444444444" ||   
                            cpf.value == "55555555555" ||   
                            cpf.value == "66666666666" ||   
                            cpf.value == "77777777777" ||   
                            cpf.value == "88888888888" ||   
                            cpf.value == "99999999999") {  

                            erro = "Número de CPF inválido!"  
                            }  
                            var a = [];  
                            var b = new Number;  
                            var c = 11;  

                            for (i=0; i<11; i++){  
                                    a[i] = cpf.value.charAt(i);  
                                    if (i < 9) b += (a[i] * --c);  
                            }  

                            if ((x = b % 11) < 2) { a[9] = 0 } else { a[9] = 11-x }  
                            b = 0;  
                            c = 11;  

                            for (y=0; y<10; y++) b += (a[y] * c--);   

                            if ((x = b % 11) < 2) { a[10] = 0; } else { a[10] = 11-x; }  

                            if ((cpf.value.charAt(9) != a[9]) || (cpf.value.charAt(10) != a[10])) {  
                                erro = "Número de CPF inválido.";  
                            }  
                    }  
            }  
            else  
            {  
                if(cpf.value.length == 0)  
                    return false  
                else  
                    erro = "Número de CPF inválido.";  
            }  
            if (erro.length > 0) {  
                    alert(erro);  
                    cpf.focus();  
                    return false;  
            }     
            return true;      
        }  

        //envento onkeyup  
        function maskCPF(CPF) {  
            var evt = window.event;  
            kcode=evt.keyCode;  
            if (kcode == 8) return;  
            if (CPF.value.length == 3) { CPF.value = CPF.value + '.'; }  
            if (CPF.value.length == 7) { CPF.value = CPF.value + '.'; }  
            if (CPF.value.length == 11) { CPF.value = CPF.value + '-'; }  
        }  

        // evento onBlur  
        function formataCPF(CPF)  
        {  
            with (CPF)  
            {  
                value = value.substr(0, 3) + '.' +   
                        value.substr(3, 3) + '.' +   
                        value.substr(6, 3) + '-' +  
                        value.substr(9, 2);  
            }  
        }  
        function retiraFormatacao(CPF)  
        {  
            with (CPF)  
            {  
                value = value.replace (".","");  
                value = value.replace (".","");  
                value = value.replace ("-","");  
                value = value.replace ("/","");  
            }  
        }  
        </script>
        <link rel="stylesheet" href="./css/formandos.css" type="text/css" media="all" />
        <link rel="stylesheet" href="./css/menu.css" type="text/css" media="all" />
        
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
<style>
    input[type=submit].topo, input[type=button], input[type=submit]{
    font-size:12px;
    font-family:Tahoma, Geneva, sans-serif;
    color:#FFFFFF;
    background-color:#FF0000;
    -moz-border-radius: 7px; /* Para Firefox */
    -webkit-border-radius: 7px; /*Para Safari e Chrome */
    border-radius: 7px; /* Para Opera 10.5+*/
    float:left;
    margin-left:20px;
    margin-top:20px;
    padding:4px 10px;
    max-height:30px;
    min-width:70px;
    max-width:70px;
    cursor:pointer;
    border: 0px;
}
    
</style>
</head>
 <body onBlur="javascript:validaCPF(this);">
      <div class="titulo_empresa" style="color:#FF0000; font-size:26px; margin-bottom: 20px; font-family: Trebuchet MS;">
            FORMANDOS
        </div>
            <div class="clear" style="height:10px;"></div>
            <div id="formandos_conteudo">
                <form id="form" name="form" method="post" >
<!--*******************************--*******************************--********************--***************************************-->                   
                    <div class="formandos">
                        <div class="form_formandos" style="float: left; clear: both;">
                            Nome Completo: 
                        </div>
                        <div class="form_formandos" >
                            <input name="nome" style="width:400px;" class="input2" type="text" id="nome" >
                        </div>
                    </div>
<!--*******************************--*******************************--********************--***************************************-->
                    <div class="formandos" style="float: left; clear: both;">
                        <div class="form_formandos" style="clear: both;" >
                            CPF:
                        </div>
                        <div class="form_formandos"  >
                            <input name="CPF" style="width:150px;" class="input2" type="text" value="" id="CPF"  onBlur="javascript:validaCPF(this);">
                        </div>
                    </div>
<!--*******************************--*******************************--********************--***************************************-->
                    <div class="formandos" style="float: left;">
                        <div class="form_formandos"  >
                            RG:
                        </div>
                        <div class="form_formandos"  >
                            <input name="rg" class="input2" type="text" id="rg" style="width:150px;" >
                        </div>
                    </div>
<!--*******************************--*******************************--********************--***************************************-->
                    <div class="formandos" style="float: left; display:block; ">
                        <div class="form_formandos">
                            Emissor:
                        </div>
                        <div class="form_formandos" style="">
                            <input name="emisor" class="input2" type="text" id="emisor" style="width: 88px;">
                        </div>
                    </div>
                    <div class="formandos" style="float: left;">
                        <div class="form_formandos"  >
                            Endereço:
                        </div>
                        <div class="form_formandos" >
                            <input name="endereco" class="input2" type="text" id="endereco" style="width:306px;">
                        </div>
                    </div>
                    <div class="formandos" style="float: left; ">
                        <div class="form_formandos"  >
                            Número:
                        </div>
                        <div class="form_formandos"  >
                            <input name="numero" class="input2" type="text" id="numero" style="width:87px;">
                        </div>
                    </div>
                   
                    <div class="formandos" style="float: left; ">
                        <div class="form_formandos"  >
                            Bairro:
                        </div>
                        <div class="form_formandos" style="" >
                            <input name="bairro" class="input2" type="text" id="bairro" style="width:150px;">
                        </div>
                    </div>
                   
                    <div class="formandos" style="float: left;">
                        <div class="form_formandos" style="display: block; " >
                            Cidade:
                        </div>
                        <div class="form_formandos" >
                            <input name="cidade" style="width:150px;" class="input2" type="text" id="cidade" >
                        </div>
                    </div>
                     <div class="formandos" style="float: left;">
                        <div class="form_formandos"  >
                            Estado:
                        </div>
                        <div class="form_formandos"  >
                            <input name="estado" style="width:87px;" class="input2" type="text" id="estado">
                        </div>
                    </div>
                    <div class="formandos" style="float: left;">
                        <div class="form_formandos" >
                            CEP:
                        </div>
                        <div class="form_formandos" >
                            <input name="cep" style="width:198px;"  class="input2" type="text" id="cep" >
                        </div>
                    </div>
                    <div class="formandos" style="float: left;">
                        <div class="form_formandos"  >
                            Data de Nascimento:
                        </div>
                        <div class="form_formandos" style=" " >
                            <input name="nascimento" style="width:195px;" class="input2" type="text" id="date" >
                        </div>
                    </div>
                    <div class="formandos" style="float: left; ">
                        <div class="form_formandos" >
                            Telefone Fixo:
                        </div>
                        <div class="form_formandos" >
                            <input id="phone" name="telefone"  class="input2" type="text" style=" width:198px;" >
                        </div>
                    </div>
                    <div class="formandos" style="float: left;  ">
                        <div class="form_formandos"  >
                            Celular:
                        </div>
                        <div class="form_formandos" style=" " >
                            <input name="celular" class="input2" type="text" id="cel" style=" width:196px;">
                        </div>
                    </div>
                    <div class="formandos" style="float: left;">
                        <div class="form_formandos" >
                            E-Mail:
                        </div>
                        <div class="form_formandos" style="">
                            <input name="e-mail"  class="input2" type="text" id="e-mail" style="width:399px;" >
                        </div>
                    </div>
<!--*******************************--*******************************--********************--***************************************-->
                    <div class="formandos" style="float: left;">
                        <div class="form_formandos" >
                            Turma:
                        </div>
                        <div class="form_formandos" style=" ">
                            <input name="turma" class="input2" type="text" id="turma"  style="width:399px;">
                        </div>
                    </div>
<!--*******************************--*******************************--********************--***************************************-->
                    <div class="formandos" style="float: left;">
                        <div class="form_formandos" >
                            Instituição de Ensino:
                        </div>
                        <div class="form_formandos" >
                            <input name="instituicao" class="input2" type="text" id="instituicao" style="width:399px;">
                        </div>
                    </div>
<!--*******************************--*******************************--********************--***************************************-->
                    
<!--*******************************--*******************************--********************--***************************************-->
                    <div class="formandos" style=" float: left;">
                        <div  style="  margin-left:2px; float: left;" >
                            <input name="camiseta" class="input" type="checkbox" id="camiseta" size="20">
                         </div>
                        <div   style="float: left; margin-left: 3px; font-family:arial; font-size: 13px;">
                            Camiseta
                        </div>
                    </div>
<!--*******************************--*******************************--********************--***************************************-->
                    <div class="formandos" style="float: left;">
                        <div class="form_formandos" style="  margin-left:7px; float: left;" >
                            <input name="camisete" class="input" type="checkbox" id="camisete" size="20">
                      </div>
                        <div   style=" float: left;  margin-left: 3px; font-family:arial; font-size: 13px;">
                            Camisete:
                        </div>
                        
                    </div>
<!--*******************************--*******************************--********************--***************************************-->
                    <div class="formandos" style="float: left; margin-left:45px;">
                        <div class="form_formandos" style=" margin-left:7px; float: left;" >
                            <input name="camisa_p" class="input" type="checkbox" id="camisa_p" size="20">
                        </div>
                        <div   style=" margin-left:5px; float: left; font-family:arial; font-size: 13px;">
                            P
                        </div>
                    </div>
<!--*******************************--*******************************--********************--***************************************-->
                    <div class="formandos" style="float: left;">
                        <div style=" margin-left:7px;  float: left; " >
                            <input name="camisa_m" class="input" type="checkbox" id="camisa_m" size="20">
                        </div>
                        <div   style=" float: left; margin-left:5px; font-family:arial; font-size: 13px;">
                            M
                        </div>
                        
                    </div>
<!--*******************************--*******************************--********************--***************************************-->
                    <div class="formandos" style="float: left;">
                        <div class="form_formandos" style=" margin-left:7px; float: left;" >
                            <input name="camisa_g" class="input" type="checkbox" id="camisa_g" size="20">
                        </div>
                        <div   style=" float: left; margin-left:5px; font-family:arial; font-size: 13px;">
                            G
                        </div>
                        
                    </div>
                    <div class="formandos" style="float: left;">
                         <div class="form_formandos" style=" margin-left:7px; float: left;" >
                            <input name="camisa_gg" class="input" type="checkbox" id="camisa_gg" size="20">
                        </div>
                        <div  style=" float: left; margin-left:5px; font-family:arial; font-size: 13px;">
                            GG
                        </div>
                       
                    </div>
<!--*******************************--*******************************--********************--***************************************-->
                    <div class="clear" style="height:30px;"></div>
                    <div class="formandos" style="float: left; clear:both;">
                        <div class="form_formandos" style="float: left; clear:both;">
                           Forma de Pagamento:
                        </div>
                    </div>
                    <div class="clear"></div>
                    <div class="formandos" style=" clear:both; float: left; ">
                        <div class="form_formandos" style=" margin-left:2px; float: left;" >
                            <input name="mensal" class="input" type="checkbox" id="Mensal" size="20">
                        </div>
                         <div  style=" float: left; margin-left:5px; font-family:arial; font-size: 13px;">
                            Mensal
                        </div>
                    </div>
                    <div class="formandos" style="float: left;">
                        <div class="form_formandos" style=" margin-left:5px; float: left;" >
                            <input name="trimestral" class="input" type="checkbox" id="Trimestral" size="20">
                        </div>
                         <div  style=" float: left; margin-left:5px; font-family:arial; font-size: 13px;">
                            Trimestral
                        </div>
                    </div>
                    <div class="formandos" style="float: left;">
                       <div class="form_formandos" style=" margin-left:5px; float: left;" >
                            <input name="semestral" class="input" type="checkbox" id="Semestral" size="20">
                        </div>
                        <div  style=" float: left; margin-left:5px; font-family:arial; font-size: 13px;">
                            Semestral
                        </div>
                    </div>
                    <div class="formandos" style="float: left; " >
                        <div class="form_formandos" style=" margin-left:5px; float: left;" >
                            <input name="anual" class="input" type="checkbox" id="Anual" size="20">
                        </div>
                        <div  style=" float: left; margin-left:5px; font-family:arial; font-size: 13px;">
                            Anual
                        </div>
                    </div>
                      <div class="formandos" style="float: left;" >
                        <div class="form_formandos" style=" margin-left:5px; float: left;" >
                            <input name="trinta" class="input" type="checkbox" id="Anual" size="20">
                        </div>
                        <div  style=" float: left; margin-left:5px; font-family:arial; font-size: 13px;">
                            30+70%
                        </div>
                    </div>
                    <div class="formandos" style="float: left; clear: both; ">
                        <div class="form_formandos"  >
                            Observação:
                        </div>
                        <div class="form_formandos" style=" margin-left:7px; margin-top:10px;">
                            <textarea name="menssagem"  class="input2" type="text" id="assunto" style="width:400px;" ></textarea>
                        </div>
                    </div>
                    
<!--*******************************--*******************************--********************--***************************************-->

                 <div id="menus_contato" style="clear: both; margin-left: 30px; margin-top: 30px;">
                            <div class="aproxima" style="float: left; ">
                                <input size="30" name="acao"  type="submit" onmouseover="trocardecor(this,'#000000')" onmouseout="trocardecor(this,'#FFFFFF')" style="  width: 100px; background-color:#FF0000; -moz-border-radius: 10px; -webkit-border-radius: 10px; border-radius: 10px; color:#FFFFFF; cursor:pointer; border: none;" id="Enviar" value="Enviar">
                            </div>
                            <div class="campo_aproxima">
                                <div class="aproxima" style="float: left;">
                                    <input size="30" name="reset"  type="reset" onmouseover="trocardecor(this,'#000000')" onmouseout="trocardecor(this,'#FFFFFF')" style=" background-color:#FF0000;  width: 100px; -moz-border-radius: 10px; -webkit-border-radius: 10px; border-radius: 10px; color:#FFFFFF; cursor:pointer; border: none;" id="reset" value="Limpar">
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
            <div id="imagem_formandos">
                <img src="../imagens/formandos.png" width="172" height="130" border="0"> 
            </div>
    <div class="clear" style="height:30px;"></div>
<!--**************************************************************conteudo_empresa***********************************-->



</body>
</html>
