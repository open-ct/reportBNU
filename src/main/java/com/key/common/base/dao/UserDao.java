package com.key.common.base.dao;

import com.key.common.base.entity.User;
import com.key.common.dao.BaseDao;
import com.key.common.plugs.page.Page;

import java.util.List;


/**
 *
 *
 *
 *
 */
public interface UserDao extends BaseDao<User, String> {

    public void resetUserGroup(String groupId);

    public List<Object[]> findSchools(String roleType) ;

    public List<Object[]> findSchools(String city2Id,String roleType);
}
