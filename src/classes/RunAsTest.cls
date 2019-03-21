@isTest(SeeAllData=true)
public class RunAsTest {
    @isTest static void viewClasses() {
        // This user id is a user with no permission to access this
        User u = [SELECT Id FROM User WHERE Id = '0051U0000042g2QQAQ'];
        
        // Now we run it as system admin, which has permission to access.
        User masterU = [SELECT Id FROM User WHERE Id = '0051U0000042f31QAA'];
        
        List<Class__c> classes = [SELECT Id, Name FROM Class__c];
        System.debug('classes: ' + classes);
        
        System.runAs(u) {
            classes = [SELECT Id, Name FROM Class__c];
            System.debug('classes: ' + classes);
        }
        System.debug('classes: ' + classes);
    }
}