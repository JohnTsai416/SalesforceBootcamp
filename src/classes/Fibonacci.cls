public class Fibonacci {
    // Creating fibonacci fields and list
    List<Integer> fibonacciList = new List<Integer>{0, 1, 1}; 
    private Integer fibonacciN = 0;
    private Integer fibonacciTemp = 0; // Placeholder for n1
    
    // Initiating constructor
    public Fibonacci() {
        this.fibonacciN = 0;
    }
    
    // Getter for Fibonacci
    public Integer getFibonacci() {
        return this.fibonacciN;
    }
    
    // Setter for Fibonacci
    public void setFibonacci(Integer fibonacciN) {
        this.fibonacciN = fibonacciN;
    }
    
    // Populate the fibonacciList with FibonacciN 
    public Fibonacci(Integer fibonacciN) {
        // Fibonacci logic goes here!
        for (Integer i = 0; i <= fibonacciN; i++) {
            if (i <= 2) {
                fibonacciTemp = fibonacciList[i];
            } else {
                fibonacciTemp = fibonacciList[i-1] + fibonacciList[i-2];
                fibonacciList.add(fibonacciTemp);
            }
        }
    }
    
    /*  Display throught list collection, Testing input
        Fibonacci f = new Fibonacci(10);
        f.display();
        Input: 0	Output: 0
        Input: 1	Output: 1
        Input: 2	Output: 1
        Input: 10	Output: 55
    */
    public void display() {
        //Iterate throught list size and output i
        for (Integer i : fibonacciList) {
        	System.debug(i);
    	}
    }
    
}