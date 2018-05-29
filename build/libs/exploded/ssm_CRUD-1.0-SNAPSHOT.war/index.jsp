<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/15
  Time: 22:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<link href="${pageContext.request.contextPath}/resource/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resource/js/jquery-1.12.4.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<body>
<div class="row">
    <div class="col-md-12"><h1>SSM版CRUD</h1></div>
</div>
<div class="row">
    <div class="col-md-3 col-md-offset-8">
        <button type="button" class="btn btn-primary" data-toggle="modal" id="input_add_emp_btn" data-target="#myModal">新增</button>
        <button type="button" class="btn btn-danger" id="del_all_btn">删除</button>
    </div>
</div>
<%--修改用户的模态框--%>
<div class="modal fade" id="emp_update_Modal" tabindex="-1"  role="dialog" aria-labelledby="myModalLabel"  style="display: none;">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel1">修改员工</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="form_update_emps">
                    <div class="form-group">
                        <label for="input_add_empName" class="col-sm-2 control-label">员工姓名</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="empName_update_static"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input_add_email" class="col-sm-2 control-label">员工邮箱</label>
                        <div class="col-sm-10">
                            <input type="email" class="form-control" name="email" id="input_update_email">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_update_input" value="M" > 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_update_input" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input_add_dept" class="col-sm-2 control-label">员工部门</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="input_update_dept" name="dId" >
                            </select>
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="update_emp_btn">更新</button>
            </div>
        </div>
    </div>
</div>
<!-- 添加的模态框 -->
<div class="modal fade" id="emp_Add_Modal" tabindex="-1"  role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">添加员工</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="form_add_emps">
                    <div class="form-group">
                        <label for="input_add_empName" class="col-sm-2 control-label">员工姓名</label>
                        <div class="col-sm-10">
                            <input type="text" name="empName" class="form-control" id="input_add_empName" placeholder="XX">
                            <span class="help-block" id="input_add_empName_span"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input_add_email" class="col-sm-2 control-label">员工邮箱</label>
                        <div class="col-sm-10">
                            <input type="email" class="form-control" name="email" id="input_add_email" placeholder="xx@163.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_add_input" value="M" > 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_add_input" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input_add_dept" class="col-sm-2 control-label">员工部门</label>
                        <div class="col-sm-10">
                            <select class="form-control" name="dId" id="input_add_dept">
                            </select>
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="add_emp_btn">保存</button>
            </div>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
       <table class="table table-hover" id="empTable">
           <thead>
           <tr>
               <th>
                   <input type="checkbox" id="check_All" />
               </th>
             <th class="col-md-2 col-md-offset-1" >员工ID</th>
             <th>员工姓名</th>
             <th>员工性别</th>
             <th>员工邮箱</th>
             <th>员工部门</th>
             <th>操作</th>
           </tr>
           </thead>
       <tbody>

       </tbody>
       </table>
    </div>
</div>
<div class="row">
   <div class="col-md-6" id="page_Info">

   </div>
    <div class="col-md-6" id="page_Menu">

    </div>
<script type="text/javascript">
    var currentPage;//定义当前页  为了后续的删除等操作 也可以回到本页
    $(function () {
        to_page(1);
    })
    function to_page(page) {
        $.ajax({
            url:"${pageContext.request.contextPath}/emps",
            data:"page="+page,
            type:"GET",
            success:function (result) {
                HandTableData(result);
                HandPageData(result);
                HandPageMenu(result);
            }

        });
    }
    //处理数据表格的函数
    function HandTableData(result) {
        $("#empTable tbody").empty();//在填入数据的时候一定要清空上一次的数据
        var emp =result.list;
        $.each(emp,function (index,data) {
            var checkTd=$("<td></td>").append($(" <input type=\"checkbox\" class=\"check_item\" ></input"));
            var empIdTd=$("<td></td>").append(data.empId);
            var empNameTd=$("<td></td>").append(data.empName);
            var genderTd =$("<td></td>").append(data.gender=="M"?"男":"女");
            var emailTd=$("<td></td>").append(data.email);
            var deptTd=$("<td></td>").append(data.deptment.deptName);
            var editBtn=$("<button></button>").addClass("btn btn-primary edit-btn").append("<span></span>").addClass("glyphicon glyphicon-pencil").append("编辑");
            editBtn.attr("editBtnId",data.empId);
            var delBtn=$("<button></button>").addClass("btn btn-danger dele-btn").append("<span></span>").addClass("glyphicon glyphicon-trash").append("删除");
            delBtn.attr("delBtnId",data.empId);
            var btn =$("<td></td>").append(editBtn).append(delBtn);
            $("<tr></tr>").append(checkTd).append(empIdTd).append(empNameTd).append(genderTd).append(emailTd).append(deptTd).append(btn).appendTo("#empTable tbody");
        });
    }
    //处理分页条的信息
    function HandPageData(result) {
        $("#page_Info").empty();//在导入数据之前一定要清空里面的数据
        //当前第${pageInfo.pageNum}页，共${pageInfo.pages}页，共${pageInfo.total}条数据
        $("#page_Info").append("当前第"+result.pageNum+"页，"+"共"+result.pages+"页，"+"共"+result.total+"条数据");
        currentPage =result.pageNum;
    }
   //处理分页目录信息
    function  HandPageMenu(result) {
        $("#page_Menu").empty();
        var pageUi=$("<ui></ui>").addClass("pagination");
         var firstLi=$("<li></li>").append($("<a></a>").append("首页").attr("href","#"));//首页
        firstLi.click(function () {
            to_page(1);
        })
        if(result.hasPreviousPage != false) {
            var preLi = $("<li></li>").append($("<a></a>").append("&laquo;").attr("href", "#"));//前一页
            preLi.click(function () {
                to_page(result.pageNum - 1);

            })
        }
        pageUi .append(firstLi).append(preLi);
         var pageNums=result.navigatepageNums;
         $.each(pageNums,function (index,data) {
             var currentLi = $("<li></li>").append($("<a></a>").append(data).attr("href", "#"));//页码导航栏
             if(data == result.pageNum) {
                currentLi.addClass("active");
             }
             currentLi.click(function () {
                 to_page(data);

             })
             pageUi.append(currentLi);
         })

       if(result.hasNextPage != false) {
           var nextLi = $("<li></li>").append($("<a></a>").append("&raquo;").attr("href", "#"));//后一页
           nextLi.click(function () {
               to_page(result.pageNum + 1);
           })
       }
        var lastLi=$("<li></li>").append($("<a></a>").append("尾页").attr("href","#"));//尾页
        lastLi.click(function () {
            to_page(result.pages);
        })
       pageUi .append(nextLi).append(lastLi);
        $("<nav></nav>").addClass("col-md-offset-3").append(pageUi).appendTo("#page_Menu");
    }
