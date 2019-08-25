package ssm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import ssm.pojo.Classes;
import ssm.pojo.Page;
import ssm.pojo.Students;
import ssm.service.IStuService;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
public class StuController {
    @Autowired
    private IStuService service;
    @RequestMapping("/select")
    public ModelAndView selectAll(Page page, ModelAndView mav, HttpServletResponse response){
        response.setContentType("text/html;charset=UTF-8");
        //查询主表
        List<Students> list=service.selectAll(page);
        //查询附表
        List<Classes> classes=service.selectClass();
        mav.addObject("classes",classes);
        mav.addObject("list",list);
        mav.addObject("page",page);
        return mav;
    }
    @RequestMapping("/a")
    public String a(Model m){
        List<Classes> classes=service.selectClass();
        m.addAttribute("classes",classes);
        return "insert";
    }
    @RequestMapping("/insert")
    public String insert(Students stu){
        int i=service.insert(stu);
        return "redirect:/select";
    }

    @RequestMapping("/deleteOne/{id}")
    public void delete(@PathVariable int id, HttpServletResponse response){
        int i=service.delete(id);
        try {
            response.sendRedirect("/select");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    @ResponseBody
    @RequestMapping("/b")
    public String b(String inp) throws Exception {
        String msg="";
        if(inp==null){
            return "姓名不能为空";
        }
        return "非法字符";
    }
    @ResponseBody
    @RequestMapping("/c")
    public String c(String inp) throws Exception {
        String msg="";
        if(inp==null){
            return "年龄不能为空";
        }
        return "非法字符";
    }
    @ResponseBody
    @RequestMapping("/d")
    public String d(String inp) throws Exception {
        String msg="";
        if(inp==null){
            return "电话不能为空";
        }
        return "非法字符";
    }
    @ResponseBody
    @RequestMapping("/e")
    public String e(String inp) throws Exception {
        String msg="";
        if(inp==null){
            return "email不能为空";
        }
        return "非法字符";
    }
}
