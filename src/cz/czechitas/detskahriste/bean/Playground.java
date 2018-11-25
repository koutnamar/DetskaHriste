package cz.czechitas.detskahriste.bean;

import java.util.ArrayList;

public class Playground {
	private Long idPlayground;
	private String open;
	private String traffic;
	private Location location;
	private ArrayList<Photo> photoList;
	private ArrayList<Comment> commentList;
	private Double averageRating;

	public Long getIdPlayground() {
		return idPlayground;
	}

	public void setIdPlayground(Long idPlayground) {
		this.idPlayground = idPlayground;
	}

	public String getOpen() {
		return open;
	}

	public void setOpen(String open) {
		this.open = open;
	}

	public String getTraffic() {
		return traffic;
	}

	public void setTraffic(String traffic) {
		this.traffic = traffic;
	}

	public Location getLocation() {
		return location;
	}

	public void setLocation(Location location) {
		this.location = location;
	}

	public ArrayList<Photo> getPhotoList() {
		return photoList;
	}

	public void setPhotoList(ArrayList<Photo> photoList) {
		this.photoList = photoList;
	}

	public ArrayList<Comment> getCommentList() {
		return commentList;
	}

	public void setCommentList(ArrayList<Comment> commentList) {
		this.commentList = commentList;
	}

	public Double getAverageRating() {
		return averageRating;
	}

	public void setAverageRating(Double averageRating) {
		this.averageRating = averageRating;
	}

}
