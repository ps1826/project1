package project.member.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.member.action.Action;
import project.member.command.ActionCommand;
import project.member.dao.MemberDAO;

public class IdCheck implements Action{

	@Override
	public ActionCommand execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
//			ActionCommand actionCommand = new ActionCommand();
			MemberDAO memberDAO = new MemberDAO();
			
			boolean result = false;
			
			try {
				String m_id = request.getParameter("id");
				System.out.println(m_id);
				if (m_id.equals("")) {
					System.out.println("아이디가 담기지 않았습니다.");
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.print(2);
					out.close();
					return null;
				}
				
				result = memberDAO.IdCheck(m_id);
				if (result == false) {
					System.out.println("이미 있는 아이디입니다.");
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.print(0);
					out.close();
//					actionCommand.setRedirect(false);
//					actionCommand.setPath("./member/member.jsp");
					
					return null;
				} else {
				request.setAttribute("checkId", m_id);
				System.out.println("중복체크 완료되었습니다.");
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.print(1);
				out.close();
//				actionCommand.setRedirect(false);
//				actionCommand.setPath("./member/member.jsp");
				return null;
				}
				
			} catch (Exception e) {
				
			}
		return null;
	}

}
