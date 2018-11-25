package cz.czechitas.detskahriste.bean;

import java.time.LocalDateTime;

public class Comment {
	private Long idComment;
	private String user;
	private String text;
	private LocalDateTime date;

	public Long getIdComment() {
		return idComment;
	}

	public void setIdComment(Long idComment) {
		this.idComment = idComment;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public LocalDateTime getDate() {
		return date;
	}

	public void setDate(LocalDateTime date) {
		this.date = date;
	}

	public Long getIdFKPlayCom() {
		return idFKPlayCom;
	}

	public void setIdFKPlayCom(Long idFKPlayCom) {
		this.idFKPlayCom = idFKPlayCom;
	}

	private Long idFKPlayCom;

}
