package com.key.common.base.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.key.common.base.entity.User;
import com.key.common.dao.BaseDaoImpl;
import com.key.common.plugs.page.Page;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;


/**
 *
 *
 *
 *
 */
@Repository
public class UserDaoImpl extends BaseDaoImpl<User, String> implements UserDao{

	@Override
	public void resetUserGroup(String groupId) {
		String sql="UPDATE t_user SET user_group_id = '' WHERE id = id";
		this.getSession().createSQLQuery(sql).executeUpdate();
	}

	@Override
	public List<Object[]> findSchools(String roleType) {
		String sql="SELECT xx_id,xx_name,count(*) FROM t_user where version=3 and role_type="+roleType+" group by xx_id";
		List<Object[]> lists = this.getSession().createSQLQuery(sql).list();
		return lists;
	}

	@Override
	public List<Object[]> findSchools(String city2Id,String roleType) {
		String sql="SELECT xx_id,xx_name,count(*) FROM t_user where version=3 and city2_id ='"+city2Id+"' and role_type="+roleType+" group by xx_id";
		List<Object[]> lists = this.getSession().createSQLQuery(sql).list();
		return lists;
	}

	public List<Object[]> findBgs(String schoolId,String roleType){
		String sql="SELECT bg_id,bg_name,role_type,count(*) FROM t_user where version=3 and role_type="+roleType+" and xx_id='"+schoolId+"'  group by bg_id";
		List<Object[]> lists = this.getSession().createSQLQuery(sql).list();
		return lists;
	}
	
}
