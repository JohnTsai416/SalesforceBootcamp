trigger ContactTrigger on Contact (before insert, after insert, before update, after update) {
    // Use trigger context variable to pinpoint trigger type
    if (Trigger.isAfter && Trigger.isInsert) {
        // This is executed every time after the trigger is fired and inserted
        // pass the new trigger value inside postToChatter parameter
        PostToChatterContact.postChatterContact(Trigger.new);
    } else if (Trigger.isBefore && Trigger.isInsert) {
        DuplicateChecker.checkForContactDuplicates(Trigger.new);
    }
    
    /* This works too but too messy
    if (Trigger.isBefore) {
        if (Trigger.isInsert) {
            // Do stuff
        }
    } else {
        if (Trigger.isInsert) {
            PostToChatterContact.postChatterContact(Trigger.new);
        }
    }
	*/
}