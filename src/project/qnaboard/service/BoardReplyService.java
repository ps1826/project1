package project.qnaboard.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import project.qnaboard.action.Action;
import project.qnaboard.command.ActionCommand;
import project.qnaboard.dao.BoardDAO;
import project.qnaboard.model.BoardVO;

public class BoardReplyService implements Action {

	@Override
	public ActionCommand execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionCommand actionCommand = new ActionCommand();
		BoardDAO boardDAO = new BoardDAO();
		BoardVO boardDTO = new BoardVO();
		int result = 0;
		String realFolder = "";
		String saveFolder = "./qnaboardUpload";
		int fileSize = 10 * 1024 * 1024;
		realFolder = request.getSession().getServletContext().getRealPath(saveFolder);
		//System.out.println("보드리플 서비스");
		try {
			MultipartRequest multiReques = new MultipartRequest(request, realFolder, fileSize, "UTF-8",
					new DefaultFileRenamePolicy());
			boardDTO.setNum(Integer.parseInt(multiReques.getParameter("num")));
			boardDTO.setM_id(multiReques.getParameter("m_id"));
			boardDTO.setSubject(multiReques.getParameter("subject"));
			boardDTO.setContent(multiReques.getParameter("content"));
			boardDTO.setAnswer_num(Integer.parseInt(multiReques.getParameter("answer_num")));
			boardDTO.setAnswer_lev(Integer.parseInt(multiReques.getParameter("answer_lev")));
			boardDTO.setAnswer_seq(Integer.parseInt(multiReques.getParameter("answer_seq")));
			boardDTO.setAttached_file(multiReques.getFilesystemName((String) multiReques.getFileNames().nextElement()));

			result = boardDAO.boardReply(boardDTO);
			if (result == 0) {
				System.out.println("답변 실패");
				return null;
			}
			System.out.println("답변 성공");
			actionCommand.setRedirect(true);
			actionCommand.setPath("./BoardDetail.qa?num=" + result);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return actionCommand;
	}

}
