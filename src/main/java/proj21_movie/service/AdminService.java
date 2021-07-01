package proj21_movie.service;

import org.springframework.stereotype.Service;

import proj21_movie.dto.Admin;

@Service
public interface AdminService {
	Admin getAdmin(Admin admin);
}
