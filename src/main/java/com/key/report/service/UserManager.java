package com.key.report.service;

import com.key.common.base.entity.User;
import com.key.common.plugs.page.Page;
import com.key.common.service.BaseService;

import java.util.List;

public interface UserManager extends BaseService<User, String>{

	public void adminSave(User entity, String[] userRoleIds);

	public Page<User> findPage(Page<User> page, User entity);


	public User findNameUn(String id, String loginName);

	public void resetUserGroup(String groupId);


	public List<Object[]> findSchools(String roleType);
	public List<Object[]> findSchools(String city2Id,String roleType);

	public User findById(String id);

}
