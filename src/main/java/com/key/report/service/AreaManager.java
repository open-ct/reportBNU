package com.key.report.service;

import java.util.List;

import com.key.common.plugs.page.Page;
import com.key.common.service.BaseService;
import com.key.report.entity.Area;

/**
 * 问卷处理
 * 
 *
 * 
 * 
 */
public interface AreaManager extends BaseService<Area, String>{

	/**
	 * 根据 最底层对象，得到此对象所在的目录结构
	 * @param Report
	 * @return
	 */
	
	public Area getArea(String id);

	public Area getAreaByCode(String code);
	
	public List<Area> findChildren(String areaCode);

	public List<Area> findSibling(String areaCode);
	
	public Page<Area> findByGroup(String groupId1,String groupId2,Page<Area> page);

}
