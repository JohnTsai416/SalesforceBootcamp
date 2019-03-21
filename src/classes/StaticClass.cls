public class StaticClass {
    // Static variable
    private static Integer numOfObjCreated = 0;
    // Instance method
    private Integer secondNum = 0;
    
    public StaticClass() {
        numOfObjCreated++;
        secondNum++;
    }
    
    public void incrementNumOfObjCreated() {
        numOfObjCreated++;
    }
    
    public void incrementSecondNum() {
        secondNum++;
    }
    
    public Integer getNumOfObjCreated() {
        return numOfObjCreated;
    }
    
    public Integer getSecondNum() {
        return secondNum;
    }
    
}