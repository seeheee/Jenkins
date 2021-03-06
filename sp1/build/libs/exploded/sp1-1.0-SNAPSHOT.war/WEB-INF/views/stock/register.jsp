<%--
  Created by IntelliJ IDEA.
  User: sehee
  Date: 2021-10-13
  Time: 오후 4:14
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: hong
  Date: 2021-01-19
  Time: 오후 2:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java"  contentType="text/html; charset=UTF-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@include file="../includes/header.jsp" %>

<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">재고관리</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">

            <!-- /.panel-heading -->
            <div class="panel-body">
                <form role="form" action="/stock/register" method="post">
                    <div class="form-group">
                        <label>inventoryname</label> <input class="form-control" name='inventoryname'>
                    </div>
                    <div class="form-group">
                        <label>limit</label> <input class="form-control" name='limit'>
                    </div>
                    <div class="form-group">
                        <label>quantity</label> <input class="form-control" name='quantity'>
                    </div>
                    <button type="submit" class="btn btn-default">Submit Button</button>
<%--                    <button type="reset" class="btn btn-default">Reset Button</button>--%>
                </form>
            </div>
            <!-- end panel-body -->
        </div>
        <!-- end panel -->
    </div>
</div>
<!-- /.row -->
<%@include file="../includes/footer.jsp" %>

