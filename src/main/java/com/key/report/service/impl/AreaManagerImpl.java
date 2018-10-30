package com.key.report.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.key.common.base.service.AccountManager;
import com.key.common.plugs.page.Page;
import com.key.common.plugs.page.PropertyFilter;
import com.key.common.service.BaseServiceImpl;
import com.key.report.dao.AreaDao;
import com.key.report.entity.Area;
import com.key.report.service.AreaManager;
import com.key.report.service.UserManager;


/**
 * 问卷
 * 
 *
 * 
 * 
 */
@Service("AreaManager")
public class AreaManagerImpl extends BaseServiceImpl<Area, String> implements AreaManager {

	@Autowired
	private AreaDao AreaDao;
	@Autowired
	private AccountManager accountManager;
	@Autowired
	private UserManager userManager;
	
	@Override
	public void setBaseDao() {
		this.baseDao=AreaDao;
	}
	
	@Override
	public Area getArea(String id) {
		if(id==null || "".equals(id)){
			return new Area();
		}
		Area directory=get(id);
		return directory;
	}
	
	public Area getAreaByCode(String code){
		if(code == null || "".equals(code)) return null;
		List<Criterion> criterions=new ArrayList<Criterion>();
		criterions.add(Restrictions.eq("areaCode", code));
		return AreaDao.findFirst(criterions);
	}
	
	public Page<Area> findByGroup(String groupId1,String groupId2,Page<Area> page) {
		List<Criterion> criterions = new ArrayList<Criterion>();
		if(groupId1!=null && !"".equals(groupId1)){
			Criterion cri1=Restrictions.eq("groupId1", groupId1);
			criterions.add(cri1);
		}
		if(groupId2!=null && !"".equals(groupId2)){
			Criterion cri1_2=Restrictions.eq("groupId2", groupId2);
			criterions.add(cri1_2);
		}
		
	    return AreaDao.findPage(page,criterions.toArray(new Criterion[criterions.size()]) );
	}
	
	public List<Area> findChildren(String areaCode) {
		if(areaCode != null && !"".equals(areaCode)){
		    Page<Area> page=new Page<Area>();
		    List<PropertyFilter> filters=new ArrayList<PropertyFilter>();
			filters.add(new PropertyFilter("EQS_parentCode", areaCode));
		    return findAll(page, filters);
		}
		return null;
	}
	
	public List<Area> findSibling(String areaCode) {
		Area area = getAreaByCode(areaCode);
		if(area!=null){
			String parentCode = area.getParentCode();
			if(parentCode != null && !"".equals(parentCode)){
				return findChildren(parentCode);
			}
		}
		return null;
	}
}
