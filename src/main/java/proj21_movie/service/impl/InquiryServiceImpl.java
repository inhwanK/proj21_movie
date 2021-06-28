package proj21_movie.service.impl;

import java.util.List;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_movie.dto.Inquiry;
import proj21_movie.mapper.InquiryMapper;
import proj21_movie.service.InquiryService;

@Service
public class InquiryServiceImpl implements InquiryService {
	static final Log log= LogFactory.getLog(InquiryServiceImpl.class);

	@Autowired
	private InquiryMapper mapper;
	
	@Override
	public List<Inquiry> getLists() {
		List<Inquiry> list = mapper.selectInquiryAll();
		log.debug("service - getLists() > " + list.size());
		return list;
	}

	@Override
	public List<Inquiry> getInquiryByUser(String user) {
		List<Inquiry> list = mapper.selectInquiryByUser(user);
		log.debug("service - getInquiryByUser() > " + user);
		return list;
	}

	@Override
	public int registInquiry(Inquiry inquiry) {
		log.debug("service - registInquiry() > " + inquiry);
		return mapper.insertInquiry(inquiry);
	}

	@Override
	public int modifyInquiry(Inquiry inquiry) {
		log.debug("service - modifyInquiry() > " + inquiry);
		return mapper.updateInquiry(inquiry);
	}

	@Override
	public int removeInquiry(Inquiry inquiry) {
		log.debug("service - removeInquiry() > " + inquiry);
		return mapper.deleteInquiry(inquiry);
	}

}
