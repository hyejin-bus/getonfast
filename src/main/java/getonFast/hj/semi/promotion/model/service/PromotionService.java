package getonFast.hj.semi.promotion.model.service;

import static getonFast.hj.semi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import getonFast.hj.semi.main.model.vo.SpaceList;
import getonFast.hj.semi.promotion.model.dao.PromotionDAO;
import getonFast.hj.semi.promotion.model.vo.Promotion;

public class PromotionService {
	
	private PromotionDAO dao = new PromotionDAO();
	
	/**
	 * 기획전 조회
	 * @return promotionList
	 * @throws Exception
	 */
	public List<Promotion> selectPromotionList() throws Exception {
		Connection conn = getConnection();
		
		List<Promotion> promotionList = dao.selectPromotionList(conn);
		
		close(conn);
		
		return promotionList;
	}

	public List<SpaceList> selectProDetailList(int exNo) throws Exception{
		Connection conn = getConnection();		
		
		List<SpaceList> resultList = dao.selectProDetailList(conn,exNo);
		
		close(conn);
		return resultList;
	}

	public Promotion ProDetailTitle(int exNo) throws Exception {
		Connection conn = getConnection();
		
		Promotion title = dao.selectProDetailTitle(conn, exNo);
		
		close(conn);
		return title;
		
	}
}
