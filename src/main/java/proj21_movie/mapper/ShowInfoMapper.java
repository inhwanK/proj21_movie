package proj21_movie.mapper;

import java.util.List;

import org.springframework.stereotype.Component;

import proj21_movie.dto.ShowInfo;

@Component
public interface ShowInfoMapper {
	List<ShowInfo> selectShowInfoAll();
	ShowInfo selectShowInfoByNo(ShowInfo showInfo);
	
	int insertShowInfo(ShowInfo showInfo);
	int updateShowInfo(ShowInfo showInfo);
	int deleteShowInfo(ShowInfo showInfo);
	
	// 날짜, 영화, 극장, 시간으로 검색하는 상영정보
	List<ShowInfo> selectShowInfoByCondition(ShowInfo showInfo);
	
	// 극장, 날짜으로 검색하는 극장 상영시간표
	List<ShowInfo> selectShowInfoListByTheater(ShowInfo showInfo);
	
	// 극장, 날짜, 상영관으로 검색하여 들어가있는 시간정보 확인
	List<ShowInfo> selectTimeListByCondition(ShowInfo showInfo);
}
