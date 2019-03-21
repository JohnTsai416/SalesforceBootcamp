public class Student extends Person {
    // Fields
    private String major;
    
    // Accessor and Getter
    public void setMajor(String major) {
        this.major = major;
    }
    
	public String getMajor() {
        return major; 
    }
    
    // Constructor, initiating value for fields
    public Student() {
        this.major = '';
    }
    
    // Default constructor
    public Student(String name, String email, Professor advisor) {
		super(name);
        setEmail(email);
        this.major = '';
        advisor.display();
    }
   
    // Display method for user output
    public override void display() {
        System.debug('Student Information');
        super.display();
    	System.debug('Major: ' + this.major);
    }
    
    /*
		// Testing Code
		Professor advisor = new Professor('Matt', 'Matthew.Ruiz@Revature.com');
        advisor.setSalary(100000);
        Student s = new Student('Mike', 'Mike@studentemail.com', advisor);
        s.setMajor('Computer Science');
        
        s.display();
	*/
}