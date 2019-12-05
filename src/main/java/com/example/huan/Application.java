package com.example.huan;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * @author huan
 * spring boot 启动的入口
 * 1,-@SpringBootApplication 是如下三个注解的集合
 * 三个注解:
 *   -@configuration 读取自定义的工具类或者配置
 *   -@EnableAutoConfiguration 使用自动去读默认的配置
 *   -@ComponentScan 扫描当前路径包下的类以及子包及其类
 *
 * 2,MapperScan("包名") 表示指定mybatis对应的mapper接口的路径
 */
@SpringBootApplication
@MapperScan("com.example.huan.mapper")
public class Application {
    public static void main(String[] args) {
        //加载spring
        SpringApplication.run(Application.class,args);
    }
}
