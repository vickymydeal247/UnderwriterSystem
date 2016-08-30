package bean;

public class Cl_CreateProposal {
	private String customerId;
	private String insuranceTypeId;
	
	private double sumInsured;
	private int numberOfYears;
	private String insuranceProduct;
	private String referredBy;
	
	public Cl_CreateProposal() {
		super();
	}

	
	public String getInsuranceTypeId() {
		return insuranceTypeId;
	}

	public void setInsuranceTypeId(String insuranceTypeId) {
		this.insuranceTypeId = insuranceTypeId;
	}
	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	
	


	public double getSumInsured() {
		return sumInsured;
	}
	public void setSumInsured(double sumInsured) {
		this.sumInsured = sumInsured;
	}
	
	public int getNumberOfYears() {
		return numberOfYears;
	}

	public void setNumberOfYears(int numberOfYears) {
		this.numberOfYears = numberOfYears;
	}

	public String getInsuranceProduct() {
		return insuranceProduct;
	}
	public void setInsuranceProduct(String insuranceProduct) {
		this.insuranceProduct = insuranceProduct;
	}
	public String getReferredBy() {
		return referredBy;
	}
	public void setReferredBy(String referredBy) {
		this.referredBy = referredBy;
	}
	
}
