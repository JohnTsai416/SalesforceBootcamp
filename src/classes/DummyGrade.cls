public class DummyGrade {
    /*
        1) When a Class Enrollment is created, create a grade record for all Assessments in that class.
        When we insert an enrollment record, check if the enrolled class has an assessment
        check if the assessment has a grade, and check if the grade is null, then fill null
        with a dummy value.

        3) Prevent duplicate grades from being created.
        4) Prevent duplicate Class Enrollments
        5) Prevent duplicate Classes

        ** Test Code **
        Class_Enrollment__c enrollBilly = new Class_Enrollment__c(Class__c = 'BIO105', Student__c = 'John Doe');
        insert enrollBilly;
        
        ** REFRESHER! For (type variable : arrayname) **
        Iterate through arrayname, give variable the current arrayname!
    */
    
    public static void DefaultGrade(List<Class_Enrollment__c> enrollment) {
        // Creating an Id list, (didn't know Id is an datatype), and storing id
        // The Class__c will be our Ids for reference
        List<Id> ClassIds = new List<Id>();
        for (Class_Enrollment__c ce : enrollment) {
            classIds.add(ce.Class__c);
        }
        
        // Create placeholder for insert, all operation done in here
        // We're ultimately inserting to grade, so give it type grade object
        List<Grade__c> gradeToInsert = new List<Grade__c>();
        
        // Create new assessment and insert in its Id, and Class__c, which is class's id
        // From Assessment where we reference our id list for filtering
        // ** SELECT field FROM object WHERE filter field IN :filter array **
        for (Assessment__c assmt : [SELECT Id, Class__c FROM Assessment__c WHERE Class__c IN :classIds]) {
            for (Class_Enrollment__c ce : enrollment) {
                // Double for loop for both assessment and class enrollment, execute only when 
                // Class__c from both class are the same. Then make edits based Ids.
                if (ce.Class__c == assmt.Class__c) {
                    Grade__c g = new Grade__c();
                    g.Assessment__c = assmt.Id;
                    g.EnrollmentLookup__c = ce.Id;
                    gradeToInsert.add(g);
                }
            }
        }
        
        // Finally, committ the change
        insert gradeToInsert;
    }
    
    public static void checkForEnrollmentDuplicates(List<Class_Enrollment__c> enrollment) {
        
    }
}