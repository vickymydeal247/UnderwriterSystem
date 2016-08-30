package bean;



import java.sql.Date;

public class Cl_AddClaim {
	private String claimId;
	private String customerId;
	private String policyId;
	private double claimAmount;
	private Date paymentDate;
	
	

	public Cl_AddClaim(String claimId, String customerId, String policyId,
			double claimAmount, Date paymentDate) {
		super();
		this.claimId = claimId;
		this.customerId = customerId;
		this.policyId = policyId;
		this.claimAmount = claimAmount;
		this.paymentDate = paymentDate;
	}
	
	public Cl_AddClaim() {
		// TODO Auto-generated constructor stub
	}

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	public String getPolicyId() {
		return policyId;
	}

	public void setPolicyId(String policyId) {
		this.policyId = policyId;
	}

	public String getClaimId() {
		return claimId;
	}
	public void setClaimId(String claimId) {
		this.claimId = claimId;
	}
	public double getClaimAmount() {
		return claimAmount;
	}
	public void setClaimAmount(double claimAmount) {
		this.claimAmount = claimAmount;
	}
	public Date getPaymentDate() {
		return paymentDate;
	}
	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}
	
}
