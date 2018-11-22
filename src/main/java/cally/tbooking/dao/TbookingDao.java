package cally.tbooking.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class TbookingDao {

	@Inject
	private SqlSession session;
		
	public List<Map<String, Object>> stInfoBform(String stList){
		return session.selectList("TbookingMapper.stListMapper");
	}
	public List<Map<String, Object>> checkedTrain(String checkT){
		return session.selectList("TbookingMapper.checkedMapper");
	}
	public Map<String, Object> stInfoStation(String stInfoList){
		return session.selectOne("TbookingMapper.stInfoStation",stInfoList);
	}
	public List<Map<String, Object>> cTMod(String cTModList){
		return session.selectList("TbookingMapper.cTModListMapper");
	}

}
