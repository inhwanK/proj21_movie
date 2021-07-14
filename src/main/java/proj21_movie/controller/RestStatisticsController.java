package proj21_movie.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import proj21_movie.dto.Statistics;
import proj21_movie.dto.StatisticsCommand;
import proj21_movie.service.StatisticsService;

@RestController
@RequestMapping("/api")
public class RestStatisticsController {
	
	@Autowired
	private StatisticsService service;
	
	
	@GetMapping("/totalSales")
	public ResponseEntity<Object> getTotalSales(){
		int sales = service.showTotalSales();
		return ResponseEntity.status(HttpStatus.OK).body(sales);
	}
	
	@GetMapping("/salesLatestDate")
	public ResponseEntity<Object> getSalesByLatestDate(){
		List<Statistics> sales = service.showSalesByLatestDate();
		return ResponseEntity.status(HttpStatus.OK).body(sales);
	}
	
	@GetMapping("/salesMonth")
	public ResponseEntity<Object> getAudienceByLatestDate(){
		List<Statistics> sales = service.showSalesByMonth();
		return ResponseEntity.status(HttpStatus.OK).body(sales);
	}
	
	@GetMapping("/movieAudience")
	public ResponseEntity<Object> getAudienceByMovie(){
		List<StatisticsCommand> audience = service.showAudienceByMovie();
		return ResponseEntity.status(HttpStatus.OK).body(audience);
	}
}
