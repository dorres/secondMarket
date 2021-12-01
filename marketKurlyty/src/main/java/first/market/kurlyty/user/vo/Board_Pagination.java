package first.market.kurlyty.user.vo;

import lombok.Data;

@Data
public class Board_Pagination {
	private int listSize = 10;               //珥덇린媛믪쑝濡� 紐⑸줉媛쒖닔瑜� 10�쑝濡� �뀑�똿
	private int rangeSize = 5;            //珥덇린媛믪쑝濡� �럹�씠吏�踰붿쐞瑜� 10�쑝濡� �뀑�똿
	private int page;
	private int range;
	private int listCnt;
	private int pageCnt;
	private int startPage;
	private int startList;
	private int endPage;
	private boolean prev;
	private boolean next;
	private String user_id;

	private User_order_listVO User_order_listVO;
	
	public int getRangeSize() {
		return rangeSize;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getRange() {
		return range;
	}

	public void setRange(int range) {
		this.range = range;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getListSize() {
		return listSize;
	}

	public void setListSize(int listSize) {
		this.listSize = listSize;
	}
	
	public int getListCnt() {
		return listCnt;
	}

	public void setListCnt(int listCnt) {
		this.listCnt = listCnt;
	}
	
	public int getStartList() {
		return startList;
	}

	public void pageInfo(int page, int range, int listCnt) {
		this.page = page;
		this.range = range;
		this.listCnt = listCnt;
		
		//�쟾泥� �럹�씠吏��닔 
		this.pageCnt = (int) Math.ceil((double)listCnt/listSize);

		
		//�떆�옉 �럹�씠吏�
		this.startPage = (range - 1) * rangeSize + 1 ;
		
		//�걹 �럹�씠吏�
		this.endPage = range * rangeSize;
				
		//寃뚯떆�뙋 �떆�옉踰덊샇
		this.startList = (page - 1) * listSize;
		
		//�씠�쟾 踰꾪듉 �긽�깭
		this.prev = range == 1 ? false : true;
		
		//�떎�쓬 踰꾪듉 �긽�깭
		this.next = pageCnt > endPage ? true : false;

		if (this.endPage > this.pageCnt) {
			this.endPage = this.pageCnt;
			this.next = false;
		}
	}
}
