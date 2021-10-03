<%-- 
    Document   : empresa
    Created on : 16/08/2012, 08:33:40
    Author     : midiamixdell
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="BEAN.fotosServicosBEAN"%>
<%@page import="BEAN.categoriaServicosBEAN"%>
<%@page import="BEAN.fotosServicosBEAN"%>
<%@page import="DAO.categoriaServicosDAO"%>
<%@page import="DAO.fotosServicosDAO"%>
<%@page import="java.util.Vector"%>
<%@page import="Until.functions"%>
<%@page import="BD.Conexao"%>
<%
    try{
        Conexao minhaConexao=null;
        minhaConexao=(Conexao)session.getAttribute("minhaConexao");
        minhaConexao=new Conexao(functions.CreateDataConection());
%>
<!DOCTYPE html>
<script src="js/jquery-1.7.2.min.js"></script>
<script src="js/lightbox.js"></script>
<link href="css/lightbox.css" rel="stylesheet" />
<div id="empresa1">
    <div class="titulo_empresa">
        AGENDA
    </div>
    <div id="conteudo_empresa"> 
        <div class="links">
            <div class="link1"><a href="./index.jsp"> HOME</a> >&nbsp;</div>  <div class="link1"><a href="index.jsp?pg=agenda">AGENDA</a> </div> 
        </div>
    </div> 
<!--**************************************CONTEUDO EMPRESA********************************************************************-->
    <div id="conteudo_empresa">
        <div id="tudo_conteudo_empresa">      
            <div id="conteudo_esquerdo_agenda">
                <div id="moldura_agenda">
                <%
                        categoriaServicosDAO categoriaServicos_DAO=new categoriaServicosDAO(minhaConexao);
                        Vector registros_categorias= new Vector();
                        registros_categorias=categoriaServicos_DAO.buscarOrdemAlfabetica(1,10);
                        categoriaServicosBEAN categoriaServicos_BEAN=new categoriaServicosBEAN();
                        categoriaServicosBEAN acc_categoriaServicos_BEAN=new categoriaServicosBEAN();
                            try{
                            acc_categoriaServicos_BEAN.setID(request.getParameter("id_categoria"));
                        }
                        catch(Exception erro_id_categoria){

                        }   
                        DAO.fotosServicosDAO   fotosServicos_DAO = new DAO.fotosServicosDAO(minhaConexao);
                        Vector registros_Servicos= new Vector();
                        registros_Servicos=fotosServicos_DAO.buscarPorCategoria(acc_categoriaServicos_BEAN);
                        for(int i=0;i<registros_Servicos.size();i++){
                            try{
                                fotosServicosBEAN fotosServicos_BEAN=(fotosServicosBEAN)registros_Servicos.get(i);
                                String id=          functions.removenull(fotosServicos_BEAN.getIDStr());
                                String titulo=      functions.removenull(fotosServicos_BEAN.getTitulo());
                                String src=      functions.removenull(fotosServicos_BEAN.getSrc());
                                String telefone=      functions.removenull(fotosServicos_BEAN.getTelefone());
                                String endereco=      functions.removenull(fotosServicos_BEAN.getEndereco());
                                String email=      functions.removenull(fotosServicos_BEAN.getEmail());
                                String site=      functions.removenull(fotosServicos_BEAN.getSite());
                    %>
                    <A NAME="agenda"></A>
                    <div class="foto_agenda">
                         <a href="./arquivo.jsp?nome=h_<%=src%>&pasta=servicos" rel="lightbox" >
                             <img src="./arquivo.jsp?nome=m_<%=src%>&pasta=servicos" width="173" height="260" border="0"/>
                         </a>
                    </div>
                </div>
                
                <div class="conteudo_agenda" >
           
                   <div class="agenda">
                        <span style="font-size: 14px;">Título:</span> <%=titulo%><br>
                    </div>
                    <div class="agenda">
                        <span style="font-size: 14px;">Data:</span> <%=telefone%><br>
                    </div>
                    <div class="agenda">
                        <span style="font-size: 14px;">Local:</span> <%=endereco%>
                    </div>
                    <div class="agenda">
                        <span style="font-size: 14px;">Valor: </span> <%=site%>
                    </div>
                 <%
            }
            catch(Exception erro_fotos_servicos){}
        } 
        %>
                </div>
                
            </div>
            
            <div id="conteudo_direita_agenda">
                <div class="titulo_agenda">
                    Selecione o Evento desejado: 
                </div>
                <div id="conteudo_principal_agenda">
                    <%
                    for(int i=0;i<registros_categorias.size();i++){
                        try{
                            categoriaServicos_BEAN=(categoriaServicosBEAN)registros_categorias.get(i);
                            String id=          functions.removenull(categoriaServicos_BEAN.getIDStr());
                            String titulo=      functions.removenull(categoriaServicos_BEAN.getTitulo());
                            if (
                                    (
                                        (acc_categoriaServicos_BEAN.getIDStr()!=null)
                                        &&
                                        (acc_categoriaServicos_BEAN.getIDStr().length()!=0)
                                        &&
                                        (acc_categoriaServicos_BEAN.getIDStr().equals(id))
                                    )
                                    ||
                                    (
                                        !(
                                            (acc_categoriaServicos_BEAN.getIDStr()!=null)
                                            &&
                                            (acc_categoriaServicos_BEAN.getIDStr().length()!=0)
                                        )
                                        &&
                                        (i==0)
                                    )
                            ){
                                acc_categoriaServicos_BEAN=categoriaServicos_BEAN;
                            }                                                            
                    %>
                    <div class="agenda">
                        
                        <span style="font-size: 16px;">  </span><a href="?pg=agenda&id_menu=95&id_categoria=<%=id%>#agenda">  <%=titulo%></a>
                    </div>
                     <%
                }
                catch(Exception erro_categoria_servico){} 

            } 
            %>
                </div>
            </div>
        </div>
    </div> 
</div>
<%
    }
    catch(Exception erro_servicos){
    }
%>