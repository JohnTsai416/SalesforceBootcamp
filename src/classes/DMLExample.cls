public class DMLExample {
	// This method inserts three account records and updates an existing account record.
    public static void insertAndUpdateExample() {
        List<Account> accountsToInsert = new List<Account>();
        
        // Create three account sObjects and add to list
        // We DO NOT want to perform DML on individual sObjects/record
        // so we add to a list.
        for (Integer i = 0; i < 3; i++) {
            Account a = new Account(Name = 'Wal-Mart' + i, BillingCity = 'San Francisco');
            accountsToInsert.add(a);
        }
        
        Account accountsToUpdate;
        
        try {
            insert accountsToInsert;
            
            // Update account Wal-Mart
            accountsToUpdate = [SELECT BillingCity FROM Account WHERE Name = 'Wal-Mart2' LIMIT 1];
            
            System.debug('Wal-Mart2: ' + accountsToUpdate);
            
            // Update the billing city
            accountsToUpdate.BillingCity = 'New York';
            
            update accountsToUpdate;
        } catch(DMLException e) {
            System.debug('An unexpected error has occurred: ' + e.getMessage());
        }
        
        System.debug('Wal-Mart2: ' + accountsToUpdate);
	}
    
    /*
    // You can insert records related to existing records if a relationship has already been defined
    // between the two object, a record is associated with a related record through a foreign key ID.
    // This example add a contact to an Account which is related record by setting the AccountID field
    // on the contact.
	*/    

    public static void insertingRelatedRecords() {
        try {
            Account a = new Account(Name = 'SFDC Account');
            insert a;
            
            /*
            // Once the account is inserted, the sObject will be populated with an ID.
            // Get this ID. The account need to be inserted after created in order to have
            // an auto generated ID.
            */
            
            ID aId = a.Id;
            
            // Add a contact to this account 
            Contact c = new Contact(
            	FirstName = 'Matt',
                LastName = 'Ruiz',
                Phone = '0000000000',
                AccountId = aId
            );
            
            insert c;
        } catch(DMLException e) {
            System.debug('An unexpected error has occurred: ' + e.getMessage());
        }
        /*
        // Once the record is added, you can find it using query
        // SELECT Name, Account.Name FROM Contact WHERE FirstName = 'Matt'
        */
    }
    
    // Create these records: Class, Assessment, Grade and associate them with a Student, all in apex
    public static void InsertStudentRecord() {
        try {
            Class_Enrollment__c ce = new Class_Enrollment__c();
            
            insert ce;
            
            ID ceId = ce.Id;
            
            Student__c s = new Student__c(
            	Name = 'Joseph Joestar',
                Id = ceId
            );
            
            Class__c c = new Class__c(
            	Name = 'BIO201',
                Id = ceId
            );
            
            insert s; insert c;
            ID cId = c.Id;
            
            Assessment__c a = new Assessment__c(
                Class__c = 'BIO201',
            	Name = 'HW12',
                Id = cId
            );
            
            insert a;
            ID aId = a.Id;
            
            Grade__c g = new Grade__c(
                Assessment__c = 'HW12',
                Grade__c = 80,
                Id = aId
            );
            
            insert g;
        } catch(DMLException e) {
            System.debug('An unexpected error has occurred: ' + e.getMessage());
        }
    }
    
    /*
    // Fields on related records can't be updated with the same 
    // call to the DML operation and require a separate DML
    // For example, if inserting a new contact, you can specify the 
    // contact's related account record by setting the value of the AccountId field.
    // however, you can't change the account's name without updating 
    // the account itself with a separate DML call.
    // Similary, when updating an a contact, if you also watn to update the contact's 
    // related account, you must have two DML call.
	*/

    public static void UpdatingRelatedRecord() {
        try {
            // Query for the contact, which has been associated with an account.
            Contact queriedContact = [SELECT Phone FROM Contact WHERE FirstName = 'Joseph' AND LastName = 'Joestar' LIMIT 1];
            
            // 1. Update the contact's phone number
            queriedContact.Phone = '1111111111';
            
            // 2. Update the related account's industry
            queriedContact.Account.Industry = 'Technology';
            
            // 1. This call update the contact's phone number
            update queriedContact;
            
            // 2. This calls date the related account's industry
            update queriedContact.Account;
            
            /*
            // Using the upsert operation, you can either insert or update an existing record in 
            // one call. to determine whether a record already exist, the upsert statement or
            // database method uses the record's ID as the key to match records, a customer external
            // ID or a standard field with the idLoopup attribute set to true.
            // 
            // - If the key is not matched, then a new record is created
            // - If the key is matched once, then the existing record is update.
            // - If the key is match multiple times, then an error is generated and the object is 
            // 		neither inserted or updated.
            */            

        } catch(DMLException e) {
            System.debug('An unexpected error has occurred: ' + e.getMessage());
        }
    }
    
    public static void upsertExample() {
        List<Account> accountList = [SELECT BillingCity FROM Account WHERE BillingCity = 'San Francisco'];
        
        //for (Integer i = 0; i < accountList.size(); i++) {
        //    accountList[i].BillingCity = '';
        //}
        
        for (Account a : accountList) { 
            a.BillingCity = 'Mumbai'; 
        }
        
        Account a = new Account(Name = 'Acme', BillingCity = 'San Francisco');
        accountList.add(a);
        
        try {
            upsert accountList;
        } catch(DMLException e) {
            System.debug('An unexpected error has occurred: ' + e.getMessage());
        }
    }
    
    /*	Only available for lead, contact, or account records.
     * 	You can merge up to three records of the same sObject type.
     * 	The merge operation merges up to three records into the one of the records,
     * deltes the others, and reparent any related records.
     */
    
    public static void mergeExample() {
        // Insert new accounts
        List<Account> ls = new List<Account> {new Account(Name = 'Dunkin Inc.'),
                                              new Account(Name = 'Dunkin')};
        insert ls;
        
        // Queries to get the inserted accounts
        Account masterAccount = [SELECT Id, Name FROM Account WHERE Name = 'Dunkin Inc.' LIMIT 1];
        Account mergeAccount = [SELECT Id, Name FROM Account WHERE Name = 'Dunkin Inc.' LIMIT 1];
        
        // Add a contact to the account to be merged
        Contact c = new Contact(FirstName = 'Matt', LastName = 'Merged');
        c.AccountId = mergeAccount.Id;
        insert c;
        
        Account[] result = [SELECT Id, Name FROM Account WHERE Name LIKE '%Dunkin%'];
        System.debug('Before merge' + result);
        
        try {
            merge masterAccount mergeAccount;
        } catch(DMLException e) {
            System.debug('An unexpected error has occurred: ' + e.getMessage());
        }
        
        result = [SELECT Id, Name FROM Account WHERE Name LIKE '%Dunkin%'];
        System.debug('After merge' + result);
    }
    
    /* You can delete records using the delete operation
     * Deleted records aren't deleted permently from salesforce, but they are
     * placed in the recycle bin for 15 days from where they can be restored.
	 */
    
    public static void deleteExample() {
        insert new Account(Name = 'DotCom');
        Account[] doomedAccounts = [SELECT Name FROM Account WHERE Name = 'DotCom'];
        System.debug('Doomed Accounts ' + doomedAccounts);
    	
        try {
            delete doomedAccounts;
        } catch(DMLException e) {
            System.debug('An unexpected error has occurred: ' + e.getMessage());
        }
        
        System.debug('Doomed Accounts ' + doomedAccounts);
        System.debug('Doomed Accounts ' + [SELECT Name FROM Account WHERE Name = 'DotCom']);
    }
    
    public static void undeleteExample() {
        // SOQL statements can use the ALL ROWS keywords to query all records in an organization,
        // including deleted records and archived activites.
        // you can use ALL ROWS to query records in your org's recycle bin
        // you can't use the ALL ROWS keyword with the FOR UPDATE keywords.
        Account[] savedAccounts = [SELECT Name FROM Account WHERE Name = 'DotCom' ALL ROWS];
        System.debug('Saved Accounts before undelete: ' + savedAccounts);
        
        try {
        	undelete savedAccounts;    
        } catch(DMLException e) {
            System.debug('An unexpected error has occurred: ' + e.getMessage());
        }

        System.debug('Saved Accounts after undelete: ' + [SELECT Name FROM Account WHERE Name = 'DotCom']);
    }
    
    public static void queryForLoop() {
        List<Account> accountList = [SELECT Id, Name FROM Account LIMIT 5];
        
        for (Account a : accountList) {
            System.debug('a: ' + a);
        }
        
        // Use this, it takes less space because its used just once and not stored.
        for (Account a : [SELECT Id, Name FROM Account LIMIT 5]) {
            System.debug('a: ' + a);
        }
    }
    
    public static void badPractice() {
        // Don't do this, you are talking to the database 100 time
        for (Integer i = 0; i < 100; i++) {
            Account a = new Account(Name = 'Account' + i);
            insert a;
        }
        
        // Do this
        Account[] accList = new List<Account>();
        for (Integer i = 0; i < 100; i++) {
            Account a = new Account(Name = 'Account' + i);
            insert a;
        }
        insert accList;
        
        // Don't do this, you talking to the database 100 times
        for (Integer i = 0; i < 100; i++) {
        	Account[] ls = [SELECT Id, Name FROM Account];
        }
        
        // Do this, salesforce is magic?
        for (Account a : [SELECT Id, Name FROM Account]) {
            // do some stuff
        }
        
        // Good practice, never have DML nor query in loop of any kind.
    }
    
    public static void dataBaseClass() {
    	List<Account> accList = new List<Account>();
        accList.add(new Account(Name = 'Acme1'));
        accList.add(new Account(Name = 'Acme2'));
        accList.add(new Account());
        
      /*try {
            // the insert will not work, because there is an error about having a blank in accList list
        	 insert accList;
        } catch(DMLException e) {
            System.debug('An unexpected error has occurred: ' + e.getMessage());
        }*/
        
        // DML Statement using database class, this allow inserting while skipping failed inserts
        // but if all else fail, just complete the insert requirement.
        Database.SaveResult[] srList = Database.insert(accList, false);

        // Iterate through each returned result
        for (Database.SaveResult sr : srList) {
            if (sr.isSuccess()) {
            	System.debug('Successfully inserted account. Account ID: ' + sr.getId());
            } else {
                // operation failed, so get all errors
                for (Database.Error err : sr.getErrors()) {
                    System.debug('This following error has occured.');
                    System.debug(err.getStatusCode() + ': ' + err.getMessage());
                    System.debug('Accounts fields that affected this error: ' + err.getFields());
                }
            }
    	}
    }
}