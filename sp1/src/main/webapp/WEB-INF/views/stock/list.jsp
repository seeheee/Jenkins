<%--
  Created by IntelliJ IDEA.
  User: sehee
  Date: 2021-10-13
  Time: 오후 4:45
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java"  contentType="text/html; charset=UTF-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style>
body {
font-family: Arial, sans-serif;
font-size: 14px;
line-height: 20px;
color: #333333;
}
.graphBox {
    width: 600px;
    height: 600px;
}
table, th, td {
border: solid 1px #000;
padding: 10px;
}

table {
border-collapse:collapse;
caption-side:bottom;
}

caption {
font-size: 16px;
font-weight: bold;
padding-top: 5px;
}
</style>

<a href="/board/list.html">재고교환 페이지로 이동하기</a>
<br>
<%--<%@include file="../includes/header.jsp" %>--%>
<div class="row">
<%--    <div class="col-lg-12">--%>
<%--        <h1 class="page-header">sehee Table</h1>--%>
<%--    </div>--%>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">

            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                <table class="table table-striped table-bordered table-hover">
                    <thead>
                    <tr>
                        <th>번호</th>
                        <th>재고이름</th>
                        <th>재고량</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${list}" var="stock">
                        <tr>
                            <td><c:out value="${stock.inventoryid}" /> </td>
                            <td><c:out value="${stock.inventoryname}" /> </td>
                            <td><c:out value="${stock.quantity}" /> </td>
                        </tr>
                    </c:forEach>
                    <tbody>
                </table>
<%--                <button id='regBtn' type="button" class="btn btn-xs pull-right">새로운 재고 등록하기</button>--%>
            </div>
        </div>
        </div>
    </div>
<br><br>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.5.1/chart.min.js" integrity="sha512-Wt1bJGtlnMtGP0dqNFH1xlkLBNpEodaiQ8ZN5JLA5wpc1sUlk/O5uuOMNgvzddzkpvZ9GLyYNa8w2s7rqiTk5Q==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.5.1/chart.esm.js" integrity="sha512-IPqefcmFCuGcYxl/uIjvyCXwh5T9+EB2MFT7W9RUZd20d7PLfgdT975xdhyesvdXH6Au8SyXOw1236LY1lFl5Q==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.5.1/chart.esm.min.js" integrity="sha512-2Vi/lCX8NaXlAhzc28RAoteYAiJVoz4y3Xq/IpHQCw7KU25I34fDqJSVSUml2tQRVYFnf3IMy6O59zKJh79hiw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.5.1/chart.js" integrity="sha512-b3xr4frvDIeyC3gqR1/iOi6T+m3pLlQyXNuvn5FiRrrKiMUJK3du2QqZbCywH6JxS5EOfW0DY0M6WwdXFbCBLQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.5.1/helpers.esm.js" integrity="sha512-/2SCtwX/TWXQ8kJN8MhCXL5GQJkBhh5J184Uy/totMp+1pFXTQhV/hMMYHuSl+juR5WO9i11AvywRgYFotRIug==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.5.1/helpers.esm.min.js" integrity="sha512-b3xZ1Eh852+/Ltha4XJd59YP2d+I+B6NPdB4H+Wns29GX9x5pLwlp8jnQtJYog3d5Xk1SWvhT2lgJDDBvpV0ow==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>



<div class="graphBox">
<canvas id="myChart" width="100" height="100"></canvas>
</div>

<script>
    var ctx = document.getElementById('myChart').getContext('2d');
    var labels = new Array();
    var data = new Array();
    var line_data = new Array();
    <c:forEach items="${list}" var="stock">
        var json = new Object();
        labels.push("${stock.inventoryname}");
        data.push("${stock.limit}");
    line_data.push("${stock.quantity}")
    </c:forEach>
    var myChart = new Chart(ctx, {
        data: {
            datasets: [{
                type: 'bar',
                label: '재고량',
                data: data,
                borderColor: 'rgb(255, 99, 132)',
                backgroundColor: 'rgba(255, 99, 132, 0.2)'
            }, {
                type: 'line',
                label: '재고한계량',
                data: line_data,
                fill: false,
                borderColor: 'rgb(54, 162, 235)'
            }],
            labels: labels
        },

        // type: 'bar',
        // data: {
        //
        //     labels: labels,
        //     datasets: [{
        //         label: '재고 추이량 그래프',
        //         data: data,
        //         backgroundColor: [
        //             'rgba(255, 99, 132, 0.2)',
        //             'rgba(54, 162, 235, 0.2)',
        //             'rgba(255, 206, 86, 0.2)',
        //             'rgba(75, 192, 192, 0.2)',
        //             'rgba(153, 102, 255, 0.2)',
        //             'rgba(255, 159, 64, 0.2)'
        //         ],
        //         borderColor: [
        //             'rgba(255, 99, 132, 1)',
        //             'rgba(54, 162, 235, 1)',
        //             'rgba(255, 206, 86, 1)',
        //             'rgba(75, 192, 192, 1)',
        //             'rgba(153, 102, 255, 1)',
        //             'rgba(255, 159, 64, 1)'
        //         ],
        //         borderWidth: 1
        //     }]
        // },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
</script>




    <script type="text/javascript">
    $(document).ready(function(){
        var result = '<c:out value="${result}"/> ';
        // checkModal(result);

        // function checkModal(result){
        //     if (result === ''){
        //         return ;
        //     }
        //     if (parseInt(result) > 0){
        //         $(".modal-body").html("게시글 " + parseInt(result) + " 번이 등록되었습니다.");
        //     }
        //     $("#myModal").modal("show");
        // }
        $("#regBtn").on("click", function (){
            self.location = "/board/register";
        });

        var actionForm = $("#actionForm");
        $(".paginate_button a").on("click", function (e){
            e.preventDefault();
            console.log('click');
            actionForm.find("input[name='pageNum']").val($(this).attr("href"));
            actionForm.submit();
        });
    });
</script>