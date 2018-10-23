package com.key.common.service;

import java.io.Serializable;
import java.util.List;

import org.hibernate.criterion.Criterion;

import com.key.common.base.entity.IdEntity;
import com.key.common.plugs.page.Page;
import com.key.common.plugs.page.PropertyFilter;

/**
 * 业务基类接口
 *
 *
 *
 *
 */
public interface BaseService<T extends IdEntity,ID extends Serializable> {
	
	public void setBaseDao();
	
	public void save(T t);
	
	public void delete(T t);
	
	public void delete(ID id);
	
	public T get(ID id);
	
	public T getModel(ID id);
	
	public Page<T> findPage(Page<T> page,List<PropertyFilter> filters);
	
	public List<T> findList(List<PropertyFilter> filters);
	
	public List<T> findAll(Page<T> page,List<PropertyFilter> filters);

	public List<T> findList(Criterion... criterions);
	
	public Page<T> findPage(Page<T> page,Criterion... criterion);
}
