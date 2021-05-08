package com.osk.team.domain;

import java.sql.Date;

public class Qna {
    private int m_qno; // QnA번호
    private int mno; //회원번호
    private Date m_qdate; //작성일
    private String m_qtitle; //제목
    private String m_qcontent; //내용
    private String a_qcontent; //답변내용
    private Date a_qdate; //답변일

    public int getM_qno() {
        return m_qno;
    }

    public void setM_qno(int m_qno) {
        this.m_qno = m_qno;
    }

    public int getMno() {
        return mno;
    }

    public void setMno(int mno) {
        this.mno = mno;
    }

    public Date getM_qdate() {
        return m_qdate;
    }

    public void setM_qdate(Date m_qdate) {
        this.m_qdate = m_qdate;
    }

    public String getM_qtitle() {
        return m_qtitle;
    }

    public void setM_qtitle(String m_qtitle) {
        this.m_qtitle = m_qtitle;
    }

    public String getM_qcontent() {
        return m_qcontent;
    }

    public void setM_qcontent(String m_qcontent) {
        this.m_qcontent = m_qcontent;
    }

    public String getA_qcontent() {
        return a_qcontent;
    }

    public void setA_qcontent(String a_qcontent) {
        this.a_qcontent = a_qcontent;
    }

    public Date getA_qdate() {
        return a_qdate;
    }

    public void setA_qdate(Date a_qdate) {
        this.a_qdate = a_qdate;
    }
}
