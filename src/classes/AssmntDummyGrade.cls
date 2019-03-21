public class AssmntDummyGrade {
    /*
        2) When an Assessment is created, create a grade record for each student.
        When an Assessment is created, create a grade record for each student.
        Prevent duplicate grades from being created.

        3) Prevent duplicate grades from being created.
    */
    
    public static void DefaultGrade(List<Assessment__c> assessment) {
        List<Id> ClassIds = new List<Id>();
        for (Assessment__c assmnt : assessment) {
            classIds.add(assmnt.Class__c);
        }
        
        List<Grade__c> gradeToInsert = new List<Grade__c>();

        for (Assessment__c assmt : [SELECT Id, Class__c FROM Assessment__c WHERE Class__c IN :classIds]) {
            for (Assessment__c ce : assessment) {
                if (ce.Class__c == assmt.Class__c) {
                    Grade__c g = new Grade__c();
                    g.Assessment__c = assmt.Id;
                    g.EnrollmentLookup__c = ce.Id;
                    gradeToInsert.add(g);
                }
            }
        }
        
        insert gradeToInsert;
    }
    
    public static void checkForAssmntDuplicates(List<Assessment__c> assessment) {
        
    }
}