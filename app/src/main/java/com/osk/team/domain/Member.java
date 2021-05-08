package com.osk.team.domain;

import java.sql.Date;
import java.util.Objects;

public class Member {
    private int mno;//멤버번호
    private String mname;//이름
    private String mpwd;//암호
    private String memail;//이메일
    private String mphoto;//사진
    private Date mbirth;//생년월일

    private int mtel;//전화번호
    private int mgender;//성별
    private int mstatus;//탈퇴여부
    private int mpow;//관리자권한
    private int mcnt;//제제횟수


    public int getMno() {
        return mno;
    }

    public void setMno(int mno) {
        this.mno = mno;
    }

    public String getMname() {
        return mname;
    }

    public void setMname(String mname) {
        this.mname = mname;
    }

    public String getMpwd() {
        return mpwd;
    }

    public void setMpwd(String mpwd) {
        this.mpwd = mpwd;
    }

    public String getMemail() {
        return memail;
    }

    public void setMemail(String memail) {
        this.memail = memail;
    }

    public String getMphoto() {
        return mphoto;
    }

    public void setMphoto(String mphoto) {
        this.mphoto = mphoto;
    }

    public Date getMbirth() {
        return mbirth;
    }

    public void setMbirth(Date mbirth) {
        this.mbirth = mbirth;
    }

    public int getMtel() {
        return mtel;
    }

    public void setMtel(int mtel) {
        this.mtel = mtel;
    }

    public int getMgender() {
        return mgender;
    }

    public void setMgender(int mgender) {
        this.mgender = mgender;
    }

    public int getMstatus() {
        return mstatus;
    }

    public void setMstatus(int mstatus) {
        this.mstatus = mstatus;
    }

    public int getMpow() {
        return mpow;
    }

    public void setMpow(int mpow) {
        this.mpow = mpow;
    }

    public int getMcnt() {
        return mcnt;
    }

    public void setMcnt(int mcnt) {
        this.mcnt = mcnt;
    }
}