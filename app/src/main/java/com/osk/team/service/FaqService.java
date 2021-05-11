package com.osk.team.service;

import com.osk.team.domain.Board;
import com.osk.team.domain.Faq;

import java.util.List;

public interface FaqService {

    int add(Faq Faq) throws Exception;

    List<Faq> listAll() throws Exception;

    Faq get(int no) throws Exception;

    int update(Faq Faq) throws Exception;

    int delete(int no) throws Exception;

}
