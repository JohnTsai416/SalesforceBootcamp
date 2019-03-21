@isTest
public class AccountMethodsTest {
    /*
    @testSetup static void setup() {
    	List<Account> accs = new List<Account>();
        
        accs.add(new Account(Name='Test1', NumberOfEmployees=15, NumberOfLocations__c=1));
        accs.add(new Account(Name='Test2', NumberOfEmployees=1500, NumberOfLocations__c=4));
        accs.add(new Account(Name='Test3', NumberOfEmployees=15000, NumberOfLocations__c=12));
        
        insert accs;
    }    
    */
    
    @isTest(SeeAllData=True)
    static void testUpdateAccountSizeFromNumberOfEmployees() {
        AccountMethods.updateAccountSizeFromNumberOfEmployees();
        
        List<Account> accList = [SELECT NumberOfEmployees FROM Account];
        for(Account a : accList) {
            if(a.NumberOfEmployees > 0 && a.NumberOfEmployees < 1000){
                System.assertEquals('Small', a.Size__c);
            } else if(a.NumberOfEmployees > 1000 && a.NumberOfEmployees < 10000){
                System.assertEquals('Medium', a.Size__c);
            } else {
                System.assertEquals('Large', a.Size__c);
            }
        }
    }
    
    static void testUpdateAccountSizeFromNumberOfLocation() {
        AccountMethods.updateAccountSizeFromNumberOfEmployees();
        
        List<Account> accList = [SELECT NumberOfEmployees FROM Account];
        for(Account a : accList) {
            if(a.NumberOfEmployees > 0 && a.NumberOfEmployees < 1000){
                System.assertEquals('Small', a.Size__c);
            } else if(a.NumberOfEmployees > 1000 && a.NumberOfEmployees < 10000){
                System.assertEquals('Medium', a.Size__c);
            } else {
                System.assertEquals('Large', a.Size__c);
            }
        }
    }
}