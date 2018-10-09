
public interface CalculatorState {

	public void addDigit(int i);	//Buttons 0-9
	public void addOperator();		//Addition
	public void subOperator();		//Subtraction
	public void multOperator();		//Multiplication
	public void divOperator();		//Division
	public void dotOperator();		//Decimal Point
	public void signOperator();		//Changing Signs (Pos/Neg)
	public void rootOperator();		//Square Root
	public void sqrdOperator();		//Squared (x^2)
	public void inverseOperator();	//Inverse
	public void clearAll();			//Clear All
	public void clear();			//Clear Current
	public void delete();			//Delete
	public void equalsOperator();	//Equals
}
