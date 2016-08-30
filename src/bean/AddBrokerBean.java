package bean;

public class AddBrokerBean 

{

	private String brokerName;
	private String address;
	private String city;
	private String state;
	private long zipcode;
	private long phone;
	private String brokerID; 
	private int brokeragePoint;
	public String getBrokerName() {
		return brokerName;
	}
	public void setBrokerName(String brokerName) {
		this.brokerName = brokerName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	public long getZipcode() {
		return zipcode;
	}
	public void setZipcode(long zipcode) {
		this.zipcode = zipcode;
	}
	public long getPhone() {
		return phone;
	}
	public void setPhone(long phone) {
		this.phone = phone;
	}
	public String getBrokerID() {
		return brokerID;
	}
	public void setBrokerID(String brokerID) {
		this.brokerID = brokerID;
	}
	public int getBrokeragePoint() {
		return brokeragePoint;
	}
	public void setBrokeragePoint(int brokeragePoint) {
		this.brokeragePoint = brokeragePoint;
	}
	
}
