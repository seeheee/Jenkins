<%--
  Created by IntelliJ IDEA.
  User: zerock
  Date: 2021-01-11
  Time: 오후 8:47
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java"  contentType="text/html; charset=UTF-8" pageEncoding="utf-8" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>재고관리</title>
  </head>
  <body>
  <script>
   <c:out value="${stock.inventoryname}"/>
   <c:out value="${stock.limit}"/>
   <c:out value="${stock.quantity}"/>

  </script>
  </body>

  <script type="text/javascript">
    $(document).ready(function(){
      var operForm = $("#operForm");
      $("button[data-oper='modify']").on("click", function (e){
        operForm.attr("action","/board/modify").submit();
      });

      $("button[data-oper='list']").on("click", function (e){
        operForm.find("#bno").remove();
        operForm.attr("action","/board/list")
        operForm.submit();
      });
    });
  </script>

</html>
