package cz.czechitas.detskahriste.bean;

public class Photo {
	private Long idPhoto;
	private String namePhoto;
	private String path;
	private Long idFkPlayPhoto;

	public Long getIdPhoto() {
		return idPhoto;
	}

	public void setIdPhoto(Long idPhoto) {
		this.idPhoto = idPhoto;
	}

	public String getNamePhoto() {
		return namePhoto;
	}

	public void setNamePhoto(String namePhoto) {
		this.namePhoto = namePhoto;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public Long getIdFkPlayPhoto() {
		return idFkPlayPhoto;
	}

	public void setIdFkPlayPhoto(Long idFkPlayPhoto) {
		this.idFkPlayPhoto = idFkPlayPhoto;
	}

}
