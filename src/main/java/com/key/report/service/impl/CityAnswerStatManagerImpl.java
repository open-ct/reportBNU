package com.key.report.service.impl;

import com.key.common.service.BaseServiceImpl;
import com.key.report.dao.CityAnswerStatDao;
import com.key.report.entity.CityAnswerStat;
import com.key.report.service.CityAnswerStatManager;
import com.key.report.service.UserManager;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.Transient;
import java.util.List;

/**
 * @author keyuan
 * keyuan258@gmail.com
 *
 */

@Service
public class CityAnswerStatManagerImpl extends BaseServiceImpl<CityAnswerStat, String> implements CityAnswerStatManager {

	@Autowired
	private CityAnswerStatDao cityAnswerStatDao;
	@Autowired
	private UserManager userManager;

	@Override
	public void setBaseDao() {
		this.baseDao=cityAnswerStatDao;
	}

	@Override
	public CityAnswerStat findByCityId(String cityId) {
		return cityAnswerStatDao.findUniqueBy("cityId",cityId);
	}

	@Transactional
	public void buildStat(String city2Id){
		
	}

}
