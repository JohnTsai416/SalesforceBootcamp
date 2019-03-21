public virtual class Person {
    // Fields
    private String name;
    private String email;
    
    // Accessor and Getter
    public String getName() {
        return this.name;
    }
    
    public String getEmail() {
        return this.email; 
    }
    
    public void setName(String name) {
        // we use setter to validate the values we're setting, setting as in setting value
        this.name = name;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    
    // Constructor, initiating value for fields
    public Person() {
    	System.debug('Hello World');
        this.name = '';
        this.email = '';
    }
    
    // Default constructor
    public Person(String name) {
        this.name = name;
    }
    
    // Display method for user output
    public virtual void display() {
        System.debug('Name: ' + this.name);
        System.debug('Email: ' + this.email);
    }
}