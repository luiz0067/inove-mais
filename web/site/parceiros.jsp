<%-- 
    Document   : parceiros
    Created on : 25/09/2012, 09:40:19
    Author     : midiamixdell
--%>

<%@page import="DAO.newsletterDAO"%>
<%@page import="BEAN.newsletterBEAN"%>
<%@page import="DAO.categoriaPatrocinadoresDAO"%>
<%@page import="BEAN.categoriaPatrocinadoresBEAN"%>
<%@page import="BD.Conexao"%>
<%@page import="DAO.patrocinadoresDAO"%>
<%@page import="java.util.Vector"%>
<%@page import="Until.functions"%>
<%@page import="BEAN.patrocinadoresBEAN"%>
<%@page import="BD.Conexao"%>
<%@page import="BD.DadosConexao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script>
           
         
        function trocardecor(elemento,cor){
            elemento.style.color=cor;
        }	
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
        <body  >
        <div class="clear" style="height:20px;"></div>
            <div id="baixo">
                <div id="rodape"> 
                </div>
                    <div id="imagem_rodape">    
                        <div class="parceiros"> 
                        <%
                              Conexao minhaConexao=new Conexao(Until.functions.CreateDataConection()); 
                patrocinadoresBEAN patrocinadores_BEAN=new patrocinadoresBEAN();
                patrocinadoresDAO patrocinadores_DAO=new patrocinadoresDAO(minhaConexao);
                Vector registros_patrocinadores=new Vector();
                Until.functions request2=new Until.functions();
                request2.setRequest(request);

                String ID=request2.getParameter("id");
                String id_categoria=request2.getParameter("id_categoria");
                String acao=request2.getParameter("acao");                
                
                String mensagem_ID="";
                String mensagem_acao="";
                String mensagem_Titulo="";
                String mensagem_descricao="";
                String mensagem_Src="";
                String mensagem_id_categoria="";          
                     
                try{patrocinadores_BEAN.setID(ID);}catch(Exception erro){mensagem_ID="a foto selecionada não existe";};
                try{patrocinadores_BEAN.setId_Categoria(id_categoria);}catch(Exception erro){mensagem_id_categoria=erro.getMessage();}; 
                    
                if((acao!=null)&&(acao.length()>0)){     
						
                        String Titulo=request2.getParameter("Titulo");
                        String descricao=request2.getParameter("descricao");
						
                        try{patrocinadores_BEAN.setTitulo(Titulo);}catch(Exception erro){mensagem_Titulo=erro.getMessage();};
                        try{patrocinadores_BEAN.setDescricao(descricao);}catch(Exception erro){mensagem_descricao=erro.getMessage();}; 
                        
                        if(acao.equals("Salvar")){
                                if (
                                    (mensagem_Titulo.length()==0)
                                    &&
                                    (mensagem_descricao.length()==0)
                                    && 
                                    (mensagem_id_categoria.length()==0)                                                                                                                           
                                ){                             
                                    try{
                                        
                                        
                                        String acc="";
                                        if ((functions.path_upload!=null)&&(functions.path_upload.indexOf("\\")!=-1))
                                            acc="\\";
                                        else
                                            acc="/";
                                        String path=functions.path_upload+acc+"patrocinadores"+acc;
                                        
                                        String Src=request2.upload("Src",path);
                                        functions.redimensionarImagem(path+Src,path+Src,94,143,true);
                                        try{patrocinadores_BEAN.setSrc(Src);}catch(Exception erro){mensagem_Src=erro.getMessage();}; 
                                        if ((ID!=null)&&(ID.length()!=0))
                                            mensagem_Src="";
                                        if(mensagem_Src.length()==0){
                                            patrocinadores_BEAN=patrocinadores_DAO.inserir(patrocinadores_BEAN);
                                        }
                                        else{
                                            functions.deletaImagensRedimencionadas(Src,functions.path_upload);
                                        }
                                        mensagem_acao="Foto salva com sucesso";
                                        mensagem_ID=""; 
                                    }
                                    catch(Exception erro){
                                        mensagem_acao=erro.getMessage();
                                        
                                    }
                                }
                                else
                                    patrocinadores_BEAN.Clear();
                            }                        
                            else if(acao.equals("Excluir")){
                                if (
                                    (mensagem_ID.length()==0)                                                                                  
                                )
                                {
                                    patrocinadores_BEAN=patrocinadores_DAO.excluir(patrocinadores_BEAN,functions.path_upload); 
                                    if((patrocinadores_BEAN!=null)&&(patrocinadores_BEAN.getIDStr()!=null)){
                                        mensagem_acao="Foto excluída com sucesso";
                                    }
                                    else{
                                        mensagem_acao="Foto não encontrada";
                                    }                                    
                                }
                                mensagem_ID=""; 
                                mensagem_Titulo="";
                                mensagem_descricao="";
                                mensagem_Src="";
                                mensagem_id_categoria="";
                                patrocinadores_BEAN.Clear();
                            }
                    }
                    mensagem_ID="";
                    patrocinadores_BEAN.Clear();
                    try{patrocinadores_BEAN.setId_Categoria(id_categoria);}catch(Exception erro){mensagem_id_categoria=erro.getMessage();}; 
                    mensagem_id_categoria="";
                    try{registros_patrocinadores=patrocinadores_DAO.buscarPorCategoria(patrocinadores_BEAN);}catch(Exception erro){}
                         if((registros_patrocinadores!=null)&&(registros_patrocinadores.size()>0)){
                                for(int i=0;i<registros_patrocinadores.size();i++){
                                    patrocinadores_BEAN=((patrocinadoresBEAN)registros_patrocinadores.get(i));
                                    if(patrocinadores_BEAN.getIDStr()==null)
                                        break;
                        %>
            <div class="imagem_parceiros">
                 <a href="./arquivo.jsp?nome=<%=patrocinadores_BEAN.getSrc()%>&pasta=patrocinadores"  rel="lightbox[roadtrip]"><img src="./arquivo.jsp?nome=<%=patrocinadores_BEAN.getSrc()%>&pasta=patrocinadores" width="74" height="48" alt="1" border="0" /></a>
            </div>        
            <%
                  
                    }
                    }
                    
            %>   
            </div>
           <%   

                    newsletterBEAN newsletter_BEAN=new newsletterBEAN();  
                    newsletterDAO newsletter_DAO=new newsletterDAO(minhaConexao);
                    Vector registros_newsletter=new Vector();

                 
                    String nome=request.getParameter("nome");
                    String email=request.getParameter("email");
                    String telefone=request.getParameter("telefone");
                               

                    
                    String mensagem_nome="";
                    String mensagem_email="";
                    String mensagem_telefone="";
                  

                    if((acao!=null)&&(acao.length()>0)){ 
                        boolean valida=true;
                        if(acao.equals("CADASTRAR")){                        
                            try{newsletter_BEAN.setID(ID);}catch(Exception erro){}
                            try{newsletter_BEAN.setNome(nome);}catch(Exception erro){mensagem_nome=erro.getMessage();valida=false;}
                            try{newsletter_BEAN.setEmail(email);}catch(Exception erro){mensagem_email=erro.getMessage();valida=false;}

                            try{
                                if(valida){
                                    newsletter_BEAN=newsletter_DAO.salvar(newsletter_BEAN);
                                    mensagem_acao="Enviado com sucesso";
                                }
                                else
                                    mensagem_acao="Erros nos dados";
                            }catch(Exception erro){mensagem_acao=erro.getMessage();}
                            registros_newsletter.add(newsletter_BEAN);
                        }                                                          
                    }
                    ID=(ID==null)?"":ID;
                    nome=(nome==null)?"":nome;    
                    email=(email==null)?"":email;
                    telefone=(telefone==null)?"":telefone;		
            %>
                   <A NAME="newslatter"></A>
              
            <div class="newslatter" style="margin-left:67px;">
                <form action="" method="post" >
                    <div class="nome_news" style="margin-top:8px;">
                        <input name="nome" class="input4" type="text" id="nome" value="<%=nome%>"  size="30" onfocus="document.getElementById('mensagem_nome').style.display='none';">                
                    </div>
                    <div class="nome_news" style="margin-top:11px;">
                          <input name="email" class="input4" type="text" value="<%=email%>" id="email" size="30">
                    </div>
                    <div class="clear"></div>
                        <div style="margin-left:80px; margin-top: 4px;">
                            <input size="40" name="acao" type="submit" onmouseover="trocardecor(this,'#000000')" onmouseout="trocardecor(this,'#FFFFFF')" style=" background-color:#FF0000; -moz-border-radius: 10px; -webkit-border-radius: 10px; border-radius: 10px; color:#FFFFFF; cursor:pointer; border: none;" onclick="location.href='#newslatter';"  id="Salvar" value="CADASTRAR">
                        </div
                    
                    <div class="clear" style="height:30px;"></div>
                    <p style="color:#000000; clear:both;"><%=mensagem_acao%></p>
                </form>
            </div>
                <div class="clear"></div>
                <div id="tudo_rodape">
                    <div id="final">
                        Inove Produções de Eventos e Formaturas LTDA.<br>
                        Rua Alberto Dalcanale, 951 - Jardim Porto Alegre<br>
                        85906-402 - Toledo<br>
                        45  3252-3768<br>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
