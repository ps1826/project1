package project.basket.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project.basket.DAO.BasketDAO;
//import project.product.model.ProductVO;


public class BasketAddService implements BasketAction{

	@Override
	public BasketActionCommand execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		BasketDAO DAO = new BasketDAO();
		//BasketVO VO = new BasketVO();
		boolean result = false;
		BasketActionCommand actionCommand = new BasketActionCommand();
		try {
		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("m_id");
		int goods_num=Integer.parseInt(request.getParameter("goods_num"));
		
//		ProductVO productVO = new ProductVO();
//		productVO = DAO.getGetbasketid(goods_num);
//		result = DAO.getBasketInsert(productVO, m_id);
		result = DAO.basketAdd(goods_num, m_id);
		System.out.println("나왔음");
		if (result ==false) {
			System.out.println("게시판 등록 실패");
			return null;
		}
		System.out.println("게시판 등록 완료");
		actionCommand.setRedirect(true);
		actionCommand.setPath("./ProductList.pr");
		return actionCommand;
	} catch (Exception ex) {
		ex.printStackTrace();
	}
		return null;
}

}
