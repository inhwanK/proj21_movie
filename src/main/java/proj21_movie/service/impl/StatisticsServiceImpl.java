package proj21_movie.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_movie.dto.Statistics;
import proj21_movie.mapper.StatisticsMapper;
import proj21_movie.service.StatisticsService;

@Service
public class StatisticsServiceImpl implements StatisticsService {

	@Autowired
	private StatisticsMapper mapper;
	
	@Override
	public int showTotalSales() {	
		return mapper.selectTotalSales();
	}

	@Override
	public List<Statistics> showSalesByLatestDate() {
		return mapper.selectSalesByLatestDate();
	}

	@Override
	public List<Statistics> showAudienceByLatestDate() {
		
		return mapper.selectAudienceByLatestDate();
	}

}
