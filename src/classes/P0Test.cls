@isTest
public class P0Test {
    // Test never takes parameter
    @isTest static void testFibonacci() {
        // Single Action - Positive, assert method test values
        System.assertEquals(1, P0.fibonacci(1));
        System.assertEquals(1, P0.fibonacci(2));
        System.assertEquals(2, P0.fibonacci(3));
        System.assertEquals(89, P0.fibonacci(11));
        System.assertEquals(6765, P0.fibonacci(20));
        System.assertEquals(196418, P0.fibonacci(27));
        
        // Single Action - Negative
        System.assertEquals(-1, P0.fibonacci(-5));
    }
    
    @isTest static void testSortArray() {
        List<Integer> unsortedArray = new List<Integer> {2, 4, 5, 1, 3, 1};
        List<Integer> sortedArray = new List<Integer> {1, 1, 2, 3, 4, 5};
        List<Integer> returnedArray = P0.sortArray(unsortedArray);
        
        for(Integer i = 0; i < sortedArray.size(); i++) {
            System.assertEquals(sortedArray[i], returnedArray[i]);
        }
    }
    
    @isTest static void testFactorial() {
        System.assertEquals(1, P0.factorial(0));
        System.assertEquals(1, P0.factorial(1));
        System.assertEquals(6, P0.factorial(3));
    }
 
    @isTest static void testRotateLeft() {
        List<Integer> unrotatedArray = new List<Integer> {1, 2, 3, 4, 5};
        List<Integer> rotatedArray = new List<Integer> {2, 3, 4, 5, 1};
        List<Integer> returnedArray = P0.rotateLeft(unrotatedArray, 1);
        
        for(Integer i = 0; i < rotatedArray.size(); i++) {
            System.assertEquals(rotatedArray[i], returnedArray[i]);
        }
    }
    
    @isTest static void testUpdateAccountSize() {
        // Test Single Action - Positive
        List<Account> accnt = new List<Account>();
        accnt.add(new Account(Name = 'Test12345', NumberOfEmployees = 1));
        accnt.add(new Account(Name = 'Test12346', NumberOfEmployees = 1001));
        accnt.add(new Account(Name = 'Test12347', NumberOfEmployees = 11000));
        insert accnt;
        P0.updateAccountSize();
        
        Account a1 = [SELECT Id, Size__c FROM Account WHERE Name = 'Test12345'];
        System.assertEquals('Small', a1.Size__c);
        Account a2 = [SELECT Id, Size__c FROM Account WHERE Name = 'Test12346'];
        System.assertEquals('Medium', a2.Size__c);
        Account a3 = [SELECT Id, Size__c FROM Account WHERE Name = 'Test12347'];
        System.assertEquals('Large', a3.Size__c);
        
        // Test Bulk Action - Positive
        List<Account> accs = [SELECT NumberOfEmployees, Size__c FROM Account WHERE Name LIKE 'Test%'];
        for (Account a : accs) {
            if (a.NumberOfEmployees < 1000) {
                System.assertEquals('Small', a.Size__c);
            } else if (a.NumberOfEmployees > 1000 && a.NumberOfEmployees < 10000) {
                System.assertEquals('Medium', a.Size__c);
            } else {
                System.assertEquals('Large', a.Size__c);
            }
        }
    }
    
    @isTest static void testUpdateCALeads() {
        // Test Single Action - Positive
    	List<Lead> leads = new List<Lead>();
        leads.add(new Lead(LastName = 'Test1234', State = 'CA', Company = '123'));
        leads.add(new Lead(LastName = 'Test1235', State = 'CA', Company = '125'));
        leads.add(new Lead(LastName = 'Test1236', State = 'CA', Company = '124'));
        insert leads;
        
        P0.updateCALeads();
        
        List<Lead> ls = [SELECT Status, Description FROM Lead];
        for (lead l : ls) {
            System.assertEquals('Closed - Not Converted', l.Status);
            System.assertEquals('We are no longer doing business in California.', l.Description);
        }
    }
    
    @isTest static void testUpdateOpportunitiesPastClosedDate() {
        List<Opportunity> opp = new List<Opportunity>();
        opp.add(new Opportunity(CloseDate = date.parse('01/15/1990'), StageName = 'Qualification', AccountId = 'Business Apex'));
        opp.add(new Opportunity(CloseDate = date.parse('12/28/2000'), StageName = 'Prospecting', AccountId = 'Apex Company'));
        opp.add(new Opportunity(CloseDate = date.parse('06/17/2015'), StageName = 'Value Proposition', AccountId = 'Cloud Apex'));
        insert opp;
        
        P0.updateOpportunitiesPastClosedDate();
        
        List<Opportunity> oppo = [SELECT CloseDate, StageName, AccountId FROM Opportunity];
        for (Opportunity op : oppo) {
            System.assertEquals('Closed Lost', op.StageName);
        }
    }
}