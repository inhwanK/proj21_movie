package proj21_movie.mapper;

import java.util.List;

import org.springframework.stereotype.Component;

import proj21_movie.dto.Comment;
import proj21_movie.dto.Movie;

@Component
public interface CommentMapper {

	List<Comment> selectCommentAll();
	List<Comment> selectCommentByUser(String user);
	
	// 영화 상세 페이지 평점 관련 select 추가
	List<Comment> selectCommentByMovNo(Movie movNo);
	// 기본 한줄평 번호로 검색
	Comment selectCommentByComNo(int comNo);
	
//	Comment selectCommentAvgStar(Comment comment);	// 나중에 처리할 예정
	
	int insertComment(Comment comment);
	int updateComment(Comment comment);
	int deleteComment(Comment comment);
}
