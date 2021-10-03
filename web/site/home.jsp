<%-- 
    Document   : rodape
    Created on : 14/08/2012, 17:51:45
    Author     : midiamixdell
--%>



<%@page import="BEAN.banner3BEAN"%>
<%@page import="DAO.banner3DAO"%>
<%@page import="Until.fileUpload"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="BEAN.fotosBEAN"%>
<%@page import="DAO.fotosDAO"%>
<%@page import="BEAN.categoriaFotosBEAN"%>
<%@page import="DAO.categoriaFotosDAO"%>
<%@page import="DAO.patrocinadoresDAO"%>
<%@page import="DAO.patrocinadoresDAO"%>
<%@page import="BEAN.patrocinadoresBEAN"%>
<!----------------------------------------------------inicio do titulo ------------------------------>
<%@page import="DAO.banner2DAO"%>
<%@page import="POJO.banner2POJO"%>
<%@page import="BEAN.banner2BEAN"%>
<%@page import="Until.functions"%>
<%@page import="DAO.bannerDAO"%>
<%@page import="BEAN.bannerBEAN"%>
<%@page import="POJO.bannerPOJO"%>
<!----------------------------------------------------inicio do titulo ------------------------------>
<%@page import="java.util.Random"%>
<%@page import="java.util.Vector"%>
<%@page import="DAO.sorteioDAO"%>
<%@page import="BEAN.sorteioBEAN"%>
<%@page import="POJO.sorteioPOJO"%>
<%@page import="BD.Conexao"%>
<%@page import="BD.DadosConexao"%>
<!DOCTYPE html>
<script type="text/javascript" src="./js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="./js/lightbox.js"></script>
<script type="text/javascript" src="./js/jquery-1.6.1.min.js"></script>
<script type="text/javascript" src="./js/jquery.cycle.all.2.72.js"></script>
    
<link href="css/lightbox.css" rel="stylesheet" />

<div id="conteudo_esquerdo">
    <div class="obs">
        <a href="?pg=agenda">Ver agenda completa</a>
    </div>
    <a href="?pg=agenda">
        <div class="calendario" >
             <div class="menus_leteral">
                Agenda
            </div>
        </div>
    </a>
   <script> 
          		
                $(function(){
                        $('#patrocinio').cycle({
                                fx: 'scrollLeft', // choose your transition type, ex: fade, scrollUp, shuffle, etc...
                                
                                speed: 500,
                                timeout: 2000,
                                cleartype: false,
                                pause: true
                        });
                });
    </script>
        <div class="clear" style="height: 40px;"></div>
     
    <div class="publicidade">
        <div id="patrocinio">
           <%
                Conexao minhaConexao=new Conexao(Until.functions.CreateDataConection()); 
                bannerBEAN Banner_BEAN=new bannerBEAN();
                bannerDAO Banner_DAO=new bannerDAO(minhaConexao);
                Vector registros_Banner=new Vector();
                Until.fileUpload request2=new Until.fileUpload();
                request2.setRequest(request);

                String ID=request2.getParameter("id");
                String acao=request2.getParameter("acao");                
                String Src=""; 
                String mensagem_ID="";
                String mensagem_acao="";
                String mensagem_Src="";        
                String acc="";
                try{Banner_BEAN.setid(ID);}catch(Exception erro){mensagem_ID="a foto selecionada não existe";};
                if ((fileUpload.path_upload!=null)&&(fileUpload.path_upload.indexOf("\\")!=-1))
                    acc="\\";
                else
                    acc="/";
                String path=fileUpload.path_upload+acc+"banners";
                if((acao!=null)&&(acao.length()>0)){     
						
                        String Titulo=request2.getParameter("Titulo");
                        String descricao=request2.getParameter("descricao");
      
                            
                    }
                    else{
                        mensagem_ID="";
                        Banner_BEAN.Clear();
                        try{Banner_BEAN.setid(ID);}catch(Exception erro){mensagem_ID=erro.getMessage();}; 
                        mensagem_ID="";
                        try{registros_Banner=Banner_DAO.buscarTodos();}catch(Exception erro){}
                    }
                    
                            if((registros_Banner!=null)&&(registros_Banner.size()>0)){
                                for(int i=0;i<registros_Banner.size();i++){
                                    Banner_BEAN=((bannerBEAN)registros_Banner.get(i));
                        
            %>
    
                <img src="./arquivo.jsp?nome=<%=Banner_BEAN.getsrc()%>&pasta=banners" width="200" height="230" border="0"/>
            <%
                        }
                    }
                   
                %>
        </div>
    </div>
    
    <div class="clear" style="height:90px;"></div>
        <script> 
          		
                $(function(){
                        $('#patrocinio1').cycle({
                                fx: 'scrollLeft', // choose your transition type, ex: fade, scrollUp, shuffle, etc...
                                
                                speed: 500,
                                timeout: 4000,
                                cleartype: false,
                                pause: true
                        });
                });
    </script>
     
    <div class="publicidade">
        <div id="patrocinio1">
           <%

                banner3BEAN banner3_BEAN=new banner3BEAN();
                banner3DAO banner3_DAO=new banner3DAO(minhaConexao);
                Vector registros_banner2=new Vector();

                request2.setRequest(request);

         
                
             
                String mensagem_id="";
                String mensagem_src="";      
          
                if((acao!=null)&&(acao.length()>0)){         
                    }
                    else{
                        mensagem_id="";
                        registros_banner2.clear();
                        registros_banner2=banner3_DAO.buscarTodos();
                        banner3_BEAN.Clear();
                    }
                     if((registros_banner2!=null)&&(registros_banner2.size()>0)){
                        for(int i=0;i<registros_banner2.size();i++){
                        banner3_BEAN=((banner3BEAN)registros_banner2.get(i));
            %>
                <img src="./arquivo.jsp?nome=<%=banner3_BEAN.getsrc()%>&pasta=banner2" width="185" height="262" border="0"/>
           <%
                            }
                        }
                      
                    %>
        </div>
    </div>
