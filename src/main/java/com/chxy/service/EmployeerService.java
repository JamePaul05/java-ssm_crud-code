package com.chxy.service;

import com.chxy.bean.Employee;

import java.util.List;

public interface EmployeerService {
    List<Employee> getAllEmployeers();

    void saveEmp(Employee employee);

    void deleEmp(Integer id);

    void updateEmp(Employee employee);

    Employee getEmp(Integer id);

    void deleEmpBath(List<Integer> ids);
}
