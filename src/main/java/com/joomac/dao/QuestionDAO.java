package com.joomac.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.joomac.dto.QuestionDTO;

@Repository
public class QuestionDAO {

    @Autowired
    private SqlSession sqlSession;

    public int insertQuestion(QuestionDTO dto) {
        return sqlSession.insert("question.insertQuestion", dto);
    }

    public List<QuestionDTO> selectQuestionByMember(int mno) {
        return sqlSession.selectList("question.selectQuestionByMember", mno);
    }

    public QuestionDTO selectQuestion(int qno) {
        return sqlSession.selectOne("question.selectQuestion", qno);
    }
    
    public List<QuestionDTO> selectAllQuestion() {
        return sqlSession.selectList("question.selectAllQuestion");
    }

    public int updateQuestion(QuestionDTO dto) {
        return sqlSession.update("question.updateQuestion", dto);
    }

    public int deleteQuestion(int qno) {
        return sqlSession.delete("question.deleteQuestion", qno);
    }
    
    public int updateAnswerStatus(int qno) {
        return sqlSession.update("question.updateAnswerStatus", qno);
    }
}
