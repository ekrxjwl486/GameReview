package com.project.user.dao.impl;

import com.project.user.dao.UserDao;
import com.project.user.vo.UserVo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;

@Repository("UserDao")
public class UserDaoImpl implements UserDao {

    @Autowired
    private SqlSession sqlSession;

    @Override
    public UserVo login(HashMap<String, Object> map) {
        UserVo uVo = sqlSession.selectOne("User.login",map);
        return uVo;
    }

    @Override
    public void userupdqte(UserVo userVo) {
        sqlSession.update("User.UserUpdate", userVo);
    }

    @Override
    public Object getUser(Object login) {
        Object getUser = sqlSession.selectOne("User.getUser",login);
        return getUser;
    }

    @Override
    public void profileupdate(HashMap<String, Object> map) {
        sqlSession.update("User.profileupdate",map);
    }

    @Override
    public String useridCheck(HashMap<String, Object> map) {
        UserVo idck = sqlSession.selectOne("User.idCheck", map);
        if (idck != null){
            String check =idck.getU_id();
            return check;
        }else {
            return null;
        }
    }

    @Override
    public String nnCheck(HashMap<String, Object> map) {
        UserVo nnck = sqlSession.selectOne("User.nnCheck",map);
        if(nnck != null){
            String check = nnck.getN_name();
            System.out.println(check);
            return check;
        }else {
            return null;
        }
    }

    @Override
    public void userInsert(HashMap<String, Object> map) {
        sqlSession.insert("User.UserInsert",map);
    }
}
