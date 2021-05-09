package com.osk.team.domain;

import java.sql.Date;

public class Board {
    private int bno;//게시판id
    private int mno;//회원번호
    private Member writer;//회원이름
    private int b_tno;//게시판분류번호
    private int bcount;//조회수
    private String btitle;//게시판 제목
    private String bcontent;//게시판내용
    private Date bdate;//작성일

    @Override
    public String toString() {
        return "Board{" +
                "bno=" + bno +
                ", mno=" + mno +
                ", writer=" + writer +
                ", b_tno=" + b_tno +
                ", bcount=" + bcount +
                ", btitle='" + btitle + '\'' +
                ", bcontent='" + bcontent + '\'' +
                ", bdate=" + bdate +
                '}';
    }

    public int getBno() {
        return bno;
    }

    public void setBno(int bno) {
        this.bno = bno;
    }

    public int getMno() {
        return mno;
    }

    public void setMno(int mno) {
        this.mno = mno;
    }

    public Member getWriter() {
        return writer;
    }

    public void setWriter(Member writer) {
        this.writer = writer;
    }

    public int getB_tno() {
        return b_tno;
    }

    public void setB_tno(int b_tno) {
        this.b_tno = b_tno;
    }

    public int getBcount() {
        return bcount;
    }

    public void setBcount(int bcount) {
        this.bcount = bcount;
    }

    public String getBtitle() {
        return btitle;
    }

    public void setBtitle(String btitle) {
        this.btitle = btitle;
    }

    public String getBcontent() {
        return bcontent;
    }

    public void setBcontent(String bcontent) {
        this.bcontent = bcontent;
    }

    public Date getBdate() {
        return bdate;
    }

    public void setBdate(Date bdate) {
        this.bdate = bdate;
    }
}
