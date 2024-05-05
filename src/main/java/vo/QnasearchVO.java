package vo;

public class QnasearchVO {
	
	private String currentPage;
	private int StartNum,endNum;
	
	public QnasearchVO(String currentPage, int startNum, int endNum) {
		super();
		this.currentPage = currentPage;
		StartNum = startNum;
		this.endNum = endNum;
	}
	public QnasearchVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(String currentPage) {
		this.currentPage = currentPage;
	}
	public int getStartNum() {
		return StartNum;
	}
	public void setStartNum(int startNum) {
		StartNum = startNum;
	}
	public int getEndNum() {
		return endNum;
	}
	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}
	@Override
	public String toString() {
		return "QnasearchVO [currentPage=" + currentPage + ", StartNum=" + StartNum + ", endNum=" + endNum + "]";
	}

}
