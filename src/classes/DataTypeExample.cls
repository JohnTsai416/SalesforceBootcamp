public class DataTypeExample {
    /*
    // Boolean example - can be set to true/false/null
    boolean isWeekend;
    isWeekend = false;
    
    // Use system.debug() to print to a debug log.
    System.debug('is weekend = ' + isWeekend);
    
    // Date Example - A value that indicates a particular day.
    Date myDate = date.newInstance(2019, 3, 5);
    System.debug('Todays Date: ' + myDate);
    
    // Decimal - A number that includes a decimal point.
    // Currency fields are automatically assigned Decimal.
    Decimal cost = 19.99;
    System.debug('cost = ' + cost);
    
    // Double - A 64-bit number that includes a decimal point.
    Double pi = 3.14159;
    
    // Decimal vs Double - you should NEVER use floating point representations (DOuble)
    // to handle monetary calculations, instead use Decimals.
    
    Double zeroPointZeroONE = 0.01;
    Double doubleSum = 0.0;
    for (Integer i = 0; i < 10; i++) {
        doubleSum =+ zeroPointZeroONE;
    }
    
    Sytstem.debug('doubleSum +' + doubleSum);
    // Never use double for currency, only use decimal for it.
    
    // Integer - A 32-bit number that does not include a decimal
    // Min = -2,147,483,648 & Max = 2,147,483,647
    Integer age = 23;
    
    // Long - a 64-bit that does not include a decimal.
    Long distanceInInchestoTheMoon = 14295473280L;
    
    // Object - Any data type that is supported in Apex
    Object obj1 = 10;
    Object obj2 = new Account(Name = 'Matt');
    System.debug('obj1: ' + obj1);
    System.debug('obj2: ' + obj2);
    
    // String - Any set of characters surrounded by single quotes
    String sentence = 'the quick brown fox jump over the lazy dog';
    
    // sObject - Any salesforce object
    sObject c2 = new Contact();
    sObject class1 = new Class__c();
    Contact c = new Contact();
    c.lastName = 'Ruiz';
    System.debug('c.lastname = ' + c.lastName);
    
    // If a method is not meant to return anything, set its return type to void.
    void helloWorld() {
        System.debug('Hello World!');
    }
    
    helloWorld();
    
    Integer addTwoNumber(Integer num1, Integer num2) {
        Integer totSum = num1 + num2;
        return totSum;
    }
    
    Integer sum = addTwoNumber(1,3);
    System.debug('Sum = ' + sum);
    
    // Pass by value
    void changeInteger(Integer i) {
        i = 5;
    }
    
    Integer num = 20;
    changeInteger(num);
    System.debug('num = ' + num);

    void changeAccount(Account a) {
        a.name = 'test';
    }

	Account a = new Account(Name = 'Matt');
	changeAccount(a);
	System.debug('a: ' + a);
	
	// Assignment operator ( = )
    Integer x = 1;
    
    // Addition operator
    X += 1;
    System.debug('x: ' + x);
    
    // OR Assignment operator ( |= )
    Boolean isWeekend = false;
    Boolean isHoliday = true;
    
    isHoliday |= isWeekend; // isHoliday = (isHoliday || isWeekend)
    System.debug(isHoliday);
    
    // AND Assignment operator ( &= )
    Boolean isWeekend = false;
    Boolean isHoliday = true;
    
    isHoliday &= isWeekend; // isHoliday = (isHoliday && isWeekend)
    System.debug(isHoliday);
    
    // Ternary Operator ( ? : )
    Boolean b = ( 5 < 6 ) ? true : false;
    System.debug('b: ' + b);
    b = ( 5 > 6 ) ? true : false;
    System.debug('b: ' + b);
    
    // Or Logical Operator ( || )
    System.debug('(true || true' + (true || true));
    System.debug('(true || false' + (true || false));
    System.debug('(false || true' + (false || true));
    System.debug('(false || false' + (false || false));
    
    // Or Logical Operator ( && )
    System.debug('(true && true' + (true && true));
    System.debug('(true && false' + (true && false));
    System.debug('(false && true' + (false && true));
    System.debug('(false && false' + (false && false));
    
    // Equality Logical Operator ( == )
    System.debug('(5 == 5)' + (5 == 5));
    System.debug('(6 == 5)' + (6 == 5));
    
    // Exact Equality Operator ( === )
    Account a1 = new Account(Name='Matt');
    Account a2 = new Account(Name='Matt');
    System.debug(a1 === a2); // false
    Account a3 = a1;
    System.debug(a3 === a1); // true
    a1.Name = 'test';
    System.debug('a1.Name' + a1.Name);
    System.debug('a3.Name' + a3.Name);
    
    // Prefix decrement operator ( --x )
    Integer x = 0;
    System.debug('--x ' + x);
    
    // Postfix decrement operator ( x-- )
    Integer x = 0;
    System.debug('x-- ' + x);
    System.debug('x ' + x);
    Integer x = 0;
    System.debug('--x ' + x);
    
    // Operator Puzzle, what is x?
    Integer x = 0;
    System.debug((x++ * ((++x == --x) ? 4 : 5) * x++) + (x++ * x--));
    // (x++ * ((++x == --x) ? 4 : 5) * x++) + (x++ * x--)
    // x = 0 2 1 1 2 3 2, solve for x in sequence first, x is living being
    // (0 * ((2 == 1) ? 4 : 5) * 1) + (2 * 3) = 0 + 6 = 6

    public enum Season { WINTER, SPRING, SUMMER, AUTUMN }
    
    Season october = Season.AUTUMN;
    System.debug('October is in '+ october.ordinal());
    
    // If statement
    // If statemetns evaluate a boolean value
    if (4 < 5) {
        System.debug('false');
    } else {
        System.debug('true');
    } 
    
    Integer testScore = 90;
    
    if (testScore >= 90) {
        System.debug('A');
    } else if (testScore >= 80) {
        System.debug('B');
    } else if (testScore >= 70) {
        System.debug('C');
    } else if (testScore >= 65) {
        System.debug('D');
    } else {
        System.debug('F');
    }
    
    Apex Switch statement expressions can be one of the follow types
    - Integer, Long, sObject, String, Enum
    
    Integer i = 0;
    switch on i {
        when 2, 4, 6, 8 {
            System.debug('Even: ' + i);
        }
        when 1, 3, 5, 7 {
            System.debug('Odd: ' + i);
        }
        when else {
            System.debug('Zero: ' + i);
        }
    }
    
    Season s = Season.SUMMMER;
    
    switch on s {
        when SUMMER {
            System.debug('Summer');
        } when WINTER {
            System.debug('Winter');
        }
    }
    
    // Do-while
    
        The Apex do-while loop repeat executes a block of code as long as a particular 
        boolean condition remains true. The apex do-while loop does not check the 
        boolean remain true. The apex do while loop does not check boolean condition 
        statement until after the first loop is executed. consequently, the code 
        block always run at least once.
    
    Int count = 0;
    
    do {
        System.debug('count: ' + count);
        count++;
    } while (count > 10);
    
    // While
    
        The Apex while loop repeat executes a block of code as long as a particular 
        boolean condition remains true. 
    
    // While loop
    Integer count = 0;
    while (count < 10) {
        System.debug('count: ' + count);
        count++;
    }
    
    // For loop
    for (integer i = 0; i < 10; i += 2) {
        System.debug('i: ' + i);
    }

	// For loop - list or set iteration for loops
    for (Integer i : myGrades) {
        System.debug(i);
    }

	List<Account> accountList = new List<Account>();
	List<Account> accountList = [SELECT ID, BillingState FROM Account];
	System.debug('accounts: + ' + accountList);
        
    for (Integer i = 0; i < accountList.size(); i++) {
    	accountList[i].BillingState = 'VA';
    }
	System.debug('accounts: + ' + accountList);
	
	List<Account> accountList = [SELECT ID, BillingState FROM Account];
	for (Account a : accountList) {
    	a.BillingState = 'VA';
    }
	System.debug('accounts: + ' + accountList);

    List<Integer> myGrades = new List<Integer>();
    
    // Add items to list
    myGrades.add(75);
    myGrades.add(80);
    myGrades.add(81);
    myGrades.add(90);
    myGrades.add(92);
    
    System.debug('My Grade = ' + myGrades);
    // Index starts at 0, not 1
    System.debug('My Grade = ' + myGrades[0]);
    
    for (Integer i = 0; i < myGrades.size(); i++) {
        System.debug('MyGrade ' (i + 1) ': ' + myGrades[i]);
    }
    
    // Setting liust values upon instantiatio
    List<String> associateSet = new List<String> ('David','Lynette', 'Hannah', 'Pilar');
    
        for (Integer i = 0; i <associates.size(); i++) {
            System.debug(associates[i]);
        }
    
    // Set - unordered collection with no duplicates
    Set<String> associateSet = new Set<String> ('David','Lynette', 'Hannah', 'Pilar');
    associateSet.add('Harry');
    
    // Maps
    Map<String, Integer> monthsToDay = new Map<String, Integer>();
    monthsToDay.put('Feb', 31);
    monthsToDay.put('Jan', 28);
    System.debug('monthsToDay: ' + monthsToDay);
    System.debug('Jan: ' + monthsToDay.get('Jan'));


*/


}