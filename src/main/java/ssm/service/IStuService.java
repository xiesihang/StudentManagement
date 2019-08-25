package ssm.service;

import ssm.pojo.Classes;
import ssm.pojo.Page;
import ssm.pojo.Students;

import java.util.List;

public interface IStuService {
    List<Students> selectAll(Page page);

    List<Classes> selectClass();

    int insert(Students stu);

    int delete(int id);
}
