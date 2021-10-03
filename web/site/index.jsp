<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="BEAN.contagemBEAN"%>
<%@page import="java.util.Date"%>
<%@page import="DAO.contagemDAO"%>
<%@page import="java.io.File"%>
<%@page import="POJO.bannerPOJO"%>
<%@page import="DAO.bannerDAO"%>
<%@page import="BEAN.bannerBEAN"%>
<%@page import="Until.functions"%>
<%@page import="java.util.Vector"%>
<%@page import="BD.Conexao"%>
<%@page import="BD.DadosConexao"%>
<!----------------------------------------------------inicio do home ------------------------------>


<%-- 
    Document   : home.jsp
    Created on : 10/08/2012, 08:23:21
    Author     : midiamixdell
--%>
<center>
<!DOCTYPE html>
<html>
    <head>
      
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="./imagens/imagens_index/miniinove.png" type="image/x-icon" />
        <title>Inove - Home</title>
         <link rel="shortcut icon" href="./imagens/imagens_index/mini_logo.png" type="image/x-icon" />
        <script src="SpryAssets/SpryMenuBar.js" type="text/javascript"></script>
<link href="SpryAssets/SpryMenuBarHorizontal.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="css/geral.css" type="text/css" media="all" />
        <link rel="stylesheet" type="text/css" href="./css/style.css">
        <script type="text/javascript" src="./js/tempo.js"></script>  
        <script type="text/javascript" src="./js/jquery-1.6.1.min.js"></script> 
        <script type="text/javascript" src="./js/jquery.cycle.all.2.72.js"></script> 
        <script type="text/javascript" src="./js/jquery.easing.min.js"></script>
        <script type="text/javascript" src="./js/jquery-ui-1.8.6.custom.min.js"></script>
        <script type="text/javascript" src="./js/ jquery-1.8.0.min.js"></script>
        <script type="text/javascript" src="./js/script.js"></script>
    <script type="text/javascript" src="./js/mascara.js"></script>
        <script src="Scripts/swfobject_modified.js" type="text/javascript"></script>
       <script src="./js/jquery-1.8.0.min.js" type="text/javascript"></script>
    <script src="./js/jquery.maskedinput-1.3.min.js" type="text/javascript"></script>
    <script language="JavaScript" type="text/javascript">
       var $j = jQuery.noConflict();
       jQuery(function($){
       $("#date").mask("99/99/9999");
       $("#phone").mask("(99) 9999-9999");
       $("#cel").mask("(99) 9999-9999");
       $("#tin").mask("99-9999999");
       $("#ssn").mask("999-99-9999");
        });
    </script>
        <script>
           
         
        function trocardecor(elemento,cor){
            elemento.style.color=cor;
        }	
        </script>
        </head>  
      
        <body onload="iniciar();" onload="atualizarDataHora()"> 
            <div id="plano_rodape">
            <center> 
                <div id="plano_de_fundo">
<!--**********************************************************TUDO**************************************************-->
                    <div id="tudo">
