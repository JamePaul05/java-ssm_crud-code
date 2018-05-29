package com.chxy.dao;

import com.chxy.bean.Deptment;
import com.chxy.bean.DeptmentExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface DeptmentMapper {
    int countByExample(DeptmentExample example);

    int deleteByExample(DeptmentExample example);

    int deleteByPrimaryKey(Integer deptId);

    int insert(Deptment record);

    int insertSelective(Deptment record);

    List<Deptment> selectByExample(DeptmentExample example);

    Deptment selectByPrimaryKey(Integer deptId);


    int updateByExampleSelective(@Param("record") Deptment record, @Param("example") DeptmentExample example);

    int updateByExample(@Param("record") Deptment record, @Param("example") DeptmentExample example);

    int updateByPrimaryKeySelective(Deptment record);

    int updateByPrimaryKey(Deptment record);
}