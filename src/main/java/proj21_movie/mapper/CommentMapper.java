package proj21_movie.mapper;

import java.util.List;

import org.springframework.stereotype.Component;

import proj21_movie.dto.Comment;

@Component
public interface CommentMapper {

	List<Comment> selectCommentAll();
	List<Comment> selectCommentByUser(String user);
	
	int insertComment(Comment comment);
	int updateComment(Comment comment);
	int deleteComment(Comment comment);
}