</div>
<div id="conteudo_principal">
     <jsp:include page="popup.jsp" />
     <jsp:include page="popup_ingresso.jsp" />
     <div id="wrapper">
         <div>
             <div class="sliderbutton"><img src="./imagens/botoes_slide/botao_esquerdo_over.png" alt="Previous" onclick="slideshow.move(-1)" height="32" width="46" onmouseover="this.src='./imagens/botoes_slide/botao_esquerdo.png';" onmouseout="this.src='./imagens/botoes_slide/botao_esquerdo_over.png';">
               
                 <ul id="pagination" class="pagination">
                     
                     <li class="" onclick="slideshow.pos(0)" ><img src="./imagens/botoes_slide/1_over.png"  onmouseout="this.src='./imagens/botoes_slide/1.png';"  onmouseover="this.src='./imagens/botoes_slide/1_over.png';" ></li>
                     <li class="" onclick="slideshow.pos(1)" ><img src="./imagens/botoes_slide/2_over.png"  onmouseout="this.src='./imagens/botoes_slide/2.png';"  onmouseover="this.src='./imagens/botoes_slide/2_over.png';" ></li>
                     <li class="current" onclick="slideshow.pos(2)" ><img src="./imagens/botoes_slide/3_over.png"  onmouseout="this.src='./imagens/botoes_slide/3.png';"  onmouseover="this.src='./imagens/botoes_slide/3_over.png';" ></li>
                     <li class="" onclick="slideshow.pos(3)" ><img src="./imagens/botoes_slide/4_over.png"  onmouseout="this.src='./imagens/botoes_slide/4.png';"  onmouseover="this.src='./imagens/botoes_slide/4_over.png';" ></li>
                
                 </ul>
             </div>     
                <div style="overflow: hidden;" id="slider">
                    <ul> 
                        <li><img src="./imagens/imagens_slide/casamentos.png" alt="CASAMENTOS" height="300" width="361"></li>
                        <li><img src="./imagens/imagens_slide/festas.png" alt="festas" height="300" width="361"></li>
                        <li><img src="./imagens/imagens_slide/formaturas.png" alt="formaturas" height="300" width="361"></li>
                        <li><img src="./imagens/imagens_slide/foto.png" alt="foto" height="300" width="361"></li>
                    </ul>
                </div>
             <div class="sliderbutton"><img src="./imagens/botoes_slide/botao_direito_over.png" alt="Next" onclick="slideshow.move(1)" height="32" width="46" onmouseover="this.src='./imagens/botoes_slide/botao_direito.png';" onmouseout="this.src='./imagens/botoes_slide/botao_direito_over.png';"></div>
         </div>
     </div>
        <script type="text/javascript">
         var slideshow=new TINY.slider.slide('slideshow',{
                 id:'slider',
                 auto:3,
                 resume:true,
                 vertical:false,
                 navid:'pagination',
                 activeclass:'current',
                 position:0
         });
     </script>
     <div id="conteudo_destaques">
            <div class="titulo">
                Destaques
            </div>
                <script>
                     $(function(){
                             $('#slides').cycle({
                                     fx: 'fade', // choose your transition type, ex: fade, scrollUp, shuffle, etc...
                                     pager:  '#paginador',
                                     speed: 1000,
                                     timeout: 5000,
                                     cleartype: false,
                                     pause: true
                             });
                     });
                 </script>
        <div class="linha">
                <div id="slides">
                    <%

                        sorteioDAO sorteio_DAO=new sorteioDAO(minhaConexao);
                        Conexao conexao= new Conexao(functions.CreateDataConection());
                        banner2BEAN banner2_BEAN=new banner2BEAN();
                        banner2_BEAN.Clear();


                          Vector registrosbanner2=new Vector();
                          banner2DAO banner2_DAO=new banner2DAO(conexao);

                          try{registrosbanner2=banner2_DAO.buscarTodos();}catch(Exception erro){}
                          for(int i=0;i<registrosbanner2.size();i++){
                              banner2_BEAN=((banner2BEAN)registrosbanner2.get(i));
                              if(banner2_BEAN.getidStr()==null)
                                  break;
                              String src=banner2_BEAN.getsrc();
                    %>
                          <img src="./arquivo.jsp?nome=<%=src%>&pasta=banner2" width="461" height="195" alt="1" border="0" />
                    <%
                          }

                    %>
            </div>
            <div style="clear: both;">
              <div id="paginador"></div>
            </div>
        </div>
    </div>       
     <div id="ultimos_eventos">
         <div class="titulo">
             Últimos eventos
         </div>
         <a href="?pg=eventos_fotos">
             <div class="obs" style="margin-left:15px; margin-top:3px; cursor: pointer;">
                 Ver galeria completa
             </div>
         </a>
         <div class="clear"></div>
         <div id="fotos_ultimos_eventos">
             <div id="fotos">
                 <%
    
            try{
                categoriaFotosBEAN categoriaFotos_BEAN=new categoriaFotosBEAN();
                categoriaFotosDAO categoriaFotos_DAO=new categoriaFotosDAO(minhaConexao);
                Vector registros_categoriaFotos = new Vector();
                Vector registros_fotos_categoria=new Vector();
         
                registros_fotos_categoria=categoriaFotos_DAO.buscarTodos();
                String id=request.getParameter("id");
                
                if(id==null){
                    registros_categoriaFotos = categoriaFotos_DAO.buscarUltimasAtualizadas();
                }
                else{
                    try{categoriaFotos_BEAN.setID(id);}catch(Exception erro1){}
                    registros_categoriaFotos.clear();
                    registros_categoriaFotos.add(categoriaFotos_DAO.buscarID(categoriaFotos_BEAN));
                }
                int x=0;
                int limitex=3;
                if((registros_fotos_categoria.size()<3)||(id!=null))
                    limitex=registros_fotos_categoria.size();
                
                while(x<limitex){
                    categoriaFotos_BEAN=((categoriaFotosBEAN)registros_categoriaFotos.get(x));
                    fotosDAO fotos_DAO=new fotosDAO(minhaConexao);
                    Vector registros_fotos=new Vector();
                    registros_fotos=fotos_DAO.buscarPorCategoria(categoriaFotos_BEAN);
                    fotosBEAN fotos_BEAN=new fotosBEAN();
                    
                    
                int y=0;
                int limite=1;
                if((registros_fotos.size()<1)||(id!=null))
                    limite=registros_fotos.size();

                while(y<limite){
                    fotos_BEAN.Clear();
                    fotos_BEAN=((fotosBEAN)registros_fotos.get(y));
                  
                                                                                    
            %>
                <div id="eventos_foto_1">
                    <a href="index.jsp?pg=eventos_fotos&id=<%=categoriaFotos_BEAN.getIDStr()%>">
                        <div class="borda_foto">
                            <img src="./arquivo.jsp?nome=m_<%=fotos_BEAN.getSrc()%>" width="130" height="90" alt="1" border="0" />
                        </div>
                    </a>
                </div>
                
                    
                    
            <%
                
                if((y%2==1)&&(y+1!=limite)){ 
           
            }
                if((x%3==2)&&(x+1!=limitex)){ 
           
            }
            y++;
                   }
       
                            x++;
                        }
                    
                    }
                    
                    catch(Exception erro){
                    }
		%>          
             </div>
         </div>
     </div>
 </div>
                      
<%
    minhaConexao.Fechar();
%>