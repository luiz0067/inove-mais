<%-- 
    Document   : serviços
    Created on : 16/08/2012, 09:52:57
    Author     : midiamixdell
--%>

<%@page import="DAO.fotosPaginasDAO"%>
<%@page import="BEAN.fotosPaginasBEAN"%>
<%@page import="BD.Conexao"%>
<%@page import="java.util.Vector"%>
<%@page import="DAO.conteudoDAO"%>
<%@page import="BEAN.conteudoBEAN"%>
<%@page import="DAO.paginasDAO"%>
<%@page import="BEAN.paginasBEAN"%>
<%@page import="Until.functions"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script src="js/jquery-1.7.2.min.js"></script>
<script src="js/lightbox.js"></script>
<link href="css/lightbox.css" rel="stylesheet" />
<div id="empresa">
    <div class="titulo_empresa">
        SERVIÇOS
    </div>
    <div id="conteudo_empresa"> 
        <div class="links">
            <div class="link1"><a href="./index.jsp"> HOME</a> >&nbsp;</div>  <div class="link1"><a href="index.jsp?pg=servicos">SERVIÇOS</a>>&nbsp;</div>  <div class="link1"><a href="index.jsp?pg=sub_servicos_colacao">COLAÇÃO DE GRAU</a> </div> 
        </div>
        <div class="clear" style="height:20px;"></div>
<!--**************************************************************conteudo_empresa***********************************-->
        <div id="serivicos_lateral">
            <div id="conteudo_foto_servicos_colacao1"> 
                <div class="titulo_foto_servico" style="color:#FFFFFF;">
                    COLAÇÃO DE GRAU
                </div> 
            </div> 
            <div id="orcamento">
                <a href="./orcamento.jsp">  
                    <img src="./imagens/servicos/pena.png" width="36" height="53" border="0"/>
                </a>
                <div class="texto_orcamento">
                    <a href="?pg=contato">SOLICITAR ORÇAMENTO</a>
                </div>
            </div>
        </div>
        <div class="servicos_principal">
        
            

<%
                Conexao minhaConexao=new Conexao(functions.CreateDataConection()); 
                paginasBEAN paginas_BEAN=new paginasBEAN();
                paginasDAO paginas_DAO = new paginasDAO(minhaConexao); 
                try{paginas_BEAN=(paginasBEAN)paginas_DAO.buscarTitulo("colacao").get(0);}catch(Exception erro){};
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
        <div class="texto_sub_categoria">
           <%=conteudo_BEAN.getConteudo()%>  
          
        </div>
<!--**************************************************************conteudo_empresa***********************************-->
     
            <div class="titulo_sub_categoria">
                FOTOS DESSE SERVIÇO
            </div>
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
            <div class="fotos_sub_servicos">
                <div class="borda_sub_servicos">
                    <a href="./arquivo.jsp?nome=h_<%=fotosPaginas_BEAN.getSrc()%>&pasta=conteudo"   rel="lightbox[roadtrip]" title="<%=fotosPaginas_BEAN.getDescricao()%>">
                        <img src="./arquivo.jsp?nome=m_<%=fotosPaginas_BEAN.getSrc()%>&pasta=conteudo" width="67" height="52" alt="1" border="0" />
                    </a>
                </div>
            </div>
            <%
                    }
                }
                minhaConexao.Fechar();
            %>
        </div>
    </div>
</div>
