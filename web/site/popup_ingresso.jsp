 <%@page import="Until.functions"%>
<%@page import="java.util.Vector"%>
<%@page import="DAO.sorteioDAO"%>
<%@page import="BEAN.sorteioBEAN"%>
<%@page import="BD.Conexao"%>
<head>
    <script>
        function trocardecor(elemento,cor){
            elemento.style.color=cor;
        }	
    </script>
</head>
<%   
        Conexao minhaConexao=new Conexao(functions.CreateDataConection());
        sorteioBEAN sorteio_BEAN=new sorteioBEAN();  
        sorteioDAO sorteio_DAO=new sorteioDAO(minhaConexao);
        Vector registros_sorteio=new Vector();

        String ID=request.getParameter("id");
        String nome=request.getParameter("nome");
        String email=request.getParameter("email");
        String telefone=request.getParameter("telefone");
        String acao=request.getParameter("acao");                

        String mensagem_ID="";
        String mensagem_nome="";
        String mensagem_email="";
        String mensagem_telefone="";
        String mensagem_acao="";

        if((acao!=null)&&(acao.length()>0)){ 
            boolean valida=true;
            if(acao.equals("Clique e concorra")){                        
                try{sorteio_BEAN.setID(ID);}catch(Exception erro){}
                try{sorteio_BEAN.setNome(nome);}catch(Exception erro){mensagem_nome=erro.getMessage();valida=false;}
                try{sorteio_BEAN.setEmail(email);}catch(Exception erro){mensagem_email=erro.getMessage();valida=false;}
                try{sorteio_BEAN.setTelefone(telefone);}catch(Exception erro){mensagem_telefone=erro.getMessage();valida=false;}
                try{
                    if(valida){
                        sorteio_BEAN=sorteio_DAO.salvar(sorteio_BEAN);
                        mensagem_acao="Enviado com sucesso";
                    }
                    else
                        mensagem_acao="Erros nos dados";
                }catch(Exception erro){mensagem_acao=erro.getMessage();}
                registros_sorteio.add(sorteio_BEAN);
            }                                                          
        }
        ID=(ID==null)?"":ID;
        nome=(nome==null)?"":nome;    
        email=(email==null)?"":email;
        telefone=(telefone==null)?"":telefone;		
    %>
    <%if(sorteio_BEAN.getSorteio()){%>    
    
    <body>
       <A NAME="ingresso"></A>
    <div style="position:absolute; z-index:5; width:220px;height:400px;background-color:transparent;color:white;margin-left:120px;_margin-left:-440px;display:block;overflow:hidden;margin-top:30px;_margin-top:10px;" ID="popup1">
      <div style="float:left;font-weight:bold;text-align:center;width:100%" >
        <div style="float:right;font-weight:bold;width:30px;background-color:transparent;cursor:pointer; height:30px;overflow:hidden;" onclick="document.getElementById('popup1').style.display='none'"><img src="./imgpopup/fechar.png" width="30px" height="30px" align="center"></div>
    </div>
      <div style="height:400px;width:220pxpx;margin-left:auto;margin-right:auto;float:center;text-align:center;">
    <div class="sorteio">
        <div class="titulo_sorteio">
            <a style="font-size:24px;">SORTEIO</a> <a style="font-size:23px;">DE</a>  <a style="font-size:25px;">INGRESSOS</a>
        </div>
        <div id="foto_sorteio">
            <a href="./arquivo.jsp?nome=anuncio_2.jpg&pasta=anuncio" rel="lightbox">
            <img src="./arquivo.jsp?nome=anuncio_2.jpg&pasta=anuncio" height="120" width="160" border="0"/>
            </a>
        </div>
        <form action="" method="post" >
            <div class="nome_sorteio">
                Nome:
                <div class="borde_soteio">
                    <input name="nome" class="input" type="text" id="nome" size="20" value="<%=mensagem_nome%>"  onfocus="document.getElementById('mensagem_nome').style.display='none';">                 
                </div>
            </div>
            <div class="nome_sorteio" >
                Telefone: 
                <div class="borde_soteio">
                    <input name="telefone" class="input" id="phone" type="text" value="<%=mensagem_telefone%>" id="telefone" size="20" >
                </div>
            </div>
            <div class="nome_sorteio" >
                Email: 
                <div class="borde_soteio">
                    <input name="email" class="input" type="text" value="<%=mensagem_email%>" id="email" size="20">
                </div>
            </div>
            <div style="margin-left:-10px; margin-top:3px;">
                <input size="40" name="acao" type="submit" id="Salvar" onmouseover="trocardecor(this,'#000000')" onmouseout="trocardecor(this,'#FFFFFF')" style=" background-color:#FF0000; -moz-border-radius: 10px; -webkit-border-radius: 10px; border-radius: 10px; color:#FFFFFF; cursor:pointer; border: none;" onclick="location.href='#ingresso';"  value="Clique e concorra">
            </div>
               <p style="color:#000000;"><%=mensagem_acao%></p>
        </form>
        
    </div>
        <%
            }
        %>
    </div>
</div>
</body>