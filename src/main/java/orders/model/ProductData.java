package orders.model;

public class ProductData {
   String type,description,shipMethod;
   int length,width,height;
   double weight,declaredValue;
   boolean insurance,signature,packaging;
public ProductData(String type, String description, String shipMethod, int length, int width, int height) {
		super();
		this.type = type;
		this.description = description;
		this.shipMethod = shipMethod;
		this.length = length;
		this.width = width;
		this.height = height;
	}
public String getType() {
	return type;
}
public void setType(String type) {
	this.type = type;
}
public String getDescription() {
	return description;
}
public void setDescription(String description) {
	this.description = description;
}
public String getShipMethod() {
	return shipMethod;
}
public void setShipMethod(String shipMethod) {
	this.shipMethod = shipMethod;
}
public int getLength() {
	return length;
}
public void setLength(int length) {
	this.length = length;
}
public int getWidth() {
	return width;
}
public void setWidth(int width) {
	this.width = width;
}
public int getHeight() {
	return height;
}
public void setHeight(int height) {
	this.height = height;
}
public double getWeight() {
	return weight;
}
public void setWeight(double weight) {
	this.weight = weight;
}
public double getDeclaredValue() {
	return declaredValue;
}
public void setDeclaredValue(double declaredValue) {
	this.declaredValue = declaredValue;
}
public boolean isInsurance() {
	return insurance;
}
public void setInsurance(boolean insurance) {
	this.insurance = insurance;
}
public boolean isSignature() {
	return signature;
}
public void setSignature(boolean signature) {
	this.signature = signature;
}
public boolean isPackaging() {
	return packaging;
}
public void setPackaging(boolean packaging) {
	this.packaging = packaging;
}
   
}
