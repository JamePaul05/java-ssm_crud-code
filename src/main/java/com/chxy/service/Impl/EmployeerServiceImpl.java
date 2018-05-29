package com.chxy.service.Impl;

import com.chxy.bean.Employee;
import com.chxy.bean.EmployeeExample;
import com.chxy.dao.EmployeeMapper;
import com.chxy.service.EmployeerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class EmployeerServiceImpl implements EmployeerService {
    @Autowired
    private EmployeeMapper employeeMapper;
    public List<Employee> getAllEmployeers() {
        return employeeMapper.selectByExampleWithDept(null);
    }

    @Override
    public void saveEmp(Employee employee) {
         employeeMapper.insertSelective(employee);
    }

    @Override
    public void deleEmp(Integer id) {
        employeeMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void updateEmp(Employee employee) {
       employeeMapper.updateByPrimaryKeySelective(employee);
    }

    @Override
    public Employee getEmp(Integer id) {

        return  employeeMapper.selectByPrimaryKey(id);
    }

    @Override
    public void deleEmpBath(List<Integer> ids) {
        EmployeeExample employeeExample = new EmployeeExample();
        EmployeeExample.Criteria criteria = employeeExample.createCriteria();
       criteria.andEmpIdIn(ids);
        employeeMapper.deleteByExample(employeeExample);
    }


}
