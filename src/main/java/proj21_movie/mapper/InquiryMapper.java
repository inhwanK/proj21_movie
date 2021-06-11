package proj21_movie.mapper;

import java.util.List;

import org.springframework.stereotype.Component;

import proj21_movie.dto.Inquiry;

@Component
public interface InquiryMapper {

	List<Inquiry> selectInquiryAll();
	List<Inquiry> selectInquiryByUser(String user);
	
	int insertInquiry(Inquiry inquiry);
	int updateInquiry(Inquiry inquiry);
	int deleteInquiry(Inquiry inquiry);
}
