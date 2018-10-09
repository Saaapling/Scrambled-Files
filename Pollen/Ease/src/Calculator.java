
import javafx.application.*;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.scene.*;
import javafx.scene.control.*;
import javafx.stage.*;
import javafx.scene.layout.*;
import javafx.geometry.*;
import java.text.*;

@SuppressWarnings({"restriction"})

/*
 * Group members: 
 * Nicholas Zou
 * Francis Poon
 * Adharsh Babu(oon)
 */

public class Calculator extends Application{

	private static TextArea answer;
	private Button[] digits, operators, specials;
	private double firstOperand = 0, secondOperand = 0;
	private CalculatorState RFO = new RFO(), RSO = new RSO();
	private CalculatorState current = RFO;
	private int operator = 0;
	private boolean append = true;
	private boolean decimal = false;
	private int decimalPlace = 0;
	private boolean error = false;
	private String[] operatorStrings = {"", "+", "-", "*", "/"};

	public void start(Stage primaryStage) {
		int sceneWidth = 470, sceneHeight = 600;

		//Creating the Pane and adding borders
		GridPane pane = new GridPane();
		pane.setHgap(10);
		pane.setVgap(10);
		pane.setPadding(new Insets(20, 20, 20, 20));

		//TextArea for the result
		answer = new TextArea();
		answer.setEditable(false);
		pane.add(answer, 0, 0, 4, 1);

		//Hella Buttons for everyone
		//Digits Buttons
		digits = new Button[10];
		for (int i = 0; i < 10; i++) {
			int j = i;
			digits[i] = new Button(Integer.toString(i));
			digits[i].setMinSize(100, 50);
			//Button Handlers
			digits[i].setOnAction(new EventHandler<ActionEvent>() {
				public void handle(ActionEvent event) {
					current.addDigit(j);
				}
			});
			if (i != 0)
				pane.add(digits[i], (i + 2) % 3, 6 - (i + 2) / 3);
			else
				pane.add(digits[i], 1, 6);
		}

		//Operator Buttons
		operators = new Button[8];
		operators[0] = new Button("/");
		operators[0].setOnAction(new EventHandler<ActionEvent>() {
			public void handle(ActionEvent event) {
				current.divOperator();
			}
		});

		operators[1] = new Button("*");
		operators[1].setOnAction(new EventHandler<ActionEvent>() {
			public void handle(ActionEvent event) {
				current.multOperator();
			}
		});

		operators[2] = new Button("+");
		operators[2].setOnAction(new EventHandler<ActionEvent>() {
			public void handle(ActionEvent event) {
				current.addOperator();
			}
		});

		operators[3] = new Button("-");
		operators[3].setOnAction(new EventHandler<ActionEvent>() {
			public void handle(ActionEvent event) {
				current.subOperator();
			}
		});

		operators[4] = new Button("=");
		operators[4].setOnAction(new EventHandler<ActionEvent>() {
			public void handle(ActionEvent event) {
				current.equalsOperator();
			}
		});

		operators[5] = new Button("\u221A");	//Square Root
		operators[5].setOnAction(new EventHandler<ActionEvent>() {
			public void handle(ActionEvent event) {
				current.rootOperator();
			}
		});
		
		operators[6] = new Button("x\u00B2");	//Squared
		operators[6].setOnAction(new EventHandler<ActionEvent>() {
			public void handle(ActionEvent event) {
				current.sqrdOperator();
			}
		});
		
		operators[7] = new Button("\u00B9/x");	//Inverse
		operators[7].setOnAction(new EventHandler<ActionEvent>() {
			public void handle(ActionEvent event) {
				current.inverseOperator();
			}
		});
		
		for (int i = 0; i < operators.length; i++) {
			operators[i].setMinSize(100, 50);
			if (i < 5)
				pane.add(operators[i], 3, 2 + i);
			else
				pane.add(operators[i], i - 4, 1);
		}

		//'Special' Buttons
		specials = new Button[5];
		specials[0] = new Button("CE");
		specials[0].setOnAction(new EventHandler<ActionEvent>() {
			public void handle(ActionEvent event) {
				current.clearAll();
			}
		});
		
		specials[1] = new Button("C");
		specials[1].setOnAction(new EventHandler<ActionEvent>() {
			public void handle(ActionEvent event) {
				current.clear();
			}
		});
		
		specials[2] = new Button("Delete");
		specials[2].setOnAction(new EventHandler<ActionEvent>() {
			public void handle(ActionEvent event) {
				current.delete();
			}
		});
		
		specials[3] = new Button("±");
		specials[3].setOnAction(new EventHandler<ActionEvent>() {
			public void handle(ActionEvent event) {
				current.signOperator();
			}
		});
		
		specials[4] = new Button(".");
		specials[4].setOnAction(new EventHandler<ActionEvent>() {
			public void handle(ActionEvent event) {
				current.dotOperator();
			}
		});

		for (int i = 0; i < specials.length; i++) {
			specials[i].setMinSize(100, 50);
			if (i < 3)
				pane.add(specials[i], i, 2);
		}
		pane.add(specials[3], 0, 6);
		pane.add(specials[4], 2, 6);


		/* Display the stage */
		Scene scene = new Scene(pane, sceneWidth, sceneHeight);
		primaryStage.setTitle("Calculator");
		primaryStage.setScene(scene);
		primaryStage.show();
	}

