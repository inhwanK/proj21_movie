package proj21_movie.service;

import java.util.List;

import org.springframework.stereotype.Service;

import proj21_movie.dto.Comment;
import proj21_movie.dto.Movie;

@Service
public interface CommentService {

	List<Comment> getLists();
	List<Comment> getCommentByUser(String user);
	
	// 영화 상세 페이지 평점 관련 추가
	List<Comment> getCommentByMovNo(Movie movNo);
	// 기본 한줄평 번호로 검색
	Comment getCommentByComNo(int comNo);
	// 영화 별 한줄평 평균 별점 검색
	List<Comment> getCommentAvgStar(Movie movNo);
	
	// 박스오피스 평균 별점 리스트 (임시)
	List<Comment> getCommentBoxOfficeAvgStarLists();
	
	int registComment(Comment comment);
	int modifyComment(Comment comment);
	int removeComment(Comment comment);
	
	// 트랜잭션 -> 한줄평 추가시 / 영화 평점이 update(서브쿼리)
	int trRegistComment(Comment comment);
	// 트랜잭션 -> 한줄평 수정시 / 영화 평점이 update(서브쿼리)
	int trModifyComment(Comment comment);
	// 트랜잭션 -> 한줄평 삭제시 / 영화 평점이 update(서브쿼리)
	int trRemoveComment(Comment comment);
}
