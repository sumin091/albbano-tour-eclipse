package vo;

import java.util.Arrays;
import java.util.Date;

public class CourseManagementVO {
	private String crsCode, crsName, crsDesc, imgName;
	private Date createDate;
	private String[] crsSpots;
	private int fare;
	private char delYn;
	
	public CourseManagementVO(String crsCode, String crsName, String crsDesc, String imgName, Date createDate,
			String[] crsSpots, int fare, char delYn) {
		super();
		this.crsCode = crsCode;
		this.crsName = crsName;
		this.crsDesc = crsDesc;
		this.imgName = imgName;
		this.createDate = createDate;
		this.crsSpots = crsSpots;
		this.fare = fare;
		this.delYn = delYn;
	}
	
	public CourseManagementVO(String crsName) {
		super();
		this.crsName = crsName;
	}

	public CourseManagementVO() {
	}
	public String getCrsCode() {
		return crsCode;
	}
	public void setCrsCode(String crsCode) {
		this.crsCode = crsCode;
	}
	public String getCrsName() {
		return crsName;
	}
	public void setCrsName(String crsName) {
		this.crsName = crsName;
	}
	public String getCrsDesc() {
		return crsDesc;
	}
	public void setCrsDesc(String crsDesc) {
		this.crsDesc = crsDesc;
	}
	public String getImgName() {
		return imgName;
	}
	public void setImgName(String imgName) {
		this.imgName = imgName;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public int getFare() {
		return fare;
	}
	public void setFare(int fare) {
		this.fare = fare;
	}
	public char getDelYn() {
		return delYn;
	}
	public void setDelYn(char delYn) {
		this.delYn = delYn;
	}
	public String[] getCrsSpots() {
		return crsSpots;
	}
	public void setCrsSpots(String[] crsSpots) {
		this.crsSpots = crsSpots;
	}
	@Override
	public String toString() {
		return "CourseManagementVO [crsCode=" + crsCode + ", crsName=" + crsName + ", crsDesc=" + crsDesc + ", imgName="
				+ imgName + ", createDate=" + createDate + ", crsSpots=" + Arrays.toString(crsSpots) + ", fare=" + fare
				+ ", delYn=" + delYn + "]";
	}
	
}
