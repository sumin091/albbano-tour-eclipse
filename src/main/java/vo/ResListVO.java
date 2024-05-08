package vo;

import java.sql.Date;

public class ResListVO {
	
	private String res_code,res_cat,res_name,holiday,busi_hour,res_loc,img_name;
	private Date create_date,edit_date;
	private double longitude,latitude;
	private String del_yn;
	private String intro;
	
	private String res_doc_no, res_title, res_contents, id;
	
	
	private int cnt;
	
	
	public ResListVO() {
	
	}

	public ResListVO(String res_code, String res_cat, String res_name, String holiday, String busi_hour, String res_loc,
			String img_name, Date create_date, Date edit_date, double longitude, double latitude, String del_yn,
			String intro) {
		super();
		this.res_code = res_code;
		this.res_cat = res_cat;
		this.res_name = res_name;
		this.holiday = holiday;
		this.busi_hour = busi_hour;
		this.res_loc = res_loc;
		this.img_name = img_name;
		this.create_date = create_date;
		this.edit_date = edit_date;
		this.longitude = longitude;
		this.latitude = latitude;
		this.del_yn = del_yn;
		this.intro = intro;
	}
	
	
	public ResListVO(int cnt,String res_code, String img_name, Date create_date, String res_doc_no, String res_title,
			String res_contents, String id) {
		super();
		this.cnt = cnt;
		this.res_code = res_code;
		this.img_name = img_name;
		this.create_date = create_date;
		this.res_doc_no = res_doc_no;
		this.res_title = res_title;
		this.res_contents = res_contents;
		this.id = id;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public String getRes_doc_no() {
		return res_doc_no;
	}

	public void setRes_doc_no(String res_doc_no) {
		this.res_doc_no = res_doc_no;
	}

	public String getRes_title() {
		return res_title;
	}

	public void setRes_title(String res_title) {
		this.res_title = res_title;
	}

	public String getRes_contents() {
		return res_contents;
	}

	public void setRes_contents(String res_contents) {
		this.res_contents = res_contents;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getRes_code() {
		return res_code;
	}

	public void setRes_code(String res_code) {
		this.res_code = res_code;
	}

	public String getRes_cat() {
		return res_cat;
	}

	public void setRes_cat(String res_cat) {
		this.res_cat = res_cat;
	}

	public String getRes_name() {
		return res_name;
	}

	public void setRes_name(String res_name) {
		this.res_name = res_name;
	}

	public String getHoliday() {
		return holiday;
	}

	public void setHoliday(String holiday) {
		this.holiday = holiday;
	}

	public String getBusi_hour() {
		return busi_hour;
	}

	public void setBusi_hour(String busi_hour) {
		this.busi_hour = busi_hour;
	}

	public String getRes_loc() {
		return res_loc;
	}

	public void setRes_loc(String res_loc) {
		this.res_loc = res_loc;
	}

	public String getImg_name() {
		return img_name;
	}

	public void setImg_name(String img_name) {
		this.img_name = img_name;
	}

	public Date getCreate_date() {
		return create_date;
	}

	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}

	public Date getEdit_date() {
		return edit_date;
	}

	public void setEdit_date(Date edit_date) {
		this.edit_date = edit_date;
	}

	public double getLongitude() {
		return longitude;
	}

	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}

	public double getLatitude() {
		return latitude;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	public String getDel_yn() {
		return del_yn;
	}

	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	@Override
	public String toString() {
		return "ResListVO [res_code=" + res_code + ", res_cat=" + res_cat + ", res_name=" + res_name + ", holiday="
				+ holiday + ", busi_hour=" + busi_hour + ", res_loc=" + res_loc + ", img_name=" + img_name
				+ ", create_date=" + create_date + ", edit_date=" + edit_date + ", longitude=" + longitude
				+ ", latitude=" + latitude + ", del_yn=" + del_yn + ", intro=" + intro + ", res_doc_no=" + res_doc_no
				+ ", res_title=" + res_title + ", res_contents=" + res_contents + ", id=" + id + ", cnt=" + cnt + "]";
	}
	
	
	
	
}
