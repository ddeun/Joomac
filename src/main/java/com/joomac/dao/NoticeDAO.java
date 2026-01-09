package com.joomac.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.joomac.dto.NoticeDTO;

@Mapper
public interface NoticeDAO {

    List<NoticeDTO> selectNoticeList();

    NoticeDTO selectNotice(int nno);

    int insertNotice(NoticeDTO dto);

    int deleteNotice(int nno);
}
