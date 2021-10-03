<%-- 
    Document   : serviços
    Created on : 16/08/2012, 09:52:57
    Author     : midiamixdell
--%>
<script language="JavaScript" type="text/javascript">
    function mascara(o,f){
        v_obj=o
        v_fun=f
        setTimeout("execmascara()",1)
    }

    function execmascara(){
        v_obj.value=v_fun(v_obj.value)
    }

    function leech(v){
        v=v.replace(/o/gi,"0")
        v=v.replace(/i/gi,"1")
        v=v.replace(/z/gi,"2")
        v=v.replace(/e/gi,"3")
        v=v.replace(/a/gi,"4")
        v=v.replace(/s/gi,"5")
        v=v.replace(/t/gi,"7")
        return v
    }

    function soNumeros(v){
        return v.replace(/\D/g,"")
    }

    function telefone(v){
        v=v.replace(/\D/g,"")                 //Remove tudo o que não é dígito
        v=v.replace(/^(\d\d)(\d)/g,"($1) $2") //Coloca parênteses em volta dos dois primeiros dígitos
        v=v.replace(/(\d{4})(\d)/,"$1-$2")    //Coloca hífen entre o quarto e o quinto dígitos
        return v
    }

    function cpf(v){
        v=v.replace(/\D/g,"")                    //Remove tudo o que não é dígito
        v=v.replace(/(\d{3})(\d)/,"$1.$2")       //Coloca um ponto entre o terceiro e o quarto dígitos
        v=v.replace(/(\d{3})(\d)/,"$1.$2")       //Coloca um ponto entre o terceiro e o quarto dígitos
                                                 //de novo (para o segundo bloco de números)
        v=v.replace(/(\d{3})(\d{1,2})$/,"$1-$2") //Coloca um hífen entre o terceiro e o quarto dígitos
        return v
    }

    function cep(v){
        v=v.replace(/D/g,"")                //Remove tudo o que não é dígito
        v=v.replace(/^(\d{5})(\d)/,"$1-$2") //Esse é tão fácil que não merece explicações
        return v
    }

    function cnpj(v){
        v=v.replace(/\D/g,"")                           //Remove tudo o que não é dígito
        v=v.replace(/^(\d{2})(\d)/,"$1.$2")             //Coloca ponto entre o segundo e o terceiro dígitos
        v=v.replace(/^(\d{2})\.(\d{3})(\d)/,"$1.$2.$3") //Coloca ponto entre o quinto e o sexto dígitos
        v=v.replace(/\.(\d{3})(\d)/,".$1/$2")           //Coloca uma barra entre o oitavo e o nono dígitos
        v=v.replace(/(\d{4})(\d)/,"$1-$2")              //Coloca um hífen depois do bloco de quatro dígitos
        return v
    }

    function romanos(v){
        v=v.toUpperCase()             //Maiúsculas
        v=v.replace(/[^IVXLCDM]/g,"") //Remove tudo o que não for I, V, X, L, C, D ou M
        //Essa é complicada! Copiei daqui: http://www.diveintopython.org/refactoring/refactoring.html
        while(v.replace(/^M{0,4}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})$/,"")!="")
            v=v.replace(/.$/,"")
        return v
    }

    function site(v){
        //Esse sem comentarios para que você entenda sozinho ;-)
        v=v.replace(/^http:\/\/?/,"")
        dominio=v
        caminho=""
        if(v.indexOf("/")>-1)
            dominio=v.split("/")[0]
            caminho=v.replace(/[^\/]*/,"")
        dominio=dominio.replace(/[^\w\.\+-:@]/g,"")
        caminho=caminho.replace(/[^\w\d\+-@:\?&=%\(\)\.]/g,"")
        caminho=caminho.replace(/([\?&])=/,"$1")
        if(caminho!="")dominio=dominio.replace(/\.+$/,"")
        v="http://"+dominio+caminho
        return v
    }

function jumpMenu(url){
    document.getElementById("frame").src = url;    
}
</script>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div id="empresa_formandos">
    <div class="titulo_empresa" style="margin-bottom: 10px;">
        CONTATO
    </div>
    <div id="conteudo_empresa"> 
  
    <div class="links" style="margin-left: 20px; margin-bottom: 14px;">
        <div class="link1"><a href="./index.jsp"> HOME</a> >&nbsp;</div>  <div class="link1"><a href="index.jsp?pg=contato">CONTATO</a> </div> 
        <div class="clear"></div>
    </div>
        <div class="atendimento">
            <div class="titulo_empresa" style="margin-left: 40px; font-size: 20px;">
               ATENDIMENTO
            </div>
            <div id="conteudo_servicos_sub"  style="margin-left: 50px; ">
                 <div class="qrcode">
                    <img src="./imagens/inovecode.png" border="0" width="71" height="71">
                </div>
               	Seg a Sex | 08:30 às 12:00 e 14:00 às 15:30<br>
                ou com horário marcado
               
<br>
<br>
<br>
                Rua Alberto Dalcanale, 951 - Jd. Porto Alegre - CEP: 85902-010  - Toledo - PR
             
            </div>
            <div class="titulo_empresa" style="margin-left: 40px; font-size: 20px; margin-top: 10px;">
               Telefone:
            </div> 
              <div id="conteudo_servicos_sub"  style="margin-left: 50px; ">
                (45) 9951-2266
            </div>
        </div>
        
        
        
        
        
        
<!--**************************************************************conteudo_empresa***********************************-->
    <div id="conteudo_servicos">
       
       
    </div>
        <div id="conteudo_servicos_sub">
            
           
        </div>
        <div class="titulo_contato">
            Selecione o serviço desejado.
        </div>
        <div class="select_contato" style="float: left;">
            <form name="jump">
                <select style="width:200px;" name="menu" onchange="jumpMenu(this.options[this.selectedIndex].value);" value="GO">
                    <option SELECTED value="./contato/geral.jsp">Outros</option>
                    <option value="./contato/formaturas.jsp">Formaturas</option>
                    <option value="./contato/casamentos.jsp">Casamentos/aniversários</option>
                </select>
            </form>
        </div>
    </div>
    

    <div class="clear" style="height:30px;"></div>
<!--**************************************************************conteudo_empresa***********************************-->
<iframe src="./contato/geral.jsp" width="600" height="700"  background-color="transparent" frameborder="0" marginheight="1" marginwidth="1" scrolling="no" name="frame" id="frame" ></iframe>
    </div>
       