<!--**********************************************************TOPO**************************************************-->
                        <div id="topo">
                            <div id="logo">
                                <a href="./index.jsp">
                                <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="177" height="141" id="FlashID" title="logo">
                                  <param name="movie" value="imagens/imagens_index/logo.swf">
                                  <param name="quality" value="high">
                                  <param name="wmode" value="opaque">
                                  <param name="swfversion" value="8.0.35.0">
                                  <!-- This param tag prompts users with Flash Player 6.0 r65 and higher to download the latest version of Flash Player. Delete it if you don’t want users to see the prompt. -->
                                  <param name="expressinstall" value="Scripts/expressInstall.swf">
                                  <!-- Next object tag is for non-IE browsers. So hide it from IE using IECC. -->
                                  <!--[if !IE]>-->
                                  <object type="application/x-shockwave-flash" data="imagens/imagens_index/logo.swf" width="177" height="141">
                                    <!--<![endif]-->
                                    <param name="quality" value="high">
                                    <param name="wmode" value="transparent">
                                    <param name="swfversion" value="8.0.35.0">
                                    <param name="expressinstall" value="Scripts/expressInstall.swf">
                                    <!-- The browser displays the following alternative content for users with Flash Player 6.0 and older. -->
                                    <div>
                                      <h4>Content on this page requires a newer version of Adobe Flash Player.</h4>
                                      <p><a href="http://www.adobe.com/go/getflashplayer"><img src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="Get Adobe Flash player" width="112" height="33" /></a></p>
                                    </div>
                                    <!--[if !IE]>-->
                                  </object>
                                  <!--<![endif]-->
                                </object>
                                </a>
                            </div>
                                <div id="animacao_topo">
                                   <object id="FlashID1" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="551" height="127">
                                      <param name="movie" value="./flash_topo/flashcorreto.swf" />
                                      <param name="quality" value="high" />
                                      <param name="wmode" value="transparent" />
                                      <param name="swfversion" value="7.0.70.0" />
                                      <!-- This param tag prompts users with Flash Player 6.0 r65 and higher to download the latest version of Flash Player. Delete it if you don't want users to see the prompt. -->
                                      <param name="expressinstall" value="Scripts/expressInstall.swf" />
                                      <!-- Next object tag is for non-IE browsers. So hide it from IE using IECC. -->
                                      <!--[if !IE]>-->
                                      <object type="application/x-shockwave-flash" data="./flash_topo/flashcorreto.swf" width="551" height="127">
                                        <!--<![endif]-->
                                        <param name="quality" value="high" />
                                        <param name="wmode" value="transparent" />
                                        <param name="swfversion" value="7.0.70.0" />
                                        <param name="expressinstall" value="Scripts/expressInstall.swf" />
                                        <!-- The browser displays the following alternative content for users with Flash Player 6.0 and older. -->
                                        <div>
                                          <h4>Content on this page requires a newer version of Adobe Flash Player.</h4>
                                          <p><a href="http://www.adobe.com/go/getflashplayer"><img src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="Get Adobe Flash player" width="112" height="33" /></a></p>
                                        </div>
                                        <!--[if !IE]>-->
                                      </object>
                                      <!--<![endif]-->
                                  </object>
                                  <script type="text/javascript">
                                    swfobject.registerObject("FlashID1");
                                    window.onload = function()
                                    {
                                            var lis = document.getElementsByTagName('li');
                                            for(i = 0; i < lis.length; i++)
                                            {
                                                    var li = lis[i];
                                                    if (li.className == 'headlink')
                                                    {
                                                            li.onmouseover = function() { this.getElementsByTagName('ul').item(0).style.display = 'block'; }
                                                            li.onmouseout = function() { this.getElementsByTagName('ul').item(0).style.display = 'none'; }
                                                    }
                                            }
                                    }
                                    	$(document).ready(function(){
		$('li.headlink').hover(
			function() { $('ul', this).css('display', 'block'); },
			function() { $('ul', this).css('display', 'none'); });
	});
	
                                    </script>
		      </div>
                             
                                <div id="menus_topo">
                                    <a href="./index.jsp" >
                                        <div class="menus_home" style="font-family:arial;" onmouseover="trocardecor(this,'#FF0000')" onmouseout="trocardecor(this,'#8C8C8C')">
                                            HOME
                                        </div>
                                    </a>
    <!--&id_paginas=43-->           <a href="?pg=empresa&id_paginas=18" >
                                        <div class="menus" style="font-family: arial;  font-size:14px; " onmouseover="trocardecor(this,'#FF0000')" onmouseout="trocardecor(this,'#8C8C8C')">
                                            EMPRESA
                                        </div>
                                    </a>
                                    <a href="?pg=servicos" >
                                        <div class="menus" style="font-family: arial;  font-size:14px; "  onmouseover="trocardecor(this,'#FF0000')" onmouseout="trocardecor(this,'#8C8C8C')">
                                            SERVIÇOS
                                        </div>
                                    </a>
                                    <ul id="cssdropdown"  style=" float:left;font-size: 14px; height:40px; cursor: pointer; margin-top:15px; font-family: arial; ">
                                        <li class="headlink" style="width: 127px; ">
                                        <a href="?pg=eventos" style="color:#8C8C8C; height:40px; ;"  onmouseover="trocardecor(this,'#FF0000')" onmouseout="trocardecor(this,'#8C8C8C')"> 
                                            EVENTOS
                                        </a>
                                            <ul style="width: 127px; @position:absolute; @margin-left:-95px; @margin-top:10px;">
                                                <li style="color:#8C8C8C;  padding:10px;  font-family: arial; background:#F1EBDF;  font-size:12px; margin-top: 5px;">
                                                    <a href="?pg=eventos_fotos" style="color:#8C8C8C;  border-bottom: 1px solid #8C8C8C;" onmouseover="trocardecor(this,'#FF0000')" onmouseout="trocardecor(this,'#8C8C8C')">
                                                        <div class="menu_linha"  style="padding-top:10px; cursor: pointer; border-top:  1px solid #8C8C8C;">
                                                            GALERIA DE FOTOS
                                                        </div>
                                                    </a>
                                                </li>
                                                <li style="color:#8C8C8C; background: #F1EBDF;  padding:10px; font-family: arial; font-size:12px;">
                                                    <a href="?pg=eventos_videos" style="color:#8C8C8C;" onmouseover="trocardecor(this,'#FF0000')" onmouseout="trocardecor(this,'#8C8C8C')">
                                                        <div class="menu_linha" style=" cursor: pointer;">
                                                            GALERIA DE VÍDEOS
                                                        </div>
                                                    </a>
                                                </li>
                                                <li style="color:#8C8C8C; background: #F1EBDF; border-radius:0 0 10px 10px; -moz-border-radius: 0 0 10px 10px; -webkit-border-radius: 0 0 10px 10px; padding:10px; font-family: arial; font-size:12px;">
                                                    <a href="?pg=agenda" style="color:#8C8C8C;" onmouseover="trocardecor(this,'#FF0000')" onmouseout="trocardecor(this,'#8C8C8C')">
                                                        <div class="menu_linha" style=" cursor: pointer;">
                                                            AGENDA
                                                        </div>
                                                    </a>
                                                </li>
                                            </ul>
                                        </li>     
                                    </ul>
                                    <a href="?pg=formandos" >
                                        <div class="menus_form" style="font-family:arial;  font-size:14px; " onmouseover="trocardecor(this,'#FF0000')" onmouseout="trocardecor(this,'#8C8C8C')">
                                            FORMANDOS
                                        </div>
                                    </a>
                                    <a href="?pg=contato" >
                                        <div class="menus_left" style="font-family:arial;  font-size:14px; " onmouseover="trocardecor(this,'#FF0000')" onmouseout="trocardecor(this,'#8C8C8C')">
                                            CONTATO
                                        </div>
                                    </a>
                                </div>
                            </div>
                                <div class="clear"></div>
                                <div id="data" >
                                    <div id="datahora"></div>
                                </div>

