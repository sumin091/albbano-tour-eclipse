package vo;

import java.util.Date;

public class SpotListVO {
	private String spot_code, spot_name, spot_desc, img_name, spt_loc;
	private Date create_date;
	private Double longitude, latitude;
	
	private String spot_doc_no, spot_title, id, spot_contents;
	private Date edit_date;
	
	public SpotListVO() {
		
	}
	public SpotListVO(String spot_code, String spot_name, String spot_desc, String img_name, String spt_loc,
			Date create_date, Double longitude, Double latitude) {
		super();
		this.spot_code = spot_code;
		this.spot_name = spot_name;
		this.spot_desc = spot_desc;
		this.img_name = img_name;
		this.spt_loc = spt_loc;
		this.create_date = create_date;
		this.longitude = longitude;
		this.latitude = latitude;
	}
	

	public SpotListVO(String spot_code, String img_name, Date create_date, String spot_doc_no, String spot_title, String id,
			String spot_contents, Date edit_date) {
		super();
		this.spot_code = spot_code;
		this.img_name = img_name;
		this.create_date = create_date;
		this.spot_doc_no = spot_doc_no;
		this.spot_title = spot_title;
		this.id = id;
		this.spot_contents = spot_contents;
		this.edit_date = edit_date;
	}
	
	
	public String getSpot_doc_no() {
		return spot_doc_no;
	}
	public void setSpot_doc_no(String spot_doc_no) {
		this.spot_doc_no = spot_doc_no;
	}
	public String getSpot_title() {
		return spot_title;
	}
	public void setSpot_title(String spot_title) {
		this.spot_title = spot_title;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSpot_contents() {
		return spot_contents;
	}
	public void setSpot_contents(String spot_contents) {
		this.spot_contents = spot_contents;
	}
	public Date getEdit_date() {
		return edit_date;
	}
	public void setEdit_date(Date edit_date) {
		this.edit_date = edit_date;
	}
	public String getSpot_code() {
		return spot_code;
	}
	public void setSpot_code(String spot_code) {
		this.spot_code = spot_code;
	}
	public String getSpot_name() {
		return spot_name;
	}
	public void setSpot_name(String spot_name) {
		this.spot_name = spot_name;
	}
	public String getSpot_desc() {
		return spot_desc;
	}
	public void setSpot_desc(String spot_desc) {
		this.spot_desc = spot_desc;
	}
	public String getImg_name() {
		return img_name;
	}
	public void setImg_name(String img_name) {
		this.img_name = img_name;
	}
	public String getSpt_loc() {
		return spt_loc;
	}
	public void setSpt_loc(String spt_loc) {
		this.spt_loc = spt_loc;
	}
	public Date getCreate_date() {
		return create_date;
	}
	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}
	public Double getLongitude() {
		return longitude;
	}
	public void setLongitude(Double longitude) {
		this.longitude = longitude;
	}
	public Double getLatitude() {
		return latitude;
	}
	public void setLatitude(Double latitude) {
		this.latitude = latitude;
	}
	@Override
	public String toString() {
		return "SpotListVO [spot_code=" + spot_code + ", spot_name=" + spot_name + ", spot_desc=" + spot_desc
				+ ", img_name=" + img_name + ", spt_loc=" + spt_loc + ", create_date=" + create_date + ", longitude="
				+ longitude + ", latitude=" + latitude + ", spot_doc_no=" + spot_doc_no + ", spot_title=" + spot_title
				+ ", id=" + id + ", spot_contents=" + spot_contents + ", edit_date=" + edit_date + "]";
	}
	

}
