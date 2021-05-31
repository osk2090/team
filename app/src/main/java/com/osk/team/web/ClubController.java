package com.osk.team.web;

import com.osk.team.domain.Club;
import com.osk.team.domain.Member;
import com.osk.team.domain.Photo;
import com.osk.team.service.ClubService;
import com.osk.team.service.MemberService;
import net.coobird.thumbnailator.ThumbnailParameter;
import net.coobird.thumbnailator.Thumbnails;
import net.coobird.thumbnailator.geometry.Positions;
import net.coobird.thumbnailator.name.Rename;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/club/")
public class ClubController {

    ClubService clubService;
    MemberService memberService;
    ServletContext sc;

    public ClubController(ClubService clubService, MemberService memberService, ServletContext sc) {
        this.clubService = clubService;
        this.memberService = memberService;
        this.sc = sc;
    }

    @GetMapping("form")
    public void form() throws Exception {
    }


    @PostMapping("add")
    public String add(HttpServletRequest request, Club c, HttpSession session) throws Exception {
        String uploadDir = sc.getRealPath("/upload");

        List<Part> partList = new ArrayList<Part>();
        List<Photo> photos = new ArrayList<Photo>();

        if (request.getPart("photo1").getSize() > 0) {
            partList.add(request.getPart("photo1"));
        }
        if (request.getPart("photo2").getSize() > 0) {
            partList.add(request.getPart("photo2"));
        }
        if (request.getPart("photo3").getSize() > 0) {
            partList.add(request.getPart("photo3"));
        }

        for (int i = 0; i < partList.size(); i++) {
            if (partList.get(i).getSize() > 0) {
                photos.add(new Photo());

                String filename = UUID.randomUUID().toString();
                partList.get(i).write(uploadDir + "/" + filename);
                photos.get(i).setName(filename);

                Thumbnails.of(uploadDir + "/" + filename)
                        .size(254, 178)
                        .outputFormat("jpg")
                        .crop(Positions.CENTER)
                        .toFiles(new Rename() {
                            @Override
                            public String apply(String name, ThumbnailParameter param) {
                                return name + "_254x178";
                            }
                        });
            }
        }

        Member loginUser = (Member) session.getAttribute("loginUser");//회원번호로 받기
        c.setWriter(loginUser);

        clubService.add(c);
        int p_cno = clubService.getClubCno().getNo();//같은 p_cno 번호 셋팅
        for (int i = 0; i < photos.size(); i++) {//반복문을 돌려서 갯수만큼 db에 저장

            photos.get(i).setNo(p_cno);//등록된 게시글의 cno값을 출력해서 넣어줌 사짐cno값 넣어줌
            clubService.addWithPhoto(photos.get(i));//클럽 사진 등록 /사진 cno값과 이름값 함께 insert 해준다
        }
        return "redirect:list";
    }

    @GetMapping("delete")
    public String delete(int no, HttpSession session) throws Exception {

        Club oldClub = clubService.get(no);
        if (oldClub == null) {
            throw new Exception("해당 번호의 클럽이 없습니다.");
        }

        Member loginUser = (Member) session.getAttribute("loginUser");
        if (oldClub.getWriter().getNo() != loginUser.getNo() && loginUser.getPower() == 0) {
            throw new Exception("삭제 권한이 없습니다.");
        }

//            운영자가 삭제를 하면 제제횟수+1 과 해당 글을 신고 처리 완료로 한다
//            if (loginUser.getPower() == 1) {
//
//                Club club = clubService.get(no);
//                int count = club.getWriter().getCount() + 1;
//
//                Member member = club.getWriter();
//                member.setCount(count);
//
//                memberService.update(member);
//            }

        clubService.delete(no);
        return "redirect:list";
    }

    @RequestMapping("deleteMember")
    public String deleteMember(int no) throws Exception {
        clubService.deleteMember(no);
        return "redirect:list";
    }

    @RequestMapping("deleteMembers")
    public String deleteMembers(int no, Model model) throws Exception {

        List<Member> clubM = clubService.getMembers(no);

        clubService.deleteMember(no);
        model.addAttribute("clubMembers", clubM);
        return "redirect:list";
    }

    @GetMapping("detail")
    public void detail(int no, HttpSession session, Model model) throws Exception {

        Member loginUser = (Member) session.getAttribute("loginUser");

        Club c = clubService.get(no);
        List<Member> clubM = clubService.getMembers(no);
        c.setNowTotal(clubM.size() + 1);//현재 참여 인원 저장

        model.addAttribute("club", c);
        model.addAttribute("members", memberService.list(null));
        model.addAttribute("clubMembers", clubM);
        model.addAttribute("size", c.getNowTotal());

    }

    @RequestMapping("join")
    public String join(int no, HttpSession session) throws Exception {

        Member loginUser = (Member) session.getAttribute("loginUser");

        HashMap<String, Object> params = new HashMap<>();
        params.put("memberNo", loginUser.getNo());
        params.put("clubNo", no);

        clubService.addWithMember(params);
        return "redirect:list";
    }

    @GetMapping("list")
    public void list(String arrive, String startDate, String endDate, String theme, Model model) throws Exception {
        List<Club> clubs = null;

        if ((arrive != null && arrive.length() > 0) ||
                (startDate != null && startDate.length() > 0) ||
                (endDate != null && endDate.length() > 0) ||
                (theme != null && theme.length() > 0)) {
            clubs = clubService.search(arrive, startDate, endDate, theme);
        } else {
            clubs = clubService.list();
        }

        model.addAttribute("clubs", clubs);
    }

    @RequestMapping("report1")
    public void report1(int no, Model model) throws Exception {

        Club c = clubService.get(no);
        model.addAttribute("club", c);
    }

    @RequestMapping("report")
    public String report(int no, int clubWriterNo, String reason, int result) throws Exception {
        HashMap<String, Object> params = new HashMap<>();
        params.put("memberNo", clubWriterNo);//클럽글 작성자 번호
        params.put("clubNo", no);
        params.put("reason", reason);
        params.put("result", result);

        clubService.addWithReport(params);//신고하는 글과 작성자 번호 보내기
        return "redirect:list";
    }

    @GetMapping("reportList")
    public void reportList(Model model) throws Exception {
        List<Club> clubs = null;
        clubs = clubService.getReports();

        model.addAttribute("clubs", clubs);
        model.addAttribute("members", memberService.list(null));
    }

    @RequestMapping("update")
    public String update(Club c, HttpSession session) throws Exception {

        Club oldClub = clubService.get(c.getNo());

        if (oldClub == null) {
            throw new Exception("해당 번호의 클럽이 없습니다.");
        }

        Member loginUser = (Member) session.getAttribute("loginUser");
        if (oldClub.getWriter().getNo() != loginUser.getNo()) {
            throw new Exception("변경 권한이 없습니다!");
        }

        clubService.update(c);

        return "redirect:list";
    }
}
