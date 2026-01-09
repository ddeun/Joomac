package com.joomac.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.joomac.dto.MemberDTO;

public interface MemberDAO {
    int insertMember(MemberDTO dto);
    MemberDTO login(MemberDTO dto);
    MemberDTO selectMember(int mno);
    List<MemberDTO> selectMemberList();
    int updateMember(MemberDTO dto);
    int deleteMember(int mno);
    MemberDTO passwordCheck(
            @Param("mno") int mno,
            @Param("mpasswd") String mpasswd
        );
}