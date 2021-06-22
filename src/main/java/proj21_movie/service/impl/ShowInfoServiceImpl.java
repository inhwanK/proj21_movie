package proj21_movie.service.impl;

import java.util.List;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_movie.dto.ShowInfo;
import proj21_movie.mapper.ShowInfoMapper;
import proj21_movie.service.ShowInfoService;

@Service
public class ShowInfoServiceImpl implements ShowInfoService {
	static final Log log= LogFactory.getLog(ShowInfoServiceImpl.class);
	
	@Autowired
	private ShowInfoMapper mapper;
	
	@Override
	public List<ShowInfo> getLists() {
		List<ShowInfo> list = mapper.selectShowInfoAll();
		log.debug("service - getLists() > " + list.size());
		return list;
	}

	@Override
	public ShowInfo getShowInfo(ShowInfo showInfo) {
		log.debug("service - getShowInfo() > " + showInfo);
		return mapper.selectShowInfoByNo(showInfo);
	}

	@Override
	public int registShowInfo(ShowInfo showInfo) {
		log.debug("service - registShowInfo() > " + showInfo);
		return mapper.insertShowInfo(showInfo);
	}

	@Override
	public int modifyShowInfo(ShowInfo showInfo) {
		log.debug("service - modifyShowInfo() > " + showInfo);
		return mapper.updateShowInfo(showInfo);
	}

	@Override
	public int removeShowInfo(ShowInfo showInfo) {
		log.debug("service - removeShowInfo() > " + showInfo);
		return mapper.deleteShowInfo(showInfo);
	}

	@Override
	public List<ShowInfo> getListsByCondition(ShowInfo showInfo) {
		List<ShowInfo> list = mapper.selectShowInfoByCondition(showInfo);
		log.debug("service - getListsByDate() > " + showInfo);
		return list;
	}

}
