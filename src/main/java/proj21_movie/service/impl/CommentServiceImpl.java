package proj21_movie.service.impl;

import java.util.List;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;

import proj21_movie.dto.Comment;
import proj21_movie.mapper.CommentMapper;
import proj21_movie.service.CommentService;

public class CommentServiceImpl implements CommentService {
	static final Log log= LogFactory.getLog(MovieServiceImpl.class);

	@Autowired
	private CommentMapper mapper;
	
	@Override
	public List<Comment> getLists() {
		List<Comment> list = mapper.selectCommentAll();
		log.debug("service - getLists() > " + list.size());
		return list;
	}

	@Override
	public List<Comment> getCommentByUser(String user) {
		List<Comment> list = mapper.selectCommentByUser(user);
		log.debug("service - getLists() > " + list.size());
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

}