<!--**********************************************************MEIO**************************************************-->       
                        <div id="meio">
<!--**********************************************************CONTEUDO DIREITO**************************************************-->       
                                <div class="clear"></div>
                                <div id="conteudo_direito">
                                    <div class="clear" style="height:68px;"></div>
                                    <div id="mascotes">
                                         <img src="./imagens/imagens_index/mascote.png" width="183" height="173" border="0"/>
                                    </div>
                                    <div class="clear" style="height:30px;"></div>
                                    <div class="fb-like-box fb_iframe_widget" data-href="https://www.facebook.com/pages/I9-/216565158470205" data-width="204" data-height="264" data-show-faces="true" data-stream="false" data-header="false" fb-xfbml-state="rendered"><span style="height: 264px; width: 204px; "><iframe id="f108fc2824" name="f3969e594" scrolling="no" style="border: none; overflow: hidden; height: 264px; width: 204px; " class="fb_ltr" src="http://www.facebook.com/plugins/likebox.php?channel=http%3A%2F%2Fstatic.ak.facebook.com%2Fconnect%2Fxd_arbiter.php%3Fversion%3D11%23cb%3Df1f9109d04%26origin%3Dhttp%253A%252F%252Fwww.inovemais.com%252Ff23ef738c%26domain%3Dwww.inovemais.com%26relation%3Dparent.parent&amp;colorscheme=light&amp;header=false&amp;height=264&amp;href=https%3A%2F%2Fwww.facebook.com%2Fpages%2FI9-%2F216565158470205&amp;locale=pt_BR&amp;sdk=joey&amp;show_faces=true&amp;stream=false&amp;width=204"></iframe></span></div>
                                        <div class="titulo" style="padding-top:25px;">
                                            Depoimentos
                                        </div>
                                     <a href="?pg=depoimentos">
                                        <div class="obs" style="cursor: pointer; margin-left:15px; margin-top:3px; margin-bottom: 10px;">
                                            Todos os depoimentos
                                        </div>
                                    </a>
                                  
                                    <div id="conteudo_depoismento">
                                        <div class="clear"></div>
                                        <strong>“</strong>
                                        A inove, fez
                                        uma festa legal,
                                        e ficou muito boa  
                                        <strong>”</strong>
                                    </div>
                                        <div class="nome">
                                            Gabriela Fagotti - <span>Fasul </span>
                                        </div>
                                        <div id="conteudo_depoismento" style="padding-top: 40px; clear:both;">
                                            <div class="clear"></div>
                                            <strong>“</strong>
                                                A inove, fez
                                                uma festa legal,
                                                e ficou muito boa  
                                            <strong>”</strong>
                                        </div>
                                        <div class="nome">
                                            Gabriela Fagotti - <span>Fasul </span>
                                        </div>
                                </div>
                                
