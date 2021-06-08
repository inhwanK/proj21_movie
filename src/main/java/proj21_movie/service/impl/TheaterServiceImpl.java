package proj21_movie.service.impl;

import java.util.List;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_movie.dto.Theater;
import proj21_movie.mapper.TheaterMapper;
import proj21_movie.service.TheaterService;

@Service
public class TheaterServiceImpl implements TheaterService {
	static final Log log = LogFactory.getLog(TheaterServiceImpl.class);

	@Autowired
	private TheaterMapper mapper;

	@Override
	public List<Theater> getLists() {
		List<Theater> list = mapper.selectTheaterByAll();
		log.debug("service - getLists() > " + list.size());
		return list;
	}

	@Override
	public Theater getTheater(Theater theater) {
		log.debug("service - getTheater() > " + theater);
		return mapper.selectTheaterByNo(theater);
	}	
}
