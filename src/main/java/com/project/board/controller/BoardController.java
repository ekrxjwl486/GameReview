package com.project.board.controller;

import com.project.board.service.BoardService;
import com.project.board.vo.BoardVo;
import com.project.board.vo.RiderBoardVo;
import com.project.menus.service.MenuService;
import com.project.menus.vo.MenuVo;
import com.project.reply.service.ReplyService;
import com.project.reply.vo.ReplyVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.sql.SQLOutput;
import java.util.HashMap;
import java.util.List;

@Controller
public class BoardController {

    @Autowired
    BoardService boardService;
    @Autowired
    MenuService menuService;


    @Autowired
    ReplyService replyService;


   // 해주세요 게시판 글 전체 조회

    @RequestMapping("/Board/customerList")
    public String CustomerboardList(Model model, @RequestParam HashMap<String,Object> map){

        List<MenuVo>  menuList  = menuService.getMenuList();
        List<BoardVo> boardList = boardService.getCustomerBoardList(map);
        model.addAttribute("boardList", boardList);
        model.addAttribute("menuList", menuList);

        return "ctmboard/customerList";
    }

    // 할게여 게시판 글 전체 조회

    @RequestMapping("/Board/riderList")
    public String RiderboardList(Model model, @RequestParam HashMap<String,Object> map){

        List<MenuVo>  menuList  = menuService.getMenuList();
        List<BoardVo> boardList = boardService.getRiderBoardList(map);
        model.addAttribute("boardList", boardList);
        model.addAttribute("menuList", menuList);

        return "riderboard/riderList";
    }


    //게시글 수정
    @RequestMapping("/Board/UpdateForm")
    public String updateform(@RequestParam HashMap<String, Object> map, Model model){

        BoardVo boardVo   =  boardService.DetailCustomer(map);
        String menu_id = (String) map.get("menu_id");

        model.addAttribute("boardVo", boardVo);


        return "ctmboard/update";
    }


    // 후기 게시판
    @RequestMapping("/Board/reviewList")
    public String latterList(Model model, @RequestParam HashMap<String,Object> map){


        List<MenuVo>  menuList  = menuService.getMenuList();
        List<BoardVo> boardList = boardService.getCustomerBoardList(map);
        model.addAttribute("boardList", boardList);
        model.addAttribute("menuList", menuList);

        return "reviewboard/reviewList";
    }

    //해주세요 게시판 글 작성 페이지

    @RequestMapping("/Board/CBoardWriteForm")
    public String CBoardwriteform(BoardVo boardVo, Model model){
        String menu_id = boardVo.getMenu_id();System.out.println(menu_id);


        model.addAttribute("menu_id",menu_id);
        return "ctmboard/CBoardwrite";
    }

    //해주세요 게시판 글 작성

    @RequestMapping("/Board/CBoardWrite")
    public String write(BoardVo boardVo) {
        boardService.C_insertboard(boardVo);

        return "redirect:/Board/customerList?menu_id=" + boardVo.getMenu_id();
    }
     
    
    //할게요 게시판 글 작성 페이지
    @RequestMapping("/Board/RBoardWriteForm")
    public String RBoardwriteform(RiderBoardVo riderboardVo, Model model){
        String menu_id = riderboardVo.getMenu_id();

        model.addAttribute("menu_id",menu_id);
        return "riderboard/RBoardwrite";
    }


    //리뷰게시판 글 작성 페이지
    @RequestMapping("/Board/RBoardWrite")
    public String RBoardwrite(RiderBoardVo riderboardVo) {
        boardService.R_insertboard(riderboardVo);

        return "redirect:/Board/riderList?menu_id=" + riderboardVo.getMenu_id();
    }


    //리뷰게시판 글 작성
    @RequestMapping("/Board/RVBoardWriteForm")
    public String RvBoardwriteform(RiderBoardVo riderboardVo, Model model){
        String menu_id = riderboardVo.getMenu_id();

        model.addAttribute("menu_id",menu_id);
        return "reviewboard/RVBoardwrite";
    }

//    @RequestMapping("/Board/RVBoardWrite")
//    public String RvVBoardwrite(BoardVo boardVo) {
//
//        boardService.RV_insertboard(riderboardVo);
//
//
//        return "redirect:/Board/customerList?menu_id=" + riderboardVo.getMenu_id();
//    }



    // 게시글 상세조회, 댓글 리스트 조회
    @RequestMapping("/Board/CustomerDetail")
    public String Customerdetail(	@RequestParam HashMap<String, Object> map, Model model, MenuVo menuVo){
        String menu_id = (String) map.get("menu_id");
        System.out.println(map);
        BoardVo boardVo =  boardService.DetailCustomer(map);

        model.addAttribute("boardVo", boardVo);
        model.addAttribute("menu_id",menu_id);

        List<ReplyVo> replylist = replyService.getReplylist(boardVo.getBoard_number());
        model.addAttribute("replylist", replylist);

        return "ctmboard/customerdetail";
    }

    @RequestMapping("/Board/riderDetail")
    public String riderdetail(	@RequestParam HashMap<String, Object> map, Model model){
        String menu_id = (String) map.get("menu_id");
        System.out.println(map);
        RiderBoardVo riderBoardVo =  boardService.DetailRider(map);

        model.addAttribute("riderBoardVo", riderBoardVo);
        model.addAttribute("menu_id",menu_id);

        List<ReplyVo> replylist = replyService.getReplylist(riderBoardVo.getBoard_number());
        model.addAttribute("replylist", replylist);

        return "riderboard/riderdetail";
    }


    // 고객게시판 댓글 작성
    @RequestMapping("/Board/CtmreplyWrite")
    public String ctm_replyWrite(ReplyVo replyVo,BoardVo boardVo){
        System.out.println(replyVo);
        replyService.writeReply(replyVo);
     return "redirect:/Board/CustomerDetail?board_number=" + boardVo.getBoard_number();
    }

    @RequestMapping("/Board/RidreplyWrite")
    public String rider_replyWrite(ReplyVo replyVo,RiderBoardVo riderBoardVo){

        System.out.println(replyVo);
        replyService.RiderwriteReply(replyVo);
        return "redirect:/Board/riderdetail?board_number=" + riderBoardVo.getBoard_number();
    }



}
