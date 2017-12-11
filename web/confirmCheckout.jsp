<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            .btnLogin {
                background-color: #DDDDDD;
                border-radius: 6%;
            }
            html{
                margin: 0;
                padding: 0;
                height: 90%;
                width:100%;
                font-family: Times New Roman;
                zoom:100%;
            }
            body{
                background: url("/PetsDaNang/images/giaodien-admin.jpg");
                background-position: center;
                background-repeat: no-repeat;
                background-size: cover;
            }
            
            .main{
                text-align: center;
            }
            .list_Product{
                width:100%;
                height:300px;
                background: white;
                box-shadow: 2px 2px 2px 2px grey;
                float:left;
                margin-right: 10px;
            }
            h1{
                margin-left: 100px;
                float:left;
            }
            
            #singlebutton{
                margin-left: -160px;
                clear:both;
            }
            .h1_them{
                margin-left:140px;
            }
            .height{
                width:250px;
            }
            .danhmuc{
                height: 34px; 
            }
            .name_product{
                font-weight: bold;
            }
            .message{
                float:left;
                color:blue;
                padding-top: 11px;
            }
            .submit{
                margin-top: 10px;   
            }
            span{
                font-size: 18px;
            }
            th{
                color: blue;
            }
        </style>
    </head>
    <body>
        <c:import url="/includes/headerUser.jsp"/>
        <div id="mainBody">
            <div class="container">
                <div class="row">
                    <div class="span9">
                        <ul class="breadcrumb">
                            <li><a href="HomeServlet">Trang chủ</a> <span class="divider"></span></li>
                            <li class="active">giỏ hàng</li>
                        </ul>
                        <h3>  GIỎ HÀNG</h3>	
                        <hr class="soft"/>        
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>Sản phẩm</th>
                                    <th>Tên sản phẩm</th>
                                    <th>Số lượng</th>
                                    <th>Giá</th>
                                    <th>Thành tiền</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="item" items="${cart.items}">
                                    <tr>
                                        <td> 
                                            <img width="60" src="images/${item.product.image}" alt="xxx"/>
                                        </td>
                                        <td>
                                            <br><span>${item.product.productName}</span>
                                        </td>
                                        <td>
                                            <input type="hidden" name="productID" value="${item.product.productID}">
                                            <input type="hidden" name="action" value="update">
                                            <br><span>${item.quantity}</span>
                                        </td> 
                                        <td>
                                            <br><span>${item.product.price}</span>
                                        </td>
                                        <td>
                                            <br><span>${item.totalFormatted}</span>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                           
                            
                        </table>
                        <h4 style="float: right">Tổng tiền: ${order.invoiceTotal} VND</h2>
                        
                        <button id="singlebutton" style="float:right;" name="singlebutton" class="btn btn-primary"><a href="cartServlet?action=checkout" style="text-decoration: none;color: white;">Đặt hàng</a></button>
                        <h5>${message}</h5>
                    </div>
                </div>
            </div>
        </div>
        <a target="_blank" href="https://www.nganluong.vn/button_payment.php?receiver=lequangtin95@gmail.com&product_name='.$id_order.'&price='.$_SESSION['tongtien'].'&return_url=index.php?url=success_pay&comments=Comments"><img src="https://www.nganluong.vn/css/newhome/img/button/pay-lg.png"border="0" /></a>
    </body>
</html>