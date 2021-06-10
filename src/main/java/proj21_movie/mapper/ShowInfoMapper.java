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
}
