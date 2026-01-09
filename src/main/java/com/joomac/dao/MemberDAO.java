package com.joomac.dao;

import java.util.List;
import com.joomac.dto.MemberDTO;

public interface MemberDAO {
    int insertMember(MemberDTO dto);
    MemberDTO login(MemberDTO dto);
    MemberDTO selectMember(int mno);
    List<MemberDTO> selectMemberList();
    int updateMember(MemberDTO dto);
    int deleteMember(int mno);
}