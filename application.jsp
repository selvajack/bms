<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%
    long ts = (new Date()).getTime();
%>
<fmt:setLocale value="en"/>
<fmt:setBundle basename="client" var="clientrb" scope="session"/>
<fmt:message bundle='${clientrb}' key='SERVER_URL' var="serverURL" scope="session"/>
<fmt:message bundle='${clientrb}' key='CLIENT_URL' var="clientURL" scope="session"/>
<c:set var="bmsLoggedInUserName" value="${bmsLoggedInUserName}" scope="session"/>
<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta http-equiv="expires" content="0" />
        <meta http-equiv="cache-control" content="no-cache, no-store, must-revalidate, max-age=0" />
        <meta http-equiv="pragma" content="no-cache" />
        <meta http-equiv="Content-type" content="text/html; charset=UTF-8" />
        <link rel="icon" type="image/png" href="WebClient/common/assets/favicon.ico">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />
        <link href="WebClient/assets/css/bootstrap.css" rel="stylesheet" />
        <link href="WebClient/assets/css/fresh-bootstrap-table.css" rel="stylesheet" />
        <link href="WebClient/assets/css/demo.css" rel="stylesheet" />
        <!--     Fonts and icons     -->
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
        <script type="text/javascript" src="WebClient/assets/js/jquery-1.11.2.min.js"></script>
        <script type="text/javascript" src="WebClient/assets/js/bootstrap.js"></script>
        <script type="text/javascript" src="WebClient/assets/js/bootstrap-table.js"></script>
        <!--  Just for demo purpose, do not include in your project     -->
        <script type="text/javascript" src="WebClient/assets/js/demo/gsdk-switch.js"></script>
        <script type="text/javascript" src="WebClient/assets/js/demo/jquery.sharrre.js"></script>
        <script type="text/javascript" src="WebClient/assets/js/demo/demo.js"></script>
        <link rel="stylesheet" href="WebClient/assets/css/w3.css">
        <link rel="stylesheet" href="WebClient/assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="WebClient/assets/css/animate.css">
        <!--old admin files-->
        <link href="WebClient/assets/css/main.css" rel="stylesheet" media="screen">
        <link href="WebClient/assets/fonts/icomoon/icomoon.css" rel="stylesheet">
        <link href="WebClient/assets/css/c3/c3.css" rel="stylesheet" rel="stylesheet">
        <link href="WebClient/assets/css/circliful/circliful.css" rel="stylesheet">

        <script type="text/javascript">
            var serverURL = "<fmt:message bundle='${clientrb}' key='SERVER_URL'/>";
            var clientURL = "<fmt:message bundle='${clientrb}' key='CLIENT_URL'/>";
            var infoLabel = "<fmt:message bundle='${clientrb}' key='INFO_TITLE'/>";
            var noOfRetries = 0;

            $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI).ajaxError($.unblockUI);
        </script>
    </head>
    <style>
        .tab-content {
            padding: 15px;
            border: #262626;
            border-top: 0;
            background: #262626; 
        }
        .top-bar {
            margin: 0;
            padding: 4px 32px;
            background-color: rgba(255,255,255,.15);
            background-image: -webkit-gradient(linear,0 0,0 100%,from(#0c1013),color-stop(85%,#272622),to(#191818));
            background-image: -webkit-linear-gradient(#2d85be,#3693cf 85%,#1f5a80);
            background-image: -moz-linear-gradient(top,#2d85be,#3693cf 85%,#1f5a80);
            background-image: -o-linear-gradient(#2d85be,#3693cf 85%,#1f5a80);
            background-image: linear-gradient(#131311,#4d4d4d 85%,rgba(0,0,0,.5));
            background-repeat: no-repeat;
            -webkit-border-radius: 0 4px 0 0;
            -moz-border-radius: 0 4px 0 0;
            border-radius: 0 4px 0 0;
        }
        .fresh-table .btn {
            border-radius: 30px !important;
            color: chartreuse;
        }
    </style>
    <script>
        function confirmGo(m, u) {
            if (confirm(m)) {
                window.location = u;
                generateNoty('topCenter', 800, 'warning', "Details deleted successfully!");
            }
        }
    </script>

    <body unselectable="off">
        <!--sql operations-->
        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost/loginjdbc"
                           user="root"  password=""/>

        <sql:query dataSource="${dbsource}" var="result">
            SELECT * from product;
        </sql:query>
        <!--sql operations-->  
    <center>
        <h2 style="color:white"><strong><i>Building Management System</i></strong></h2>
    </center>
    <header>
        <a href="index.html" class="logo"><img src="WebClient/assets/logo/company.png" alt="logo"></a>
        <ul id="header-actions" class="clearfix">
            <li class="list-box user-admin dropdown">
                <div class="admin-details">
                    <div class="name">Admin</div>
                    <div class="designation">Current User</div>
                </div><a id="drop4" href="#" role="button" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-account_circle"></i></a>
                <ul class="dropdown-menu sm">
                    <li class="dropdown-content"><a href="#"><i class="icon-warning2"></i>Update Password<br><span>Your password will expire in 7 days.</span></a> <a href="">Edit Profile</a> <a href="">Change Password</a> <a href="">Settings</a> <a href="index.html">Logout</a></li>
                </ul>
            </li>
        </ul>
        <div class="custom-search hidden-sm hidden-xs">
            <input type="text" class="search-query" placeholder="Search here ..."> <i class="icon-search3"></i>
        </div>
    </header>
    <div class="container-fluid">
        <nav class="navbar navbar-default">
            <div class="navbar-header"><span class="navbar-text">Menu</span>
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#collapse-navbar" aria-expanded="false"><span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span></button>
            </div>
            <div class="collapse navbar-collapse" id="collapse-navbar">
                <ul class="nav navbar-nav">
                    <li><a><i class="icon-blur_on"></i>Provisioning</a></li>
                    <!--                    <li><a href="#"><i class="icon-business_center"></i> Provisioning </a></li>
                                        <li><a ><i class="icon-widgets"></i>Widgets</a></li>
                                        <li><a href="#" ><i class="icon-terrain"></i>Graphs </li>-->
                </ul>
            </div>
        </nav>
        <div class="dashboard-wrapper">
            <div class="top-bar clearfix">
                <div class="row gutter">
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                        <div class="page-title">
                            <h4></h4>
                        </div>
                    </div>
                    <!--                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                            <ul class="right-stats" id="mini-nav-right">
                                                <li><a href="javascript:void(0)" class="btn btn-danger"><span>895</span>Sales</a></li>
                                                <li><a href="javascript:void(0)" class="btn btn-success"><span>125</span>Leads</a></li>
                                            </ul>
                                        </div>-->
                </div>
            </div> 
            <div class="main-container">
                <div class="row gutter">
                    <form class="form-horizontal  w3-animate-left">
                        <div class="col-md-12">
                            <div class="fresh-table full-color-orange">
                                <div class="toolbar">
                                    <a data-toggle="modal" data-target="#myModal" type="button"  class="btn btn-danger btn-sm"  href="id=<c:out value="${row.id}"/>"><i class="fa fa-plus-circle" aria-hidden="true" style="color: #131311"></i>ADD</a> 
                                </div>
                                <table id="fresh-table" class="table">
                                    <thead>
                                    <th data-field="ID" data-sortable="true">Id</th>
                                    <th data-field="PName" data-sortable="true">PName</th>
                                    <th data-field="Quantity" data-sortable="true">Quantity</th>
                                    <th data-field="UPDATE">EDIT</th>
                                    <th data-field="DELETE">DELETE</th>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="row" items="${result.rows}">
                                            <tr>
                                                <td><c:out value="${row.id}"/></td>
                                                <td><c:out value="${row.pname}"/></td>
                                                <td><c:out value="${row.quantity}"/></td>
                                                <td><a type="button" class="btn btn-success btn-sm" href="update.jsp?id=<c:out value="${row.id}"/>"><i class="fa fa-pencil-square-o" aria-hidden="true" style="color: #131311"></i>Update</a></td>
                                                <td><a  class="btn btn-success btn-sm" href="javascript:confirmGo('Sure to delete this record?','deletedb.jsp?id=<c:out value="${row.id}"/>')"><i class="fa fa-trash-o" style="color: #131311"></i>Delete</a></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">ADD</h4>
                </div>
                <div class="modal-body">
                    <div class="form">
                        <form action="insertdb.jsp" method="post" data-toggle="validator" role="form"   class="form-horizontal">
                            <div class="form-group ">
                                <label for="inputProduct Name" class="col-sm-4 control-label">Product Name</label>
                                <div class="col-sm-8">
                                    <input class="form-control" type="text" placeholder="pname" name="pname"  style="text-align:center"   maxlength="20" required pattern="^[A-Za-z]{1}[A-Za-z 0-9_]*$"  data-error="This Field Is Required"/>
                                    <div class="help-block with-errors"></div>
                                </div>
                            </div>
                            <div class="form-group ">
                                <label for="inputQuantity" class="col-sm-4 control-label">Quantity</label>
                                <div class="col-sm-8">
                                    <input  class="form-control" type="text" placeholder="qty" name="qty" style="text-align:center"   maxlength="20"/>
                                    <div class="help-block with-errors"></div>
                                </div>
                            </div>
                            <br>
                            <div class="form-group ">
                                <div class="col-sm-offset-3 col-sm-10">
                                    <button type="submit" id="noty" class="btn btn-default btn-outline   w3-ripple" name="commit"/>Add <span class="glyphicon glyphicon-send"></span></button>
                                    <button type="reset" class="btn btn-default btn-outline  w3-ripple">Reset<span class="fa fa-refresh "></span></button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>



    <div class="fixed-plugin" style="top: 300px">
        <div class="dropdown open">
            <a href="#" data-toggle="dropdown">
                <i class="fa fa-cog fa-2x"> </i>
            </a>
            <ul class="dropdown-menu">
                <li class="header-title">Adjustments</li>
                <li class="adjustments-line">
                    <a href="javascript:void(0)" class="switch-trigger">
                        <p>Full Background</p>
                        <div class="switch"
                             data-on-label="ON"
                             data-off-label="OFF">
                            <input type="checkbox" checked data-target="section-header" data-type="parallax"/>
                        </div>
                        <div class="clearfix"></div>
                    </a>
                </li>
                <li class="adjustments-line">
                    <a href="javascript:void(0)" class="switch-trigger">
                        <p>Colors</p>
                        <div class="pull-right">
                            <span class="badge filter badge-blue" data-color="blue"></span>
                            <span class="badge filter badge-azure" data-color="azure"></span>
                            <span class="badge filter badge-green" data-color="green"></span>
                            <span class="badge filter badge-orange active" data-color="orange"></span>
                            <span class="badge filter badge-red" data-color="red"></span>
                        </div>
                        <div class="clearfix"></div>
                    </a>
                </li>
                <li class="header-title">Layouts</li>
                <li class="active">
                    <a class="img-holder" href="application.jsp">
                        <img src="WebClient/assets/img/compact.jpg">
                        <h5>Compact Table</h5>
                    </a>
                </li>
                <li>
                    <a class="img-holder" href="fresh-bootstrap-table-full-screen.jsp">
                        <img src="WebClient/assets/img/full.jpg">
                        <h5>Full Screen Table</h5>
                    </a>
                </li>
            </ul>
        </div>
    </div>

</body>
<!--for bootstrap table-->
<script type="text/javascript">

    var $table = $('#fresh-table'),
            $alertBtn = $('#alertBtn'),
            full_screen = false;

    $().ready(function () {
        $table.bootstrapTable({
            toolbar: ".toolbar",
            showRefresh: true,
            search: true,
            showToggle: true,
            showColumns: true,
            pagination: true,
            striped: true,
            pageSize: 8,
            pageList: [8, 10, 25, 50, 100],

            formatShowingRows: function (pageFrom, pageTo, totalRows) {
                //do nothing here, we don't want to show the text "showing x of y from..." 
            },
            formatRecordsPerPage: function (pageNumber) {
                return pageNumber + " rows visible";
            },
            icons: {
                refresh: 'fa fa-refresh',
                toggle: 'fa fa-th-list',
                columns: 'fa fa-columns',
                detailOpen: 'fa fa-plus-circle',
                detailClose: 'fa fa-minus-circle'
            }
        });
        $(window).resize(function () {
            $table.bootstrapTable('resetView');
        });
        window.operateEvents = {
            'click .like': function (e, value, row, index) {
                alert('You click like icon, row: ' + JSON.stringify(row));
                console.log(value, row, index);
            },
            'click .edit': function (e, value, row, index) {
                alert('You click edit icon, row: ' + JSON.stringify(row));
                console.log(value, row, index);
            },
            'click .remove': function (e, value, row, index) {
                $table.bootstrapTable('remove', {
                    field: 'id',
                    values: [row.id]
                });

            }
        };

        $alertBtn.click(function () {
            alert("You pressed on Alert");
        });

    });

    function operateFormatter(value, row, index) {
        return [
            '<a rel="tooltip" title="Like" class="table-action like" href="javascript:void(0)" title="Like">',
            '<i class="fa fa-heart"></i>',
            '</a>',
            '<a rel="tooltip" title="Edit" class="table-action edit" href="javascript:void(0)" title="Edit">',
            '<i class="fa fa-edit"></i>',
            '</a>',
            '<a rel="tooltip" title="Remove" class="table-action remove" href="javascript:void(0)" title="Remove">',
            '<i class="fa fa-remove"></i>',
            '</a>'
        ].join('');
    }

</script>
<div class="description description-footer">
    <p>Copyright &copy; 2017 <a href=""> Design and Developed by Chakra Network Solutions Pvt. Ltd.,</a>, made with <i class="fa fa-heart ct-heart"></i> for a better web.</p>
</div>
<script>
    $(document).ready(function () {
//        generateNoty('topCenter', 800, 'error', "Error Occured. Please try again Later.");
        $("#noty").click(function () {
            generateNoty('topCenter', 800, 'warning', "Data Added Successfully!");
        });
    });
</script>
<script src="WebClient/assets/js/scrollup/jquery.scrollUp.js"></script>
<script src="WebClient/assets/js/custom.js"></script>
<!--scroll--> 
<link rel="stylesheet" href="WebClient/assets/js/jquery.scrolling-tabs.css">
<script src="WebClient/assets/js/jquery.scrolling-tabs.js"></script>
<script src="WebClient/assets/js/st-demo.js"></script>
<!--noty-->
<link href="WebClient/assetss/css/signin-soft.css" rel="stylesheet"/>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" />

<script src="WebClient/assetss/js/signin-soft.js" type="text/javascript"></script>
<script src="WebClient/assetss/js/nouislider.min.js" type="text/javascript"></script>
<script type="text/javascript" src="WebClient/assetss/js/jquery.noty.js"></script>	
<script type="text/javascript" src="WebClient/assetss/js/bootstrap.js"></script>
<script type="text/javascript" src="WebClient/assetss/js/default.js"></script>
<script type="text/javascript" src="WebClient/assetss/js/topCenter.js"></script>	
<script type="text/javascript" src="WebClient/assetss/js/customNoty.js"></script>
<!--validation-->
<script type="text/javascript" src="WebClient/assetss/js/validator.js"></script>
<script type="text/javascript" src="WebClient/assetss/js/validator.min.js"></script>
</html>
