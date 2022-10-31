package kr.co.shop.bean;

public class orderBean {

	private int orderNo;
	private String orderId;
	private int orderProduct;
	private int orderCount;
	private String orderDate;
	
	//추가 필드
	private String name;
	private String ProdName;
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getProdName() {
		return ProdName;
	}
	public void setProdName(String prodName) {
		ProdName = prodName;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public int getOrderProduct() {
		return orderProduct;
	}
	public void setOrderProduct(int orderProduct) {
		this.orderProduct = orderProduct;
	}
	public int getOrderCount() {
		return orderCount;
	}
	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	
	
}
