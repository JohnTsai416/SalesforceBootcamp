@isTest
public class LimitClass {
    @isTest static void methodOne() {
        List<Account> accList = new List<Account>();
        for (Integer i = 0; i < 5; i++) {
            Account a = new Account(Name = 'Test ' + i);
            accList.add(a);
        }
        insert accList;
        
        System.debug('Number of DML Statement in methodOne: ' + Limits.getDmlStatements());
        System.debug('Number of DML Statement in methodOne: ' + Limits.getLimitDmlStatements());
        // output only 1 DML statement used
    }
    
    @isTest static void methoTwo() {
        List<Account> accList = new List<Account>();
        for (Integer i = 0; i < 5; i++) {
            Account a = new Account(Name = 'Test ' + i);
            insert a;
        }
        
        System.debug('Number of DML Statement in methodOne: ' + Limits.getDmlStatements());
        System.debug('Number of DML Statement in methodOne: ' + Limits.getLimitDmlStatements());
        // output 5 DML statement used
    }
}