//    查询部门列表的方法
function getDept(ele) {
    $(ele).empty();
    $.ajax({
        url:"${pageContext.request.contextPath}/depts",
        type:"POST",
        success:function (data) {
            var depts = data.obj;
            $.each(depts,function (index,deptNames) {
                $("<option></option>").append(deptNames.deptName).attr("value",deptNames.deptId).appendTo(ele);
            })
        }
    });
}
//添加用户的方法
   $("#input_add_emp_btn").click(function () {
       getDept("#input_add_dept");
     $("#emp_Add_Modal").modal({
         backdrop:false,
     })
   });
    //新增用户
    $("#add_emp_btn").click(function () {
        $.ajax({
            url:"${pageContext.request.contextPath}/saveEmp",
            type:"POST",
            data:$("#form_add_emps").serialize(),
            success:function (data) {
                $('#emp_Add_Modal').modal('hide')
            }
        })
    });
//删除用户
    $(document).on("click",".dele-btn",function () {
      var empName =$(this).parents("tr").find("td:eq(1)").text();
      var empId =$(this).attr("delBtnId");
        if(confirm("确定要删除【"+empName+"】吗？")){
           $.ajax({
               url:"${pageContext.request.contextPath}/emps/"+empId,
               type:"DELETE",
               success:function (data) {
                    to_page(currentPage);//删除完成了 回到删除的当前页
               }
           })
        }
    });
//    修改用户

$(document).on("click",".edit-btn",function () {
    getDept("#input_update_dept");
    getEmp($(this).attr("editBtnId"));
    $("#update_emp_btn").attr("update_id",$(this).attr("editBtnId"));//将属性的用户的ID传给更新的按钮的属性
    $('#emp_update_Modal').modal({
            backdrop:false,
        }
    )
});
//查询员工信息的方法
    function getEmp(id) {
        $.ajax({
            type:"GET",
           url:"${pageContext.request.contextPath}/emps/"+id,
           success:function (data) {
                  $("#empName_update_static").text(data.obj.empName);//文本内容是text函数
                  $("#input_update_email").val(data.obj.email);//输入框 复选框的是val（）函数
                 $("#emp_update_Modal input[name=gender]").val([data.obj.gender]);//获得员工的性别
                 $("#emp_update_Modal select").val([data.obj.dId]);//获得员工的部门
           }
        });

    }
    //点击修改用户的方法
        $("#update_emp_btn").click(function () {
            empId= $("#update_emp_btn").attr("update_id");
            $.ajax({
                url:"${pageContext.request.contextPath}/emps/"+empId,
                type:"PUT",
                data:$("#form_update_emps").serialize(),
                success:function (data) {
                    $('#emp_update_Modal').modal('hide');//当更新完毕就隐藏模态框
                    to_page(currentPage);//回到当前页
                }
            })

        });
    //全选/全部不选的功能
    $("#check_All").click(function () {
        //$(this).prop("checked")让下面每一个复选框和最大的总得复选框得时候被选一致
        $(".check_item").prop("checked",$(this).prop("checked"));
    });
    //判断当前的页面的复选框是否全部被选上 如果全部被选上了 总得复选框就得自行被选上
    $(document).on("click",".check_item",function () {
        var falg = $(".check_item:checked").length == $(".check_item").length;
        $("#check_All").prop("checked",falg);
    });
    //点击最大的删除的按钮 全部删除
    $("#del_all_btn").click(function () {
        var empNames ="";
        var empIds  ="";
        $.each($(".check_item:checked"),function () {
          empNames += $(this).parents("tr").find("td:eq(2)").text()+",";
           empIds +=$(this).parents("tr").find("td:eq(1)").text()+"-";
        });
       empNames = empNames.substring(0,empNames.length-1);
        empIds=empIds.substring(0,empIds.length-1);
        if(confirm("确定要删除【"+empNames+"】吗？")){
             $.ajax({
                 url:"${pageContext.request.contextPath}/emps/"+empIds,
                 type:"DELETE",
                 success:function (data) {
                     $("#check_All").prop("checked",false);
                     to_page(currentPage);
                 }
             })
        }
    })
</script>

</div>
</body>
</html>
