package com.joomac.dao;

import java.util.List;
import com.joomac.dto.NoticeDTO;

public interface NoticeDAO {

    List<NoticeDTO> selectNoticeList();

    NoticeDTO selectNotice(int nno);

    int insertNotice(NoticeDTO dto);

    int deleteNotice(int nno);
}
