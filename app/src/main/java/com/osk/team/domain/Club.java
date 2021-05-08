package com.osk.team.domain;

import java.sql.Date;
import java.util.Objects;

public class Club {
    private int cno;//클럽번호
    private int mno;//멤버번호
    private String carrive;//도착지
    private String ctheme;//테마
    private String ctitle;//제목
    private String ccontent;//내용
    private Date csdt;//가는날
    private Date cedt;//오는날
    private int ctotal;//인원수

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Club club = (Club) o;
        return cno == club.cno && mno == club.mno && ctotal == club.ctotal && Objects.equals(carrive, club.carrive) && Objects.equals(ctheme, club.ctheme) && Objects.equals(ctitle, club.ctitle) && Objects.equals(ccontent, club.ccontent) && Objects.equals(csdt, club.csdt) && Objects.equals(cedt, club.cedt);
    }

    @Override
    public int hashCode() {
        return Objects.hash(cno, mno, carrive, ctheme, ctitle, ccontent, csdt, cedt, ctotal);
    }

    public int getCno() {
        return cno;
    }

    public void setCno(int cno) {
        this.cno = cno;
    }

    public int getMno() {
        return mno;
    }

    public void setMno(int mno) {
        this.mno = mno;
    }

    public String getCarrive() {
        return carrive;
    }

    public void setCarrive(String carrive) {
        this.carrive = carrive;
    }

    public String getCtheme() {
        return ctheme;
    }

    public void setCtheme(String ctheme) {
        this.ctheme = ctheme;
    }

    public String getCtitle() {
        return ctitle;
    }

    public void setCtitle(String ctitle) {
        this.ctitle = ctitle;
    }

    public String getCcontent() {
        return ccontent;
    }

    public void setCcontent(String ccontent) {
        this.ccontent = ccontent;
    }

    public Date getCsdt() {
        return csdt;
    }

    public void setCsdt(Date csdt) {
        this.csdt = csdt;
    }

    public Date getCedt() {
        return cedt;
    }

    public void setCedt(Date cedt) {
        this.cedt = cedt;
    }

    public int getCtotal() {
        return ctotal;
    }

    public void setCtotal(int ctotal) {
        this.ctotal = ctotal;
    }

}
