public class MyMathClass {
    // Overloading means creating a method twice that takes in different parameter.
    
    // They're instance class at the moment, so you need to declare them before using
    // we need to make them static so, it can be declared within itself.
    // Static, as in unmoving, will not move.
    public static void addNumber(Integer num1, Integer num2) {
        System.debug(num1 + num2);
    }
    
    public static void addNumber(Integer num1, Integer num2, Integer num3) {
        System.debug(num1 + num2 + num3);
    }
    
}