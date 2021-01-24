package project.member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project.member.action.Action;
import project.member.command.ActionCommand;
import project.member.dao.MemberDAO;
import project.member.model.MemberVO;

public class MemberModifyService implements Action {

	@Override
	public ActionCommand execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionCommand actionCommand = new ActionCommand();
		MemberDAO memberDAO = new MemberDAO();
		MemberVO memberVO = new MemberVO();
		boolean result = false;
		try {
			HttpSession session = request.getSession();
			String m_id = (String) session.getAttribute("m_id");
			memberVO.setM_id(m_id);
			memberVO.setM_name(request.getParameter("name"));
			memberVO.setM_password(request.getParameter("password"));
			memberVO.setM_email(request.getParameter("email"));
			memberVO.setM_phonenumber(request.getParameter("phonenumber"));
			memberVO.setM_address(request.getParameter("address"));
			result = memberDAO.Modify(memberVO);
			System.out.println(request.getParameter("name"));
			if (result == false) {
				System.out.println("회원정보 수정 실패");
				return null;
			}
			System.out.println("회원정보 수정 완료");
			actionCommand.setRedirect(true);
			actionCommand.setPath("./MyPageService.me?id=" + memberVO.getM_id());
			return actionCommand;
		} catch (

		Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
