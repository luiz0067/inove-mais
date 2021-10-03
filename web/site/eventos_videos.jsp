<%-- 
    Document   : empresa
    Created on : 16/08/2012, 08:33:40
    Author     : midiamixdell
--%>
<%@page import="BEAN.categoriaVideosBEAN"%>
<%@page import="DAO.categoriaVideosDAO"%>
<%@page import="POJO.videosPOJO"%>
<%@page import="BEAN.videosBEAN"%>
<%@page import="DAO.videosDAO"%>
<%@page import="Until.functions"%>
<%@page import="java.util.Vector"%>
<%@page import="BD.Conexao"%>
<%@page import="BD.DadosConexao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script src="js/jquery-1.7.2.min.js"></script>
<script src="js/lightbox.js"></script>
<link href="css/lightbox.css" rel="stylesheet" />
<div id="empresa">
    <div class="titulo_empresa">
       EVENTOS
    </div>
    <div id="conteudo_empresa"> 
        <div class="links">
            <div class="link1"><a href="./index.jsp"> HOME</a> >&nbsp;</div>  <div class="link1"><a href="index.jsp?pg=eventos">EVENTOS</a> >&nbsp;</div>  <div class="link1"><a href="index.jsp?pg=eventos_videos">VÍDEOS</a></div>
        </div>
<!--**************************************CONTEUDO EMPRESA********************************************************************-->
    </div>
     <%
    
            Conexao conexao=new Conexao(functions.CreateDataConection());
            Conexao minhaConexao=new Conexao(Until.functions.CreateDataConection()); 
            try{
                categoriaVideosBEAN categoriavideos_BEAN=new categoriaVideosBEAN();
                categoriaVideosDAO categoriavideos_DAO=new categoriaVideosDAO(minhaConexao);
                Vector registros_categoriaVideos = new Vector();
                String id=request.getParameter("id");
                if(id==null){
                    registros_categoriaVideos = categoriavideos_DAO.buscarUltimasAtualizadas();
                }
                else{
                    try{categoriavideos_BEAN.setID(id);}catch(Exception erro1){}
                    registros_categoriaVideos.clear();
                    registros_categoriaVideos.add(categoriavideos_DAO.buscarID(categoriavideos_BEAN));
                }
                int x=0;
                while(x<registros_categoriaVideos.size()){
                    categoriavideos_BEAN=((categoriaVideosBEAN)registros_categoriaVideos.get(x));
                    videosDAO videos_DAO=new videosDAO(minhaConexao);
                    Vector registros_videos=new Vector();
                    registros_videos=videos_DAO.buscarPorCategoria(categoriavideos_BEAN);
                    videosBEAN videos_BEAN=new videosBEAN();
                    
                    int y=0;
            %>
     <div id="conteudo_servicos">
        
          <div class="menu_eventos">
            <a href="index.jsp?pg=eventos_videos&id=<%=categoriavideos_BEAN.getIDStr()%>" >
                <div class="texto_menu_eventos">
                          <%=categoriavideos_BEAN.getTitulo()%>
                </div>
            </a>
                 
           <%if((id==null)){%>
            <a href="index.jsp?pg=eventos_videos&id=<%=categoriavideos_BEAN.getIDStr()%>">
                <div class="videos">
                      <img src="./imagens/imagens_index/videos_eventos.png" width="53" height="48" border="0"/>
                   </div>
               <div class="conteudo_menu_eventos">
                   
                   ver galeria
               </div>
            </a>
                  <% }
           else if (id!=null){
            %>  
              <a href="index.jsp?pg=eventos_videos">
                <div class="videos">
                      <img src="./imagens/imagens_index/videos_eventos.png" width="53" height="48" border="0"/>
                   </div>
               <div class="conteudo_menu_eventos">
                   
                   
                   Voltar
               </div>
            </a>
        <%}%>
        </div>
        <div class="fotos_videos">
                <%
                  int limite=2;
                  if((registros_videos.size()<2)||(id!=null))
                      limite=registros_videos.size();

                  while(y<limite){
                      videos_BEAN.Clear();
                      videos_BEAN=((videosBEAN)registros_videos.get(y));                                                
               %>
                <%if((id==null)){%> 
                    <div class="fotos_videos_conteudo1">  
                        <a href="http://www.youtube.com/v/<%=Until.functions.getFile(videos_BEAN.getSrc())%>?version=3&amp;hl=pt_BR" rel="lightbox[roadtrip]" >
                            <object width="250" height="200">
                                <param name="movie" value="http://www.youtube.com/v/<%=Until.functions.getFile(videos_BEAN.getSrc())%>?version=3&amp;hl=pt_BR"></param>
                                <param name="allowFullScreen" value="true"></param>
                                <param name="allowscriptaccess" value="always"></param>
                                <embed src="http://www.youtube.com/v/<%=Until.functions.getFile(videos_BEAN.getSrc())%>?version=3&amp;hl=pt_BR" type="application/x-shockwave-flash" width="250" height="200" allowscriptaccess="always" allowfullscreen="true">
                                </embed>
                            </object>  
                        </a>
                    </div> 
                <%}%>
                <% if (id!=null){ %>  
                    <div class="fotos_videos_conteudo2">  
                        <a href="http://www.youtube.com/v/<%=Until.functions.getFile(videos_BEAN.getSrc())%>?version=3&amp;hl=pt_BR" rel="lightbox[roadtrip]" >
                            <object width="516" height="296">
                                <param name="movie" value="http://www.youtube.com/v/<%=Until.functions.getFile(videos_BEAN.getSrc())%>?version=3&amp;hl=pt_BR"></param>
                                <param name="allowFullScreen" value="true"></param>
                                <param name="allowscriptaccess" value="always"></param>
                                <embed src="http://www.youtube.com/v/<%=Until.functions.getFile(videos_BEAN.getSrc())%>?version=3&amp;hl=pt_BR" type="application/x-shockwave-flash" width="516" height="296" allowscriptaccess="always" allowfullscreen="true">
                                </embed>
                            </object>  
                        </a>
                    </div> 
                <%}%>
                <%       
                if((y%2==1)&&(y+1!=limite)){ 
                %>
                <%
                    }
                    y++;
                }
                %> 
                </div> 
            <%
                       if (id!=null){
            %>  
            <div class="clear" style="height:30px;"></div>
                  <div id="fb-root" style="clear:both;"></div>
            <script>(function(d, s, id) {
              var js, fjs = d.getElementsByTagName(s)[0];
              if (d.getElementById(id)) return;
              js = d.createElement(s); js.id = id;
              js.src = "//connect.facebook.net/pt_BR/all.js#xfbml=1";
              fjs.parentNode.insertBefore(js, fjs);
            }(document, 'script', 'facebook-jssdk'));</script>
            <div class="fb-comments" data-href="http://www.inovemais.com/web/site/?pg=eventos_videos&id_<%=categoriavideos_BEAN.getIDStr()%>" data-num-posts="2" data-width="590"></div>
                <%}%>
        
     </div>
     
               <%
                            x++;
                        }
                    }
                    
                    catch(Exception erro){
                    }
		%>           
                      
</div>




