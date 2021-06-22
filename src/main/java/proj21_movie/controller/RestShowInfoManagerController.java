package proj21_movie.controller;

import java.net.URI;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import proj21_movie.dto.Movie;
import proj21_movie.dto.ShowInfo;
import proj21_movie.dto.Theater;
import proj21_movie.service.ShowInfoService;

@RestController
@RequestMapping("/api")
public class RestShowInfoManagerController {
	
	@Autowired
	private ShowInfoService service;
	
	@GetMapping("/showinfo")
	public ResponseEntity<Object> showInfoList(){
		System.out.println("showInfoList()");
		return ResponseEntity.ok(service.getLists());
	}
	
	@GetMapping("/showinfo/{no}")
	public ResponseEntity<Object> showinfo(@PathVariable int no, HttpServletResponse response) {
		ShowInfo showInfo = service.getShowInfo(new ShowInfo(no));
		if (showInfo == null) {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
		}
		return ResponseEntity.ok(showInfo);
	}
	
	@PostMapping("/showinfo")
	public ResponseEntity<Object> newShowInfo(@RequestBody ShowInfo showInfo) {
		System.out.println("newShowInfo > " + showInfo);
		
		service.registShowInfo(showInfo);
		URI uri = URI.create("/api/showinfo/" + showInfo.getShwNo());

		return ResponseEntity.created(uri).body(showInfo.getShwNo());
	}
	
	@PatchMapping("/showinfo/{no}")
	public ResponseEntity<Object> updateShowInfo(@PathVariable int no, @RequestBody ShowInfo showInfo) {
		return ResponseEntity.ok(service.modifyShowInfo(showInfo));
	}
	
	@DeleteMapping("/showinfo/{no}")
	public ResponseEntity<Object> deleteShowInfo(@PathVariable int no) {
		return ResponseEntity.ok(service.removeShowInfo(new ShowInfo(no)));
	}
	
	@GetMapping("/showinfobycondition/{movNo}/{thtNo}/{shwDate}")
	public ResponseEntity<Object> showInfoListByCondition(@PathVariable int movNo, @PathVariable int thtNo, @PathVariable String shwDate){
		System.out.println("showInfoListByCondition()");
		
		ShowInfo showInfo = new ShowInfo();
		showInfo.setMovNo(new Movie(movNo));
		showInfo.setThtNo(new Theater(thtNo));
		
		LocalDate shwLocalDate = LocalDate.parse(shwDate, DateTimeFormatter.ISO_DATE);
		showInfo.setShwDate(shwLocalDate);
		
		return ResponseEntity.ok(service.getListsByCondition(showInfo));
	}
}
