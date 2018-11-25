package cz.czechitas.detskahriste.bean;

public class Rating {
	public Long idRating;
	public Double equipment;
	public Double tidiness;
	public Double safety;
	public Double environment;
	public Double restZone;
	public Long idFkPlayRating;

	public Long getIdRating() {
		return idRating;
	}

	public void setIdRating(Long idRating) {
		this.idRating = idRating;
	}

	public Double getEquipment() {
		return equipment;
	}

	public void setEquipment(Double equipment) {
		this.equipment = equipment;
	}

	public Double getTidiness() {
		return tidiness;
	}

	public void setTidiness(Double tidiness) {
		this.tidiness = tidiness;
	}

	public Double getSafety() {
		return safety;
	}

	public void setSafety(Double safety) {
		this.safety = safety;
	}

	public Double getEnvironment() {
		return environment;
	}

	public void setEnvironment(Double environment) {
		this.environment = environment;
	}

	public Double getRestZone() {
		return restZone;
	}

	public void setRestZone(Double restZone) {
		this.restZone = restZone;
	}

	public Long getIdFkPlayRating() {
		return idFkPlayRating;
	}

	public void setIdFkPlayRating(Long idFkPlayRating) {
		this.idFkPlayRating = idFkPlayRating;
	}

}
