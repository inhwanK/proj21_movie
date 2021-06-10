package proj21_movie.service;

import java.util.List;

import org.springframework.stereotype.Service;

import proj21_movie.dto.ShowInfo;

@Service
public interface ShowInfoService {
	List<ShowInfo> getLists();
	ShowInfo getShowInfo(ShowInfo showInfo);
	int registShowInfo(ShowInfo showInfo);
	int modifyShowInfo(ShowInfo showInfo);
	int removeShowInfo(ShowInfo showInfo);
}
