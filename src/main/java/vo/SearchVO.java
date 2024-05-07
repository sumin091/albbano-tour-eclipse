package vo;


public class SearchVO {
	private String field, keyword, currentPage;
	private int startNum, endNum;
	
	public SearchVO() {

	}

	public SearchVO(String field, String keyword, String currentPage, int startNum, int endNum) {
		super();
		this.field = field;
		this.keyword = keyword;
		this.currentPage = currentPage;
		this.startNum = startNum;
		this.endNum = endNum;
	}

	/**
	 * @return the field
	 */
	public String getField() {
		return field;
	}

	/**
	 * @param field the field to set
	 */
	public void setField(String field) {
		this.field = field;
	}

	/**
	 * @return the keyword
	 */
	public String getKeyword() {
		return keyword;
	}

	/**
	 * @param keyword the keyword to set
	 */
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	/**
	 * @return the currentPage
	 */
	public String getCurrentPage() {
		return currentPage;
	}

	/**
	 * @param currentPage the currentPage to set
	 */
	public void setCurrentPage(String currentPage) {
		this.currentPage = currentPage;
	}

	/**
	 * @return the startNum
	 */
	public int getStartNum() {
		return startNum;
	}

	/**
	 * @param startNum the startNum to set
	 */
	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}

	/**
	 * @return the endNum
	 */
	public int getEndNum() {
		return endNum;
	}

	/**
	 * @param endNum the endNum to set
	 */
	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}

	@Override
	public String toString() {
		return "SearchVO [field=" + field + ", keyword=" + keyword + ", currentPage=" + currentPage + ", startNum="
				+ startNum + ", endNum=" + endNum + "]";
	}
	
	
}
