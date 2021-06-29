package proj21_movie.service.impl;

import java.util.List;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import proj21_movie.dto.Comment;
import proj21_movie.dto.Movie;
import proj21_movie.mapper.CommentMapper;
import proj21_movie.mapper.MovieMapper;
import proj21_movie.service.CommentService;

@Service
public class CommentServiceImpl implements CommentService {
	static final Log log= LogFactory.getLog(CommentServiceImpl.class);

	@Autowired
	private CommentMapper mapper;
	
	@Autowired
	private MovieMapper movMapper;
	
	@Override
	public List<Comment> getLists() {
		List<Comment> list = mapper.selectCommentAll();
		log.debug("service - getLists() > " + list.size());
		return list;
	}

	@Override
	public List<Comment> getCommentByUser(String user) {
		List<Comment> list = mapper.selectCommentByUser(user);
		log.debug("service - getCommentByUser() > " + list.size());
		return list;
	}
		
	@Override
	public List<Comment> getCommentByMovNo(Movie movNo) {
		List<Comment> list = mapper.selectCommentByMovNo(movNo);
		log.debug("service - getCommentByMovNo() > " + list.size());
		return list;
	}
	
	@Override
	public Comment getCommentByComNo(int comNo) {
		log.debug("service - getCommentByComNo() > " + comNo);
		return mapper.selectCommentByComNo(comNo);
	}

	@Override
	public List<Comment> getCommentAvgStar(Movie movNo) {
		List<Comment> list = mapper.selectCommentAvgStar(movNo);
		log.debug("service - getCommentAvgStar() > " + list.size());
		return mapper.selectCommentAvgStar(movNo);
	}
	
	@Override
	public List<Comment> getCommentBoxOfficeAvgStarLists() {
		List<Comment> list = mapper.selectCommentBoxOfficeAvgStarAll();
		log.debug("service - getCommentBoxOfficeAvgStarLists() > " + list.size());
		return list;
	}

	@Override
	public int registComment(Comment comment) {
		log.debug("service - registComment() > " + comment);
		return mapper.insertComment(comment);
	}

	@Override
	public int modifyComment(Comment comment) {
		log.debug("service - modifyComment() > " + comment);
		return mapper.updateComment(comment);
	}

	@Override
	public int removeComment(Comment comment) {
		log.debug("service - removeComment() > " + comment);
		return mapper.deleteComment(comment);
	}

	// 트랜잭션 -> 한줄평 추가시 / 영화 평점이 update(서브쿼리)
	@Override
	@Transactional
	public int trRegistComment(Comment comment) {
		int res = mapper.insertComment(comment);
		System.out.println("한줄평등록 >> " + comment.getComNo());
		
		res += movMapper.updateMovieAvgStar(comment.getMovNo());
		if (res != 2) throw new RuntimeException();
		return res;
	}
	
	// 트랜잭션 -> 한줄평 수정시 / 영화 평점이 update(서브쿼리)
	@Override
	@Transactional
	public int trModifyComment(Comment comment) {
		int res = mapper.updateComment(comment);
		System.out.println("한줄평수정 >> " + comment.getComNo());
		
		Comment newComment = mapper.selectCommentByComNo(comment.getComNo());
		
		res += movMapper.updateMovieAvgStar(newComment.getMovNo());
		if (res != 2) throw new RuntimeException();
		return res;
	}

	// 트랜잭션 -> 한줄평 삭제시 / 영화 평점이 update(서브쿼리)
	@Override
	@Transactional
	public int trRemoveComment(Comment comment) {
		Comment newComment = mapper.selectCommentByComNo(comment.getComNo());
		
		int res = mapper.deleteComment(newComment);
		System.out.println("한줄평삭제 >> " + comment.getComNo());

		res += movMapper.updateMovieAvgStar(newComment.getMovNo());
		if (res != 2) throw new RuntimeException();
		return res;
	}
}
