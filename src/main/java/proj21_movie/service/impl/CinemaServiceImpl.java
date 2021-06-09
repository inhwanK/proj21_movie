package proj21_movie.service.impl;

import java.util.List;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_movie.dto.Cinema;
import proj21_movie.mapper.CinemaMapper;
import proj21_movie.service.CinemaService;

@Service
public class CinemaServiceImpl implements CinemaService {
	static final Log log = LogFactory.getLog(CinemaServiceImpl.class);

	@Autowired
	private CinemaMapper mapper;

	@Override
	public List<Cinema> getLists() {
		List<Cinema> list = mapper.selectCinemaByAll();
		log.debug("service - getLists() > " + list.size());
		return list;
	}

	@Override
	public Cinema getCinema(Cinema cinema) {
		log.debug("service - getCinema() > " + cinema);
		return mapper.selectCinemaByNo(cinema);
	}	
}
