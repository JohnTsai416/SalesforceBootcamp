public class NoDuplicate {
    // Checking for duplicate
    public List<Student__c> chkForStudent(List<Student__c> objStudent) {
        return objStudent;
    }
    
    public List<Class_Enrollment__c> chkForStudent(List<Class_Enrollment__c> objCE) {
        return objCE;
    }
    
    public List<Assessment__c> chkForStudent(List<Assessment__c> objAssmnt) {
        return objAssmnt;
    }
    
    public List<Class__c> chkForStudent(List<Class__c> objClass) {
        return objClass;
    }
    
    // Grade to check for duplicates mostly in Grade
    public List<Grade__c> chkForStudent(List<Grade__c> objGrade) {
        return objGrade;
    }
}