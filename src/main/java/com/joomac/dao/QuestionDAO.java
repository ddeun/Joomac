package com.joomac.dao;

import java.util.List;
import com.joomac.dto.QuestionDTO;

public interface QuestionDAO {

    int insertQuestion(QuestionDTO dto);

    List<QuestionDTO> selectQuestionByMember(int mno);

    int updateAnswer(QuestionDTO dto);
}
