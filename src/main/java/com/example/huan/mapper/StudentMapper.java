package com.example.huan.mapper;

import com.example.huan.entity.Student;

import java.util.List;

/**
 * @author huan
 */
public interface StudentMapper {

    /**
     * 查询student表中所有的数据
     * @return
     */
    List<Student> queryAll();
}
