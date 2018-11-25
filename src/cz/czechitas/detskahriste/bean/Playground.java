package cz.czechitas.detskahriste.bean;

import java.util.ArrayList;
import java.util.List;

public class Playground {
	private Long idPlayground;
	private String open;
	private String traffic;
	private Location location;
	private List<Photo> photoList;
	private List<Comment> commentList;
	private Double averageRating;
	private Rating rating;

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

	public List<Photo> getPhotoList() {
		return photoList;
	}

	public void setPhotoList(List<Photo> photoList) {
		this.photoList = photoList;
	}

	public List<Comment> getCommentList() {
		return commentList;
	}

	public void setCommentList(List<Comment> commentList) {
		this.commentList = commentList;
	}

	public Double getAverageRating() {
		return averageRating;
	}

	public void setAverageRating(Double averageRating) {
		this.averageRating = averageRating;
	}

	public Rating getRating() {
		return rating;
	}

	public void setRating(Rating rating) {
		this.rating = rating;
	}

	
}
