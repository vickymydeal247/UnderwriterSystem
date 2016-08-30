package bean;


public class ProposalBean 
{

	private String proposalID;

	private String status;

	private Double premiumAmount;
	private String comment;

	

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}
	
	
	public String getProposalID() {
		return proposalID;
	}

	public void setProposalID(String proposalID) {
		this.proposalID = proposalID;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Double getPremiumAmount() {
		return premiumAmount;
	}

	public void setPremiumAmount(Double premiumAmount) {
		this.premiumAmount = premiumAmount;
	}
	
}
