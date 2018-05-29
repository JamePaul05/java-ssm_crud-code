package com.chxy.controller;

import com.chxy.bean.Deptment;
import com.chxy.service.DeptmentService;
import com.chxy.utils.Json;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class DeprmentController {
    @Autowired
    private DeptmentService deptmentService;
    //查询所有的部门的信息
    @RequestMapping("/depts")
    @ResponseBody
    public Json getAllDeptmentName(){
     List<Deptment> deptmentList =   deptmentService.getAllDeptmentName();
       Json json = new Json();
       json.setObj(deptmentList);
        return json;
    }
}
