package proj21_movie.service;

import java.util.List;

import org.springframework.stereotype.Service;

import proj21_movie.dto.Statistics;
import proj21_movie.dto.StatisticsCommand;

@Service
public interface StatisticsService {
	int showTotalSales();
	
	List<Statistics> showSalesByLatestDate();
	List<Statistics> showSalesByMonth();
	
	List<StatisticsCommand> showAudienceByMovie();
}
