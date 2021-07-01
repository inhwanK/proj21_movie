package proj21_movie.service;

import java.util.List;

import org.springframework.stereotype.Service;

import proj21_movie.dto.Inquiry;

@Service
public interface InquiryService {

	List<Inquiry> getLists();
	List<Inquiry> getInquiryByUser(String user);
	List<Inquiry> getInquiryByAnsStatus(int inqStatus);
	Inquiry getInquiryByNo(int inqNo);
	
	int registInquiry(Inquiry inquiry);
	int answerInquiry(Inquiry inquiry);
	int removeInquiry(int inqNo);
}
