package com.example.huan.service;

import com.example.huan.entity.Student;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author huan
 */
public interface StudentService {

    /**
     * 查询表student 中的所有的数据
     * @return
     */
   List<Student> queryAll();

}
