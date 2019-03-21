public class Square extends Rectangle {
    private Integer height { get; set; }
    private Integer width { get; set; }

    public Square() {
        setNumberOfSides(4);
        Integer sideLength;
    }
    
    public Square(Integer height, Integer width) {
        this.height = height;
        this.width = width;
        setNumberOfSides(4);
    }
    
    public override void draw() {
        System.debug('Drawing a rectangle with width: ' + width + ' and height: ' + height);
    }
    
    //public Integer calculateArea() {
    //    return width * height;
    //}
    
    //public Integer calculatePerimeter() {
    //    return 2 * (width * height);
    //}

/*
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
*/
}