package ssm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ssm.mapper.ClassesMapper;
import ssm.mapper.StudentsMapper;
import ssm.pojo.Classes;
import ssm.pojo.Page;
import ssm.pojo.Students;
import ssm.pojo.StudentsExample;
import ssm.service.IStuService;

import java.util.List;

@Service
public class StuService implements IStuService{
    @Autowired
    private StudentsMapper smapper;
    @Autowired
    private ClassesMapper cmapper;

    @Override
    public List<Students> selectAll(Page page) {
        StudentsExample e=new StudentsExample();
        StudentsExample.Criteria c = e.createCriteria();
        Integer count = (int) smapper.countByExample(e);
        int countPage=count%page.getSize()==0?count/page.getSize():(count/page.getSize())+1;
        page.setCountPage(countPage);
        page.setCount(count);

        int startRow=(page.getCurrPage()-1)*page.getSize();
        e.limit(startRow,page.getSize());
        List<Students> list = smapper.selectByExample(e);
        for(Students student:list){
            Classes classes = cmapper.selectByPrimaryKey(student.getClassid());
            student.setClasses(classes);
        }
        return list;
    }

    @Override
    public List<Classes> selectClass() {
        return cmapper.selectByExample(null);
    }

    @Override
    public int insert(Students stu) {
        int i = smapper.insertSelective(stu);
        return i;
    }

    @Override
    public int delete(int id) {
        return smapper.deleteByPrimaryKey(id);
    }
}
