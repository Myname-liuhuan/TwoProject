import com.example.huan.Application;
import com.example.huan.entity.Student;
import com.example.huan.service.StudentService;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

/**
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
