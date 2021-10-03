<%-- 
    Document   : empresa
    Created on : 16/08/2012, 08:33:40
    Author     : midiamixdell
--%>
<%@page import="POJO.fotosPaginasPOJO"%>
<%@page import="DAO.fotosPaginasDAO"%>
<%@page import="BEAN.fotosPaginasBEAN"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Until.functions"%>
<%@page import="DAO.conteudoDAO"%>
<%@page import="BEAN.conteudoBEAN"%>
<%@page import="DAO.paginasDAO"%>
<%@page import="java.util.Vector"%>
<%@page import="BEAN.paginasBEAN"%>
<%@page import="BD.Conexao"%>
<!DOCTYPE html>
<link href="css/lightbox.css" rel="stylesheet" />
<script src="js/jquery-1.7.2.min.js"></script>
<script src="js/lightbox.js"></script>
<div id="empresa">
    <div class="titulo_empresa">
        EMPRESA
    </div>
    <div id="conteudo_empresa"> 
        <div class="links">
            <div class="link1"><a href="./index.jsp"> HOME</a> >&nbsp;</div>  <div class="link1"><a href="index.jsp?pg=empresa">EMPRESA</a> </div> 
        </div>
        <div class="clear" style="height:15px;"></div>
<!--**************************************CONTEUDO EMPRESA********************************************************************-->
            <%
                Conexao minhaConexao=new Conexao(functions.CreateDataConection()); 
                paginasBEAN paginas_BEAN=new paginasBEAN();
                paginasDAO paginas_DAO = new paginasDAO(minhaConexao); 
                try{paginas_BEAN=(paginasBEAN)paginas_DAO.buscarTitulo("empresa").get(0);}catch(Exception erro){};
                conteudoBEAN conteudo_BEAN=new conteudoBEAN();
                try{conteudo_BEAN.setId_paginas(paginas_BEAN.getIDStr());}catch(Exception erro){}
                conteudoDAO conteudo_dao=new conteudoDAO(minhaConexao);
                Vector registros_conteudo=new Vector();
                try{registros_conteudo=conteudo_dao.buscarUltimasPaginas(conteudo_BEAN);}catch(Exception erro){}
                if (registros_conteudo.size()>=1){
                    try{ conteudo_BEAN=(conteudoBEAN)registros_conteudo.get(0);}catch(Exception erro){}
                }
                Until.functions request2=new Until.functions();
                request2.setRequest(request); 
                String acao=request2.getParameter("acao");
                String mensagem_acao="";
                String mensagem_Src="";
                String mensagem_Titulo="";
                String mensagem_Conteudo="";
            %>
        <div>
            <%=conteudo_BEAN.getConteudo()%>
        </div>
    </div>
    <div id="empresa_fotos">
        Fotos
    </div>
    <div id="empresa_fotos_conteudo">
        <%
      
                fotosPaginasBEAN fotosPaginas_BEAN=new fotosPaginasBEAN();
                fotosPaginasDAO fotosPaginas_DAO=new fotosPaginasDAO(minhaConexao);
                Vector registros_fotosPaginas=new Vector();

                request2.setRequest(request);

                String ID=request2.getParameter("id");
                String id_paginas=request2.getParameter("id_paginas");
               
                
                String mensagem_ID="";
   
                String mensagem_descricao="";
  
                String mensagem_id_paginas="";          
                  
                if (id_paginas==null)
                    id_paginas=request.getParameter("id_paginas");
                
                try{fotosPaginas_BEAN.setID(ID);}catch(Exception erro){mensagem_ID="a foto selecionada não existe";};
                try{fotosPaginas_BEAN.setId_Paginas(id_paginas);}catch(Exception erro){mensagem_id_paginas=erro.getMessage();}; 
                if((acao!=null)&&(acao.length()>0)){ 
                        String Titulo=request2.getParameter("Titulo");
                        String descricao=request2.getParameter("descricao");
						
                        try{fotosPaginas_BEAN.setTitulo(Titulo);}catch(Exception erro){mensagem_Titulo=erro.getMessage();};
                        try{fotosPaginas_BEAN.setDescricao(descricao);}catch(Exception erro){mensagem_descricao=erro.getMessage();}; 

                    }
                    else{
                        mensagem_ID="";
                        fotosPaginas_BEAN.Clear();
                        try{fotosPaginas_BEAN.setId_Paginas(id_paginas);}catch(Exception erro){mensagem_id_paginas=erro.getMessage();}; 
                        mensagem_id_paginas="";
                        try{registros_fotosPaginas=fotosPaginas_DAO.buscarPorPagina(fotosPaginas_BEAN);}catch(Exception erro){}
                    }
                    if((registros_fotosPaginas!=null)&&(registros_fotosPaginas.size()>0)){
                        for(int i=0;i<registros_fotosPaginas.size();i++){
                            fotosPaginas_BEAN=((fotosPaginasBEAN)registros_fotosPaginas.get(i));
                            if(fotosPaginas_BEAN.getIDStr()==null)
                                break;
                        %>
        <div class="empresa_album_fotos">
            <a href="./arquivo.jsp?nome=h_<%=fotosPaginas_BEAN.getSrc()%>&pasta=conteudo"   rel="lightbox[roadtrip]" title="<%=fotosPaginas_BEAN.getDescricao()%>">
             <img src="./arquivo.jsp?nome=h_<%=fotosPaginas_BEAN.getSrc()%>&pasta=conteudo"  width="88" height="77" alt="1" border="0" />
        </div>  
             <%
                                }
                            }
                            minhaConexao.Fechar();
                        %>
            
    </div>
</div>
