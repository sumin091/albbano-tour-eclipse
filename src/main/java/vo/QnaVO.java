package vo;

import java.util.Date;


public class QnaVO {
	
	private String ASK_DOC_NO, ID, ASK_TITLE,ASK_CONTENTS,DEL_YN,ANSWER_CONTENTS;
	private Date CREATE_DATE, ANSWER_DATE;
	
	
	public QnaVO() {
	
	}


	public String getASK_DOC_NO() {
		return ASK_DOC_NO;
	}


	public void setASK_DOC_NO(String aSK_DOC_NO) {
		ASK_DOC_NO = aSK_DOC_NO;
	}


	public String getID() {
		return ID;
	}


	public void setID(String iD) {
		ID = iD;
	}


	public String getASK_TITLE() {
		return ASK_TITLE;
	}


	public void setASK_TITLE(String aSK_TITLE) {
		ASK_TITLE = aSK_TITLE;
	}


	public String getASK_CONTENTS() {
		return ASK_CONTENTS;
	}


	public void setASK_CONTENTS(String aSK_CONTENTS) {
		ASK_CONTENTS = aSK_CONTENTS;
	}


	public String getDEL_YN() {
		return DEL_YN;
	}


	public void setDEL_YN(String dEL_YN) {
		DEL_YN = dEL_YN;
	}


	public String getANSWER_CONTENTS() {
		return ANSWER_CONTENTS;
	}


	public void setANSWER_CONTENTS(String aNSWER_CONTENTS) {
		ANSWER_CONTENTS = aNSWER_CONTENTS;
	}


	public Date getCREATE_DATE() {
		return CREATE_DATE;
	}


	public void setCREATE_DATE(Date cREATE_DATE) {
		CREATE_DATE = cREATE_DATE;
	}


	public Date getANSWER_DATE() {
		return ANSWER_DATE;
	}


	public void setANSWER_DATE(Date aNSWER_DATE) {
		ANSWER_DATE = aNSWER_DATE;
	}


	public QnaVO(String aSK_DOC_NO, String iD, String aSK_TITLE, String aSK_CONTENTS, String dEL_YN,
			String aNSWER_CONTENTS, Date cREATE_DATE, Date aNSWER_DATE) {
		super();
		this.ASK_DOC_NO = aSK_DOC_NO;
		this.ID = iD;
		this.ASK_TITLE = aSK_TITLE;
		this.ASK_CONTENTS = aSK_CONTENTS;
		this.DEL_YN = dEL_YN;
		this.ANSWER_CONTENTS = aNSWER_CONTENTS;
		this.CREATE_DATE = cREATE_DATE;
		this.ANSWER_DATE = aNSWER_DATE;
	}


	@Override
	public String toString() {
		return "QnaVO [ASK_DOC_NO=" + ASK_DOC_NO + ", ID=" + ID + ", ASK_TITLE=" + ASK_TITLE + ", ASK_CONTENTS="
				+ ASK_CONTENTS + ", DEL_YN=" + DEL_YN + ", ANSWER_CONTENTS=" + ANSWER_CONTENTS + ", CREATE_DATE="
				+ CREATE_DATE + ", ANSWER_DATE=" + ANSWER_DATE + "]";
	}
	
	
	
	
	

	
	
}
