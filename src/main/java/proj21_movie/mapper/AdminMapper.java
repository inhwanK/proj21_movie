package proj21_movie.mapper;

import org.springframework.stereotype.Component;

import proj21_movie.dto.Admin;

@Component
public interface AdminMapper {
	public Admin getAdmin(Admin admin);
}
