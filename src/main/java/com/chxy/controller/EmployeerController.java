package com.chxy.controller;

import com.chxy.bean.Employee;
import com.chxy.dao.DeptmentMapper;
import com.chxy.service.EmployeerService;
import com.chxy.utils.Json;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import java.util.ArrayList;
import java.util.List;

@Controller
public class EmployeerController {
    @Autowired
    private EmployeerService employeerService;
    /*
      查询员工的信息 因为需要分页 所以前台传入需要查询第几页的页码 默认为1
     * */
    @RequestMapping("/emps")
    @ResponseBody
    public PageInfo  getEmpList(@RequestParam(value = "page",defaultValue = "1")Integer page){
        // 引入PageHelper分页插件
        // 在查询之前只需要调用，传入页码，以及每页的大小
        PageHelper.startPage(page,5);
        // startPage后面紧跟的这个查询就是一个分页查询
        List<Employee> employeeList= employeerService.getAllEmployeers();
        PageInfo pageInfo = new PageInfo(employeeList,5);
        return pageInfo;
    }


    @RequestMapping("/emps01")
    public String getEmpList1(@RequestParam(value = "page",defaultValue = "1")Integer page, Model model){
        // 引入PageHelper分页插件
        // 在查询之前只需要调用，传入页码，以及每页的大小
      PageHelper.startPage(page,5);
        // startPage后面紧跟的这个查询就是一个分页查询
       List<Employee> employeeList= employeerService.getAllEmployeers();
       PageInfo pageInfo = new PageInfo(employeeList,5);
        model.addAttribute("pageInfo",pageInfo);
        return "empList";
    }
    /**
     * 保存用户的方法
     * */
    @RequestMapping("/saveEmp")
    @ResponseBody
    public Json saveEmp(Employee employee){
      Json json = new Json();
       employeerService.saveEmp(employee);
       json.setMsg("保存成功");
       return json;
    }
    /**
     * 删除用户
     * */
    @RequestMapping(value = "/emps/{ids}",method = RequestMethod.DELETE)
    @ResponseBody
    public Json deleEmp(@PathVariable("ids")String empIds){
        if(empIds.contains("-")){
             //多个删除
            List<Integer> list = new ArrayList<>();
            String[] ids = empIds.split("-");
            for (String empId: ids) {
               list.add(Integer.parseInt(empId));
            }
            employeerService.deleEmpBath(list);
        }else {
             //单个删除
            employeerService.deleEmp(Integer.parseInt(empIds));
        }
        Json json =new Json();
        json.setMsg("删除成功");
        return json;
    }
    /**
     * 修改用户
     * */
    @RequestMapping(value = "/emps/{empId}",method = RequestMethod.PUT)
    @ResponseBody
    public Json updateEmp(Employee employee){
      Json json = new Json();
      employeerService.updateEmp(employee);
      json.setMsg("修改成功");
      return json;
    }
    /**
     * 查询用户
     * */
    @RequestMapping(value = "/emps/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Json getEmp(@PathVariable("id")Integer empId){
        Json json = new Json();
       Employee employee = employeerService.getEmp(empId);
       if (employee !=null){
           json.setObj(employee);
           json.setMsg("确实存在");
       }else{
           json.setMsg("查无此人");
       }
        return json;
    }


}
