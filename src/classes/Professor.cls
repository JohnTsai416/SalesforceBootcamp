public class Professor extends Person {
    // Fields
    private Decimal salary;

    // Accessor and Getter
    public void setSalary(Decimal salary) {
        this.salary = salary;
    }
    
	public Decimal getSalary() {
        return salary; 
    }

    // Constructor, initiating value for fields
    public Professor() {
        this.salary = 0.0;
    }
    
    // Default constructor
    public Professor(String name, String email) {
		super(name);
        setEmail(email);
        
        this.salary = 0.0;
    }
    
    // Display method for user output
    public override void display() {
        System.debug('Advisor Information');
        super.display();
        System.debug('Salary: ' + this.salary);
    }
}