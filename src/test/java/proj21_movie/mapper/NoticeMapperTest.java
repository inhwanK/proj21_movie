package proj21_movie.mapper;

import java.util.List;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.junit.After;
import org.junit.Assert;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import proj21_movie.config.ContextRoot;
import proj21_movie.dto.Notice;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { ContextRoot.class })
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
@WebAppConfiguration
public class NoticeMapperTest {
	protected static final Log log = LogFactory.getLog(NoticeMapperTest.class);
		
	@Autowired
	private NoticeMapper mapper;
	
	@After
	public void tearDown() throws Exception {
		mapper.setAutoIncrement(); 
		//AfterClass로 수행하는 것이 바람직할 것 같지만...
		//NoticeMapper 클래스 생성자를 만드는 등. 번거로워져서 일단 After로 수행.
	}

	@Test
	public void test05SelectNoticeByNo() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		
		Notice notice = mapper.selectNoticeByNo(4); //데이터 row가 공통적으로 3 까지만 들어가 있기 때문에, 4로 값을 고정해놓는게 좋음.
		Assert.assertNotNull(notice);
	}

	@Test
	public void test03SelectNoticeAll() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		List<Notice> list = mapper.selectNoticeAll();
		Assert.assertNotNull(list);
	}

	@Test
	public void test04UpdateNotice() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		
		Notice notice = new Notice();
		notice.setNotNo(4); //데이터 row가 공통적으로 3 까지만 들어가 있기 때문에, 4로 값을 고정해놓는게 좋음.
		notice.setNotTitle("inserttest 글 수정");
		notice.setNotDetail("inserttest 글 세부내용 수정");
		notice.setNotFile("inserttest 글 파일 경로 수정");
		int res = mapper.updateNotice(notice);
		Assert.assertEquals(1, res);
	}

	@Test
	public void test01InsertNotice() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		
		Notice notice = new Notice();
		notice.setNotTitle("inserttest 글");
		notice.setNotDetail("inserttest 글 세부내용");
		notice.setNotFile("inserttest 글 파일 경로");
		int res = mapper.insertNotice(notice);
		Assert.assertEquals(1, res);
	}

	@Test
	public void test06DeleteNotice() {
		int res = mapper.deleteNotice(4); //데이터 row가 공통적으로 3 까지만 들어가 있기 때문에, 4로 값을 고정해놓는게 좋음.
		Assert.assertEquals(1, res);
	}
	
	@Test
	public void test07SelectNoticeByTitle() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		List<Notice> listNotice = mapper.selectNoticeByTitle("공", 1);
		Assert.assertNotNull(listNotice);
	}

	@Test
	public void test08SelectNoticeRecent() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		List<Notice> listNotice = mapper.selectNoticeRecent();
		Assert.assertNotNull(listNotice);
	}
}
