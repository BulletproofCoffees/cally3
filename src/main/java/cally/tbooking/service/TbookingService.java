package cally.tbooking.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import cally.tbooking.dao.TbookingDao;

@Service
public class TbookingService {
	
	@Inject
	private TbookingDao dao;
	public List<Map<String, Object>> stInfoBform(String stList){
		return dao.stInfoBform(stList);	
	}
	public List<Map<String, Object>> checkedTrain(String checkT){
		return dao.checkedTrain(checkT);
	}
	public Map<String, Object> stInfoStation(String stInfoList){
		return dao.stInfoStation(stInfoList);	
	}
	public List<Map<String, Object>> cTMod(String cTModList){
		return dao.cTMod(cTModList);
	}
}
