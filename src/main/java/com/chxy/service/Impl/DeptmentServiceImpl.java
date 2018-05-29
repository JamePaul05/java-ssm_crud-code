package com.chxy.service.Impl;

import com.chxy.bean.Deptment;
import com.chxy.dao.DeptmentMapper;
import com.chxy.service.DeptmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class DeptmentServiceImpl implements DeptmentService{
    @Autowired
    private DeptmentMapper deptmentMapper;
    @Override
    public List<Deptment> getAllDeptmentName() {
        return  deptmentMapper.selectByExample(null);
    }
}
