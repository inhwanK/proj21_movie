package proj21_movie.service;

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
import proj21_movie.dto.Comment;
import proj21_movie.dto.Movie;
import proj21_movie.mapper.CommentMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { ContextRoot.class })
@WebAppConfiguration
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class CommentServiceTest {

	protected static final Log log = LogFactory.getLog(CommentServiceTest.class);
	
	@Autowired
	private CommentMapper mapper;
	
	static int no = 0;
	
	@After
	public void tearDown() throws Exception {
		System.out.println();
	}

	@Test
	public void test01GetLists() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		List<Comment> list = mapper.selectCommentAll();
		Assert.assertNotNull(list);
		
		list.forEach(s -> log.debug(s.toString()));
	}

	@Test
	public void test02GetCommentByUser() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		List<Comment> list = mapper.selectCommentByUser("test1@test.com");
		Assert.assertNotNull(list);
		
		list.forEach(s -> log.debug(s.toString()));
	}

	@Test
	public void test03RegistComment() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		
		Comment comment = new Comment();
		comment.setMovNo(new Movie(1));
		comment.setComUser("테스트유저");
		comment.setComContent("테스트");
		comment.setComStar(3);
		
		int res = mapper.insertComment(comment);
		Assert.assertEquals(1, res);
		log.debug("res no >> " + res);
		
		no = comment.getComNo();
		System.out.println(no);
	}

	@Test
	public void test04ModifyComment() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		
		Comment comment = new Comment(no);
		comment.setMovNo(new Movie(2));
		comment.setComUser("테스트유저2");
		comment.setComContent("테스트2");
		comment.setComStar(4);
		
		int res = mapper.updateComment(comment);
		Assert.assertEquals(1, res);
		log.debug("res no >> " + res);
	}

	@Test
	public void test05RemoveComment() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		
		Comment comment = new Comment(no);
		
		int res = mapper.deleteComment(comment);
		Assert.assertEquals(1, res);
		log.debug("res no >> " + res);
	}

}