<!--**********************************************************CONTEUDO ESQUERDO**************************************************-->       
                             <%
                            try{
                            String pg =request.getParameter("pg");
                            if((pg!=null)&&(pg.length()!=0)){
                                if(pg.equals("home")){
                                %><%@include file="home.jsp" %><%    
                                }
                                
                                 else if(pg.equals("home")){
                                    %><%@include file="home.jsp" %><%
                                }
                                else if(pg.equals("empresa")){
                                    %><%@include file="empresa.jsp" %><%
                                }
                                else if(pg.equals("servicos")){
                                    %><%@include file="servicos.jsp" %><%
                                }
                                
                                else if(pg.equals("contato")){
                                    %><%@include file="contato.jsp" %><%
                                }
                                else if(pg.equals("eventos")){
                                    %><%@include file="eventos.jsp" %><%
                                }
                                else if(pg.equals("eventos_videos")){
                                    %><%@include file="eventos_videos.jsp" %><%
                                }
                                else if(pg.equals("eventos_fotos")){
                                    %><%@include file="eventos_fotos.jsp" %><%
                                }
                                else if(pg.equals("depoimentos")){
                                    %><%@include file="depoimentos.jsp" %><%
                                }
                                else if(pg.equals("formandos")){
                                    %><%@include file="formandos.jsp" %><%
                                }
                                else if(pg.equals("agenda")){
                                    %><%@include file="agenda.jsp" %><%
                                }
                                else if(pg.equals("sorteio")){
                                    %><%@include file="sorteio.jsp" %><%
                                }
                                else if(pg.equals("sub_servicos_banda")){
                                    %><%@include file="sub_servicos_banda.jsp" %><%
                                } 
                                else if(pg.equals("sub_servicos_buffet")){
                                    %><%@include file="sub_servicos_buffet.jsp" %><%
                                } 
                                else if(pg.equals("sub_servicos_colacao")){
                                    %><%@include file="sub_servicos_colacao.jsp" %><%
                                } 
                                else if(pg.equals("sub_servicos_decoracao")){
                                    %><%@include file="sub_servicos_decoracao.jsp" %><%
                                } 
                                else if(pg.equals("sub_servicos_fotos")){
                                    %><%@include file="sub_servicos_fotos.jsp" %><%
                                } 
                                else if(pg.equals("sub_servicos_iluminacao")){
                                    %><%@include file="sub_servicos_iluminacao.jsp" %><%
                                } 
                                else if(pg.equals("sub_servicos_locacoes")){
                                    %><%@include file="sub_servicos_locacoes.jsp" %><%
                                } 
                                else if(pg.equals("sub_servicos_organizacao")){
                                    %><%@include file="sub_servicos_organizacao.jsp" %><%
                                } 
                                else if(pg.equals("sub_servicos_outros")){
                                    %><%@include file="sub_servicos_outros.jsp" %><%
                                } 
                                else{
                                    %><%@include file="home.jsp" %><%            
                                }
                                
                            }
                            else{
                                %><%@include file="home.jsp" %><%
                            }
                            }
                            catch(Exception erro){

                            }
                            %>
<!--**********************************************************CONTEUDO PRINCIPAL**************************************************-->       
                            
                        </div>
                    </div>
                </div>
            <%@include file="parceiros.jsp" %>
</center>  
      
<!--**********************************************************CONTEUDO BAIXO**************************************************-->       
    
    </body>
</html>
</center>
<%   
            minhaConexao.Fechar();
%>