	public void update() {
		if (!error) {
			String first = Double.toString(firstOperand);
			String second = Double.toString(secondOperand);
			String operatorString = operatorStrings[operator];	

			if (!operatorString.equals("")) {
				answer.setText(first + " " + operatorString + " " + second);
			}else
				answer.setText(first);
		}else {
			answer.setText("Error, Illegal Input");
			error = false;
		}
	}

	public static void main(String[] args) {
		Application.launch(args);
	}

	private class RFO implements CalculatorState{

		@Override
		public void addDigit(int i) {
			if (firstOperand < 0)
				i *= (-1);
			if (append)
				if (!decimal)
					firstOperand = firstOperand * 10 + i;
				else {
					decimalPlace += 1;
					firstOperand += i * Math.pow(10, decimalPlace * (-1));
				}
			else {
				firstOperand = i;
				append = true;
			}
			update();
		}

		@Override
		public void addOperator() {
			transfer();
			operator = 1;
			update();
		}

		@Override
		public void subOperator() {
			transfer();
			operator = 2;
			update();
		}

		public void multOperator() {
			transfer();
			operator = 3;
			update();
		}

		public void divOperator() {
			transfer();
			operator = 4;
			update();
		}

		public void dotOperator() {
			decimal = true;
		}

		public void signOperator() {
			firstOperand *= (-1);
			update();
		}
		
		public void rootOperator() {
			if (firstOperand > 0)
				firstOperand = Math.sqrt(firstOperand);
			else {
				clearAll();
				error = true;
			}
			update();
		}
		
		public void sqrdOperator() {
			firstOperand = Math.pow(firstOperand, 2);
			update();
		}
		
		public void inverseOperator() {
			if (firstOperand != 0)
				firstOperand = 1 / firstOperand;
			else {
				clearAll();
				error = true;
			}
			update();
		}
		
		@Override
		public void equalsOperator() {

		}
		
		public void clearAll() {
			firstOperand = 0;
			decimal = false;
			decimalPlace =1;
			update();
		}

		public void clear() {
			clearAll();
		}
		
		public void delete() {
			if (decimal) {
				if (decimalPlace == 0) {
					decimal = false;
					firstOperand = firstOperand - (firstOperand % 1);
				}else {
					decimalPlace -= 1;
					firstOperand = firstOperand - (firstOperand % Math.pow(10, decimalPlace * (-1)));
				}
			}else {
				firstOperand = (int) (firstOperand / 10);
			}
			update();
		}
		
		public void transfer() {
			current = RSO;
			decimal = false;
			decimalPlace = 0;
		}

	}

	private class RSO implements CalculatorState{

		@Override
		public void addDigit(int i) {
			if (secondOperand < 0)
				i *= (-1);
			if (!decimal)
				secondOperand = secondOperand * 10 + i;
			else {
				decimalPlace += 1;
				secondOperand += i * Math.pow(10, decimalPlace * (-1));
			}
			update();
		}

		@Override
		public void addOperator() {
			execute();
			if (operator != 0)
				operator = 1;
			update();
		}

		@Override
		public void subOperator() {
			execute();
			if (operator != 0)
				operator = 2;
			update();
		}

		public void multOperator() {
			execute();
			decimal = false;
			if (operator != 0)
				operator = 3;
			update();
		}

		public void divOperator() {
			execute();
			if (operator != 0)
				operator = 4;
			update();
		}

		public void dotOperator() {
			decimal = true;
		}

		public void signOperator() {
			secondOperand *= (-1);
			update();         
		}
		
		public void rootOperator() {
			if (secondOperand > 0)
				secondOperand = Math.sqrt(secondOperand);
			else {
				clearAll();
				error = true;
			}
			update();
		}
		
		public void sqrdOperator() {
			secondOperand = Math.pow(secondOperand, 2);
			update();
		}
		
		public void inverseOperator() {
			if (secondOperand != 0)
				firstOperand /= secondOperand;
			else {
				clearAll();
				error = true;
			}
			update();
		}
		
		@Override
		public void equalsOperator() {
			execute();
			operator = 0;
			append = false;
			current = RFO;
			update();
		}

		public void clearAll() {
			firstOperand = 0;
			secondOperand = 0;
			operator = 0;
			current = RFO;
			decimal = false;
			decimalPlace = 0;
			update();
		}

		public void clear() {
			decimal = false;
			decimalPlace = 0;
			secondOperand = 0;
			update();
		}
		
		public void delete() {
			if (decimal) {
				if (decimalPlace == 0) {
					decimal = false;
					secondOperand = secondOperand - (secondOperand % 1);
				}else {
					decimalPlace -= 1;
					secondOperand = secondOperand - (secondOperand % Math.pow(10, decimalPlace * (-1)));
				}
			}else {
				secondOperand = (int) (secondOperand / 10);
			}
			update();
		}
		
		public void execute() {
			if (operator == 1) {					//Addition
				firstOperand += secondOperand;
			}else if (operator == 2) {				//Subtraction
				firstOperand -= secondOperand;
			}else if (operator == 3) {				//Multiplication
				firstOperand *= secondOperand;
			}else if (operator == 4) {				//Division
				if (secondOperand != 0)
					firstOperand /= secondOperand;
				else {
					clearAll();
					error = true;
				}
			}
			
			decimal = false;
			decimalPlace = 0;
			secondOperand = 0;
		}
		
	}
}
