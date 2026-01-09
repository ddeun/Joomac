package com.joomac.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.joomac.dto.ReplyDTO;

@Repository
public class ReplyDAO {

    @Autowired
    private SqlSession sqlSession;

    public ReplyDTO selectQuestionReply(int qno) {
        return sqlSession.selectOne("reply.selectQuestionReply", qno);
    }

    public int insertQuestionReply(ReplyDTO dto) {
        return sqlSession.insert("reply.insertQuestionReply", dto);
    }

    public List<ReplyDTO> selectBoardReplyList(int bno) {
        return sqlSession.selectList("reply.selectBoardReplyList", bno);
    }

    public int insertBoardReply(ReplyDTO dto) {
        return sqlSession.insert("reply.insertBoardReply", dto);
    }
}