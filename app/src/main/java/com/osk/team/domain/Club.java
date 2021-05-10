package com.osk.team.domain;

import java.sql.Date;
import java.util.List;

public class Club {

    private int no;//클럽번호
    private int memberNo;//멤버번호
    private String arrive;//도착지
    private String theme;//테마
    private String title;//제목
    private String content;//내용
    private Date startDate;//가는날
    private Date endDate;//오는날
    private int total;//인원수
    private List<Object> photos;//사진

    @Override
    public String toString() {
        return "Club{" +
                "no=" + no +
                ", memberNo=" + memberNo +
                ", arrive='" + arrive + '\'' +
                ", theme='" + theme + '\'' +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", startDate=" + startDate +
                ", endDate=" + endDate +
                ", total=" + total +
                ", photos=" + photos +
                '}';
    }

    public List<Object> getPhotos() {
        return photos;
    }

    public void setPhotos(List<Object> photos) {
        this.photos = photos;
    }

    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public int getMemberNo() {
        return memberNo;
    }

    public void setMemberNo(int memberNo) {
        this.memberNo = memberNo;
    }

    public String getArrive() {
        return arrive;
    }

    public void setArrive(String arrive) {
        this.arrive = arrive;
    }

    public String getTheme() {
        return theme;
    }

    public void setTheme(String theme) {
        this.theme = theme;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }
}
