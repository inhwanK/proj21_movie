package proj21_movie.service;

import java.time.LocalDate;
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
import proj21_movie.dto.Movie;
import proj21_movie.mapper.MovieMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { ContextRoot.class })
@WebAppConfiguration
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class MovieServiceTest {

	protected static final Log log = LogFactory.getLog(MovieServiceTest.class);
	
	@Autowired
	private MovieMapper mapper;
	
	@After
	public void tearDown() throws Exception {
		System.out.println();
	}

	@Test
	public void test01GetLists() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		List<Movie> list = mapper.selectMovieAll();
		Assert.assertNotNull(list);
		
		list.forEach(s -> log.debug(s.toString()));
	}

	@Test
	public void test02GetMovie() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		
		Movie selMovie = new Movie(1);
		Movie movie = mapper.selectMovieByNo(selMovie);
		Assert.assertNotNull(movie);
		
		log.debug(movie.toString());
	}
	
	@Test
	public void test03GetMovieBoxOffice() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		List<Movie> list = mapper.selectMovieBoxOffice();
		Assert.assertNotNull(list);
		
		list.forEach(s -> log.debug(s.toString()));
	}
	
	@Test
	public void test04GetMovieCommingSoon() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		List<Movie> list = mapper.selectMovieCommingSoon();
		Assert.assertNotNull(list);
		
		list.forEach(s -> log.debug(s.toString()));
	}
	
	@Test
	public void test05GetMovieByTitle() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		
		List<Movie> list = mapper.selectMovieByTitle("크루");
		Assert.assertNotNull(list);
		
		list.forEach(s -> log.debug(s.toString()));
	}

	@Test
	public void test06RegisterMovie() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		
		LocalDate start = LocalDate.of(2021, 06, 07);
		LocalDate end = LocalDate.of(2021, 06, 10);
		Movie newMovie = new Movie("test movie", 12, "액션", 120, "감독", "배우들", "상세설명", start, end, 3.5, "poster.jpg");
		
		int res = mapper.insertMovie(newMovie);
		Assert.assertEquals(1, res);
		log.debug("res no >> " + res);
		
		mapper.deleteMovie(newMovie);	
	}

	@Test
	public void test07ModifyMovie() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		
		LocalDate start = LocalDate.of(2021, 06, 17);
		LocalDate end = LocalDate.of(2021, 06, 20);
		
		Movie newMovie = new Movie("test movie", 12, "액션", 120, "감독", "배우들", "상세설명", start, end, 3.5, "poster.jpg");
		mapper.insertMovie(newMovie);
		
		newMovie.setMovTitle("test movie2");
		newMovie.setMovGrade(15);
		newMovie.setMovGenre("액션2");
		newMovie.setMovRuntime(220);
		newMovie.setMovDirector("감독2");
		newMovie.setMovActor("배우들2");
		newMovie.setMovDetail("상세설명2");
		newMovie.setMovOpendate(LocalDate.of(2021, 07, 17));
		newMovie.setMovEnddate(LocalDate.of(2021, 07, 20));
		newMovie.setMovAvgstar(4.5);
		newMovie.setMovPoster("poster2.jpg");
		
		int res = mapper.updateMovie(newMovie);
		Assert.assertEquals(1, res);
		
		mapper.deleteMovie(newMovie);
	}

	@Test
	public void test08RemoveMovie() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		
		LocalDate start = LocalDate.of(2021, 06, 17);
		LocalDate end = LocalDate.of(2021, 06, 20);
		
		Movie newMovie = new Movie("test movie", 12, "액션", 120, "감독", "배우들", "상세설명", start, end, 3.5, "poster.jpg");
		mapper.insertMovie(newMovie);
		int res = mapper.deleteMovie(newMovie);
		Assert.assertEquals(1, res);
	}

}
