package proj21_movie.service;

import java.util.List;

import org.springframework.stereotype.Service;

import proj21_movie.dto.Inquiry;

@Service
public interface InquiryService {

	List<Inquiry> getLists();
	List<Inquiry> getInquiryByUser(String user);
	
	int registInquiry(Inquiry inquiry);
	int modifyInquiry(Inquiry inquiry);
	int removeInquiry(Inquiry inquiry);
}
