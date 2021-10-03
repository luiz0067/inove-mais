<%@page import="Until.functions"%>
<%@page import="BEAN.sorteioBEAN"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String acc="";
    if ((functions.path_upload!=null)&&(functions.path_upload.indexOf("\\")!=-1))
        acc="\\";
    else
        acc="/";
    String path=functions.path_upload+acc+"anuncio"+acc;
    String anuncio_5=path+"anuncio_5.jpg";
    int largura=0;
    try{
        largura=functions.getLarguraImagem(anuncio_5);
    }
    catch(Exception erro){
    }
    sorteioBEAN sorteio_BEAN=new sorteioBEAN();
    if(sorteio_BEAN.getPopup()){
%>
<div style="position:absolute; z-index:999999; width:<%=largura+30%>px;height:435px;background-color:transparent;color:white;margin-left:-30px;_margin-left:;display:block;overflow:hidden;margin-top:30px;_margin-top:10px;" ID="popup">
    <div style="float:left;font-weight:bold;text-align:center;width:100%" >
        <div style="float:right;font-weight:bold;width:30px;background-color:transparent;cursor:pointer; height:30px;overflow:hidden;" onclick="document.getElementById('popup').style.display='none'"><img src="./imgpopup/fechar.png" width="30px" height="30px" align="center"></div>
    </div>
    <div style="height:400px;width:<%=largura%>px;margin-left:auto;margin-right:auto;float:center;text-align:center;">
        <img src="./arquivo.jsp?nome=anuncio_5.jpg&pasta=anuncio" width="<%=largura%>px" height="400px" align="center">
    </div>
</div>
<%  }%>
