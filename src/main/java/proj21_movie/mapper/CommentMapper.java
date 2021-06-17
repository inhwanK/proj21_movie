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
	Comment selectCommentAvgStar(Comment comment);
	
	int insertComment(Comment comment);
	int updateComment(Comment comment);
	int deleteComment(Comment comment);
}
