public virtual class Rectangle extends Shape {
    private Integer height { get; set; }
    private Integer width { get; set; }
    
    public Rectangle() {
        setNumberOfSides(4);
    }
    
    public Rectangle(Integer height, Integer width) {
        this.height = height;
        this.width = width;
        setNumberOfSides(4);
    }
    
    public virtual void draw() {
        System.debug('Drawing a rectangle with width: ' + width + ' and height: ' + height);
    }
    
    public Integer calculateArea() {
        return width * height;
    }
    
    public Integer calculatePerimeter() {
        return 2 * (width * height);
    }
}