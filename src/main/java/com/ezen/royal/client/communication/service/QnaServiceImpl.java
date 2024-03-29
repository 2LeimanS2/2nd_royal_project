package com.ezen.royal.client.communication.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.royal.client.communication.dto.QnaDTO;
import com.ezen.royal.client.communication.mapper.QnaMapper;

@Service
public class QnaServiceImpl implements QnaService {

	@Autowired
	QnaMapper qnaMapper;

	@Override
	public int qnaInsert(QnaDTO dto) {
		return qnaMapper.insert(dto);
	}

	@Override
	public int getMemberId(String social_id) {
		
		return qnaMapper.getMemberId(social_id);
	}
}
