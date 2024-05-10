package vo;

import java.util.Date;

public class SpotListVO {
	private String spot_code, spot_name, spot_desc, img_name, spt_loc;
	private Date create_date;
	private Double longitude, latitude;
	private String[] spots;
	

	public String[] getSpots() {
		return spots;
	}
	public void setSpots(String[] spots) {
		this.spots = spots;
	}
	
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
	

	

	public SpotListVO(String spot_name) {
		this.spot_name = spot_name;
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
		return spot_name +"  ";
	}
	

}
