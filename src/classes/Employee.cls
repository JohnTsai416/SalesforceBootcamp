public class Employee extends Person {
    private String Company {
        get {
            if (Company == null) { Company = ''; }
            return Company;
        }
        set {
            Company = value;
        }
    }
    
    // Constructor for Employee, setting company default value to ''
    
    // override constructor to take name and email, using super
    // to indicate the use of parent class person. 
    public Employee(String name, String email) {
        super(name);
        setEmail(email);
        this.Company = '';
    }
    
    public override void display() {
        super.display();
        System.debug('Company: ' + this.Company);
    }
}