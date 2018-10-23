package com.key.report.service;

import com.key.common.service.BaseService;
import com.key.report.entity.CityAnswerStat;

/**
 * 答卷业务
 * 
 *
 * 
 * 
 */

public interface CityAnswerStatManager extends BaseService<CityAnswerStat, String> {
	public void buildStat(String city2Id);
	public CityAnswerStat findByCityId(String cityId);
}
