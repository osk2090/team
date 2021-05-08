package com.osk.team.domain;

import java.sql.Date;

public class Hotplace {

    private int hno;//게시판 번호
    private String htitle;//게시판 제목
    private String hcontent;//게시판 내용
    private Date hdate;//등록 날짜
    private int hcount;//조회수
    private String haddr;//주소
    private String hphoto;//사진

    public int getHno() {
        return hno;
    }

    public void setHno(int hno) {
        this.hno = hno;
    }

    public String getHtitle() {
        return htitle;
    }

    public void setHtitle(String htitle) {
        this.htitle = htitle;
    }

    public String getHcontent() {
        return hcontent;
    }

    public void setHcontent(String hcontent) {
        this.hcontent = hcontent;
    }

    public Date getHdate() {
        return hdate;
    }

    public void setHdate(Date hdate) {
        this.hdate = hdate;
    }

    public int getHcount() {
        return hcount;
    }

    public void setHcount(int hcount) {
        this.hcount = hcount;
    }

    public String getHaddr() {
        return haddr;
    }

    public void setHaddr(String haddr) {
        this.haddr = haddr;
    }

    public String getHphoto() {
        return hphoto;
    }

    public void setHphoto(String hphoto) {
        this.hphoto = hphoto;
    }
}
