import com.example.huan.Application;
import com.example.huan.entity.Student;
import com.example.huan.service.StudentService;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

/**
 * -@RunWith(SpringRunner.class) : 表示通过springboot 中的Test类进行测试
 * -@SpringBootTest(classes = Application.class) 测试类也需要指定spring boot的入口类 因为需要先加载入口类 完成对基本配置的加载
 *
 */
@RunWith(SpringRunner.class)
@SpringBootTest(classes = Application.class)
public class Test {

    @Autowired
    StudentService studentService;

    @org.junit.Test
    public void stuTest(){
        List<Student> studentList = studentService.queryAll();
        for (Student student : studentList) {
            System.out.println(student);
        }
    }

}
