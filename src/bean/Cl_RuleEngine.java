package bean;

public class Cl_RuleEngine {
	


	private String insuranceTypeId;
	private String insuranceTypeName;
	private float g80;
	private float g60l80;
	private float g40l60 ;
	private float l40;
	private float govTax;
	private float genderMale;
	private float genderFemale;
	private float occupationMiningNuclear;
	private float occupationOthers;
	
	public Cl_RuleEngine() {
		super();
	}
	

	public Cl_RuleEngine(String insuranceTypeId, float g80, float g60l80,
			float g40l60, float l40, float govTax, float genderMale,
			float genderFemale, float occupationMiningNuclear,
			float occupationOthers) {
		super();
		this.insuranceTypeId = insuranceTypeId;
		this.g80 = g80;
		this.g60l80 = g60l80;
		this.g40l60 = g40l60;
		this.l40 = l40;
		this.govTax = govTax;
		this.genderMale = genderMale;
		this.genderFemale = genderFemale;
		this.occupationMiningNuclear = occupationMiningNuclear;
		this.occupationOthers = occupationOthers;
	}



	public String getInsuranceTypeId() {
		return insuranceTypeId;
	}


	public void setInsuranceTypeId(String insuranceTypeId) {
		this.insuranceTypeId = insuranceTypeId;
	}


	public float getG80() {
		return g80;
	}


	public void setG80(float g80) {
		this.g80 = g80;
	}


	public float getG60l80() {
		return g60l80;
	}


	public void setG60l80(float g60l80) {
		this.g60l80 = g60l80;
	}


	public float getG40l60() {
		return g40l60;
	}


	public void setG40l60(float g40l60) {
		this.g40l60 = g40l60;
	}


	public float getL40() {
		return l40;
	}


	public void setL40(float l40) {
		this.l40 = l40;
	}


	public float getGovTax() {
		return govTax;
	}


	public void setGovTax(float govTax) {
		this.govTax = govTax;
	}


	public float getGenderMale() {
		return genderMale;
	}


	public void setGenderMale(float genderMale) {
		this.genderMale = genderMale;
	}


	public float getGenderFemale() {
		return genderFemale;
	}


	public void setGenderFemale(float genderFemale) {
		this.genderFemale = genderFemale;
	}


	public float getOccupationMiningNuclear() {
		return occupationMiningNuclear;
	}


	public void setOccupationMiningNuclear(float occupationMiningNuclear) {
		this.occupationMiningNuclear = occupationMiningNuclear;
	}


	public float getOccupationOthers() {
		return occupationOthers;
	}


	public void setOccupationOthers(float occupationOthers) {
		this.occupationOthers = occupationOthers;
	}


	public String getInsuranceTypeName() {
		
		return insuranceTypeName;
	}


	public void setInsuranceTypeName(String insuranceTyprName) {
		this.insuranceTypeName=insuranceTyprName;
		
	}

	
}	
