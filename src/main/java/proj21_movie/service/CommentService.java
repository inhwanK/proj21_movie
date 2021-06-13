package proj21_movie.service;

import java.util.List;

import org.springframework.stereotype.Service;

import proj21_movie.dto.Comment;

@Service
public interface CommentService {

	List<Comment> getLists();
	List<Comment> getCommentByUser(String user);
	
	int registComment(Comment comment);
	int modifyComment(Comment comment);
	int removeComment(Comment comment);
}
