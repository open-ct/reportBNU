package com.key.report.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.key.common.base.dao.UserDao;
import com.key.common.base.entity.User;
import com.key.common.plugs.page.Page;
import com.key.common.service.BaseServiceImpl;
import com.key.common.utils.security.DigestUtils;
import com.key.report.service.UserManager;


/**
 * 用户管理
 * 
 *
 * 
 * 
 */
@Service
public class UserManagerImpl extends BaseServiceImpl<User, String> implements UserManager {

	@Autowired
	private UserDao userDao;
	
	@Override
	public void setBaseDao() {
		this.baseDao=userDao;
	}

	@Override
	public void adminSave(User entity, String[] userRoleIds) {
		if(entity!=null){
			
			String pwd=entity.getPwd();
			if(pwd!=null && !"".equals(pwd)){
				//加点盐
//				String salt=RandomUtils.randomWordNum(5);
				String shaPassword = DigestUtils.sha1Hex(pwd);
				entity.setShaPassword(shaPassword);
//				entity.setSalt(salt);
			}
			save(entity);
		}
	}

	public Page<User> findPage(Page<User> page, User entity) {
		List<Criterion> criterions=new ArrayList<Criterion>();
		String loginName = entity.getLoginName();
		if(loginName!=null && !"".equals(loginName)){
			criterions.add(Restrictions.like("loginName", "%"+loginName+"%"));
		}
		return super.findPageByCri(page, criterions);
	}


	@Override
	public User findNameUn(String id, String loginName) {
		List<Criterion> criterions=new ArrayList<Criterion>();
		criterions.add(Restrictions.eq("loginName", loginName));
		if(id!=null && !"".equals(id)){
			criterions.add(Restrictions.ne("id", id));
		}
		return userDao.findFirst(criterions);
	}

	
	@Override
	public void resetUserGroup(String groupId) {
		userDao.resetUserGroup(groupId);
	}



	@Override
	public List<Object[]> findSchools(String roleType) {
		return userDao.findSchools(roleType);
	}

	public List<Object[]> findSchools(String city2Id,String roleType){
		return userDao.findSchools(city2Id,roleType);
	}


	@Override
	public User findById(String id) {
		Criterion criterion=Restrictions.eq("id", id);
		return userDao.findUnique(criterion);
	}
	
}
