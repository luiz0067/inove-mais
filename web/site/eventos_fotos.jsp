<%-- 
    Document   : empresa
    Created on : 16/08/2012, 08:33:40
    Author     : midiamixdell
--%>
<%@page import="POJO.categoriaFotosPOJO"%>
<%@page import="Until.functions"%>
<%@page import="BEAN.categoriaFotosBEAN"%>
<%@page import="DAO.categoriaFotosDAO"%>
<%@page import="java.util.Vector"%>
<%@page import="DAO.fotosDAO"%>
<%@page import="BEAN.fotosBEAN"%>
<%@page import="BD.Conexao"%>
<%@page import="BD.DadosConexao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<script src="js/jquery-1.7.2.min.js"></script>
<script src="js/lightbox.js"></script>
<link href="css/lightbox.css" rel="stylesheet" />

    <meta property="fb:admins" content="{100002027841847,100000189195090}"/>
    <meta property="fb:app_id" content="{100002027841847}"/>
</head>
<div id="empresa">
    <div class="titulo_empresa">
       EVENTOS
    </div>
    <div id="conteudo_empresa"> 
        <div class="links">
            <div class="link1"><a href="./index.jsp"> HOME</a> >&nbsp;</div>  <div class="link1"><a href="index.jsp?pg=eventos">EVENTOS</a> >&nbsp;</div>  <div class="link1"><a href="index.jsp?pg=eventos_fotos">FOTOS</a></div>
        </div>
<!--**************************************CONTEUDO EMPRESA********************************************************************-->
    </div>
    <%
    
            Conexao conexao=new Conexao(functions.CreateDataConection());
            Conexao minhaConexao=new Conexao(Until.functions.CreateDataConection()); 
            try{
                categoriaFotosBEAN categoriaFotos_BEAN=new categoriaFotosBEAN();
                categoriaFotosDAO categoriaFotos_DAO=new categoriaFotosDAO(minhaConexao);
                Vector registros_categoriaFotos = new Vector();
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
                while(x<registros_categoriaFotos.size()){
                    categoriaFotos_BEAN=((categoriaFotosBEAN)registros_categoriaFotos.get(x));
                    fotosDAO fotos_DAO=new fotosDAO(minhaConexao);
                    Vector registros_fotos=new Vector();
                    registros_fotos=fotos_DAO.buscarPorCategoria(categoriaFotos_BEAN);
                    fotosBEAN fotos_BEAN=new fotosBEAN();
                    
                    int y=0;
            %>
     <div id="conteudo_servicos">
        
          <div id="arredonda_logo" class="menu_eventos" >
            <a href="index.jsp?pg=eventos_fotos&id=<%=categoriaFotos_BEAN.getIDStr()%>" >
                <div class="texto_menu_eventos">
                          <%=categoriaFotos_BEAN.getTitulo()%>
                </div>
            </a>
                 
           <%if((id==null)){%>
            <a href="index.jsp?pg=eventos_fotos&id=<%=categoriaFotos_BEAN.getIDStr()%>">
                 <div class="videos">
                      <img src="./imagens/imagens_index/fotos_eventos.png" width="53" height="48" border="0"/>
                   </div>
               <div class="conteudo_menu_eventos">
                  
                   
                   ver galeria
               </div>
            </a>
                  <% }
           else if (id!=null){
            %>  
              <a href="index.jsp?pg=eventos_fotos">
                  <div class="videos">
                      <img src="./imagens/imagens_index/fotos_eventos.png" width="53" height="48" border="0"/>
                   </div>
               <div class="conteudo_menu_eventos">
                 
                   
                   Voltar
               </div>
            </a>
           
               <%}%>
          </div>
            <div class="fotos_videos">
              <%
                int limite=6;
                if((registros_fotos.size()<6)||(id!=null))
                    limite=registros_fotos.size();

                while(y<limite){
                    fotos_BEAN.Clear();
                    fotos_BEAN=((fotosBEAN)registros_fotos.get(y));                                                
            %>
            
            <div class="fotos_videos_conteudo">  
                <a href="./arquivo.jsp?nome=h_<%=fotos_BEAN.getSrc()%>" rel="lightbox[<%=categoriaFotos_BEAN.getIDStr()%>]" title="<%=fotos_BEAN.getDescricao()%>">
                        <img src="./arquivo.jsp?nome=m_<%=fotos_BEAN.getSrc()%>" width="78" height="59" border="0"/>                     
                   </a>
            </div>
           
            <%
                       
                if((y%6==5)&&(y+1!=limite)){ 
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
            <div class="fb-comments" data-href="http://www.inovemais.com/web/site/?pg=eventos_fotos&id_<%=categoriaFotos_BEAN.getIDStr()%>" data-num-posts="2" data-width="590"></div>
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

    
    
  
