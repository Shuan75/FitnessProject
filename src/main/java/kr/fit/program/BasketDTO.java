package kr.fit.program;

public class BasketDTO {

	private String b_num;
	private String b_id;
	private String b_code;
	private String b_price;
	private int    b_amount;
	private String b_name;
	
	
	
	public String getB_name() {
		return b_name;
	}


	public void setB_name(String b_name) {
		this.b_name = b_name;
	}


	public BasketDTO() {
		
	}


	public String getB_num() {
		return b_num;
	}


	public void setB_num(String b_num) {
		this.b_num = b_num;
	}


	public String getB_id() {
		return b_id;
	}


	public void setB_id(String b_id) {
		this.b_id = b_id;
	}


	public String getB_code() {
		return b_code;
	}


	public void setB_code(String b_code) {
		this.b_code = b_code;
	}


	public String getB_price() {
		return b_price;
	}


	public void setB_price(String b_price) {
		this.b_price = b_price;
	}


	public int getB_amount() {
		return b_amount;
	}


	public void setB_amount(int b_amount) {
		this.b_amount = b_amount;
	}


	@Override
	public String toString() {
		return "BasketDTO [b_num=" + b_num + ", b_id=" + b_id + ", b_code=" + b_code + ", b_price=" + b_price
				+ ", b_amount=" + b_amount + ", b_name=" + b_name + "]";
	}


	
	
	
	
}//class end
