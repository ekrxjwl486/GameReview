package com.project.reply.service;

import com.project.reply.vo.ReplyVo;

import java.util.List;

public interface ReplyService {

    List<ReplyVo> getReplylist(int board_number);

    void writeReply(ReplyVo replyVo);
}