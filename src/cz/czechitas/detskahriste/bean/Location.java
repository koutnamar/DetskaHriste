package cz.czechitas.detskahriste.bean;

public class Location {
	private String street;
	private String city;
	private String latitude;
	private String longtitude;
	private Long idFkPlayLoc;

	public String getStreet() {
		return street ;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getLongtitude() {
		return longtitude;
	}

	public void setLongtitude(String longtitude) {
		this.longtitude = longtitude;
	}

	public Long getIdFkPlayLoc() {
		return idFkPlayLoc;
	}

	public void setIdFkPlayLoc(Long idFkPlayLoc) {
		this.idFkPlayLoc = idFkPlayLoc;
	}

}
