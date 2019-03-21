public class ProjectZero {
    public static Integer fibonacci(Integer fibonacciN) {
        // Creating fibonacci fields and list
        List<Integer> fibonacciList = new List<Integer>{0, 1, 1}; 
        Integer fibonacciTemp = 0; // Placeholder for n1
        
        // Populate the fibonacciList with FibonacciN 
        // Fibonacci logic goes here!
        for (Integer i = 0; i <= fibonacciN; i++) {
            if (i <= 2) {
                fibonacciTemp = fibonacciList[i];
            } else {
                fibonacciTemp = fibonacciList[i-1] + fibonacciList[i-2];
                fibonacciList.add(fibonacciTemp);
            }
        }
        
        // Return fibonacci list array at desire index
        return fibonacciList[fibonacciN];
        
        
        /*//*** Result ***
            Display throught list collection, Testing input
            Input: 0    Output: 0
            Input: 1    Output: 1
            Input: 2    Output: 1
            Input: 10   Output: 55
        */
        
        // *** Testing Code ***
        // Integer fib = ProjectZero.fibonacci(10);
        // System.debug(fib);
    }
    
    public static List<Integer> sortArray(List<Integer> numArray) {
        // Selected sort iterate throught the array.size n-1
        // the n will be the # comparison that'll be done.
        Integer arrSize = numArray.size(); 
        for (Integer i = 0; i < arrSize-1; i++) 
        { 
            // LowIndex will be placeholder for where
            // index of lowest value.
            Integer lowIndex = i; // 0 + n iterate
            // Iterating array except index 0, we'll be replacing it
            // with new lowest value.
            for (Integer x = i+1; x < arrSize; x++) {
                if (numArray[x] < numArray[lowIndex]) {
                    // If 0 + 1 index is lower, store index
                    lowIndex = x; 
                }
            }
            
            // Swap new lowest with old lowest
            Integer temp = numArray[lowIndex]; 
            numArray[lowIndex] = numArray[i]; 
            numArray[i] = temp; 
        } 
        
        return numArray;
        
        /*//*** Result ***
            Test Cases:
            Input: [2,4,5,1,3,1]    Output: [1,1,2,3,4,5]
            Input: [5,4,3,2,1]      Output: [1,2,3,4,5]
        */
        
        /*//***Testing code***
            List<Integer> test1 = new List<Integer>{2, 4, 5, 1, 3, 1};
            List<Integer> sortArray = ProjectZero.sortArray(test1);
            for (Integer i : sortArray) { System.debug(i); }

            List<Integer> test2 = new List<Integer>{5, 4, 3, 2, 1};
            List<Integer> sortArray = ProjectZero.sortArray(test2);
            for (Integer i : sortArray) { System.debug(i); }
        */
    }
    
    public static Integer factorial(Integer n) {
        // n! = n * (n-1) * (n-2) ... that's factorial
        // Initializing shorthand
        Integer shorthand = 1;
        for (Integer i = 0; i < n; i++) {
            if (i == n) {
                shorthand = 0;
            } else {
                shorthand *= n-i;
            }
        }
        return shorthand;
        
        /*//*** Result ***
            Return the factorial of n.
            Test Cases:
            Input: 0    Output: 1
            Input: 1    Output: 1
            Input: 3    Output: 6
        */
        
        /*//***Testing code***
            Integer fact = ProjectZero.factorial(3);
            System.debug(fact);
        */
    }
    
    public static List<Integer> rotateLeft(List<Integer> arr, Integer n) {
        // Check if is 0, then do nothing
        if (arr.size() == 0) {
            return arr;
        }  
        
        // loop array n times
        Integer x = 0;
        for(Integer i = 0; i < n; i++)
        {
            // remove last entry, store in x, add at index 0
            x = arr.remove(arr.size() - 1 );
            arr.add(0, x);
        }
        
        return arr;
        
        /*//*** Result ***
            Test Cases:
            Input [1,2,3,4,5], 1    Output: [2,3,4,5,1]
            Input [1,2,3,4,5], 6    Output: [2,3,4,5,1]
            Input [1,2,3,4,5], 3    Output: [4,5,1,2,3]
        */
        
        /*//***Testing code***
            List<Integer> test1 = new List<Integer>{1,2,3,4,5};
            List<Integer> sortArray = ProjectZero.rotateLeft(test1, 1);
            for (Integer i : sortArray) { System.debug(i); }
        */
    }
    
    public static Boolean balancedBrackets(String brackets) {
        List<String> b = brackets.split(' ');
        Integer co,so,sqo,cc,sc,sqc;
        
        boolean balance;
        for (Integer i = 0; i < b.size(); i++) {
            switch on b[i] {
                when '(' {		
                    co += 1;
                }	
                when '{' {		
                    so += 1;
                }
                when '[' {		
                    sqo += 1;
                }
                when ')' {		
                    cc += 1;
                }	
                when '}' {		
                    sc += 1;
                }
                when ']' {		
                    sqc += 1;
                }
                when else {		  
                    System.debug('No Bracket Here');
                }
            }
        }
        
        if (co == cc) {
            balance = true;
        } else {
            balance = false;
        }
        
        if (sqo == sqc) {
            balance = true;
        } else {
            balance = false;
        }
        
        if (so == sc) {
            balance = true;
        } else {
            balance = false;
        }
        
        return true;
        
        /*//*** Result ***
            Test Cases:
            The following are balanced brackets:
                ( )
                ( ) ( )
                ( ( ) )
                ( { [ ] } )
            The following are NOT balanced brackets:
                (
                )
                ( ( )
                ( [ ) ]
        */
        
        /*//***Testing code***
            Boolean bracket = ProjectZero.balancedBrackets('( ) ( ) ( ) ( ( ) ) ( { [ ] } )');
            System.debug(bracket);
        */
    }
    
    public static void updateAccountSize() {
        try {
            // Account placeholder for updated field
            List<Account> AccountList = new List<Account>();
            AccountList = [SELECT NumberOfEmployees, Size__c FROM Account]; 
    		
            // Filter and update size on account
            for (Account a : AccountList)
            {
                if (a.NumberOfEmployees < 1000) {
                    a.Size__c = 'Small';
                }
                else if (a.NumberOfEmployees > 1001 && a.NumberOfEmployees < 10000) {
                    a.Size__c = 'Medium';
                }
                else if (a.NumberOfEmployees < 10001) {
                    a.Size__c = 'Large';
                }
            }
            // commit update
            update AccountList;
        } catch(DMLException e) {
            System.debug('An unexpected error has occurred: ' + e.getMessage());
        }      
        
        /*
            Create a method that retrieves a list of all accounts and updates those accounts.
                Create a custom field on the Account standard object called Size__c that will be a picklist containing small/medium/large.
                If an account has between 1-1000 employees then it is classified as small.
                If an account has between 1001-10000 employees then it is classified as medium.
                If an account has more than 10000 employees then it is classified as large.
                Update the Size__c field on each account to reflect the amount of employees in the Account.
        */
    }
    
    public static void updateCALeads() {
        try {
            // Lead placeholder for updated field
            // PS: Address is compound field, look for its compound on the web
            List<Lead> LeadList = new List<Lead>();
        	LeadList = [SELECT State, Description FROM Lead WHERE State = 'CA']; 
    		
            // Filter and update contents
            for (Lead l : LeadList)
            {
                l.Status = 'Closed – Not Converted';
                l.Description = 'We are no longer doing business in California.';
            }
            // commit update
            update LeadList;
        } catch(DMLException e) {
            System.debug('An unexpected error has occurred: ' + e.getMessage());
        }
        
        /*	// Test Code
            ProjectZero.updateOpportunitiesPastClosedDate();
			SELECT Status, CloseDate FROM Opportunity WHERE StageName = 'Closed Lost'

			Create a method that will find all leads that contain ‘ca’ in their fields. 
			If a Lead is location in California(CA), change their Lead Status to ‘Closed – 
			Not Converted’ and their description should display the message, “We are no 
			longer doing business in California.” 
		*/
    }
    
    public static void updateOpportunitiesPastClosedDate() {
        // Opportunity object is fetch, create today to store today
        // Filter closedate by today and update stagename to close
        try {
            Date today = date.today();
            List<Opportunity> OpportunityList = new List<Opportunity>();
        	OpportunityList = [SELECT CloseDate FROM Opportunity WHERE CloseDate < today]; 
    		
            for (Opportunity o : OpportunityList)
            {
                o.StageName = 'Closed Lost';
            }
            // commit update
            update OpportunityList;
        } catch(DMLException e) {
            System.debug('An unexpected error has occurred: ' + e.getMessage());
        }   
        
        /* // Test Code
            ProjectZero.updateOpportunitiesPastClosedDate();
			SELECT StageName, CloseDate FROM Opportunity WHERE StageName = 'Closed Lost'
			
            Create a method that will find all Opportunities which have already 
            passed their Close Date and have a Stage field that is not ‘Closed Won’. 
            Since they have passed their Close Date and they are not marked as ‘Closed Won’, 
            they should be marked as ‘Closed Lost’.
        */
    }
}