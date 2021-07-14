package proj21_movie.mapper;

import java.util.List;

import org.springframework.stereotype.Component;

import proj21_movie.dto.Statistics;
import proj21_movie.dto.StatisticsCommand;



//DB의 여러 테이블을 가져와 통계를 뽑는 매퍼
@Component
public interface StatisticsMapper {
	
	// 실시간 총 매출  날짜 설정등 해야함. 
	int selectTotalSales();
	
	List<Statistics> selectSalesByLatestDate();
	
	List<Statistics> selectSalesByMonth();
	
	List<StatisticsCommand> selectAudienceByMovie();
}
