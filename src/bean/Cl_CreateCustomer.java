package bean;

public class Cl_CreateCustomer {
	
	private String customerType;
	private String customerName;
	private String occupation;
	private int age;
	private String gender;
	private String address;
	private String city;
	private String state;
	private String zipCode;
	private String phoneNumber;
	
	

	public Cl_CreateCustomer(String customerType, String customerName,
			String occupation, int age, String gender, String address,
			String city, String state, String zipCode, String phoneNumber) {
		super();
		this.customerType = customerType;
		this.customerName = customerName;
		this.occupation = occupation;
		this.age = age;
		this.gender = gender;
		this.address = address;
		this.city = city;
		this.state = state;
		this.zipCode = zipCode;
		this.phoneNumber = phoneNumber;
	}

	public Cl_CreateCustomer() {
		// TODO Auto-generated constructor stub
	}

	public String getCustomerType() {
		return customerType;
	}

	public void setCustomerType(String customerType) {
		this.customerType = customerType;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getOccupation() {
		return occupation;
	}

	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
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

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	
	
}
