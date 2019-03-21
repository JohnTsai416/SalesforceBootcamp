trigger AssessmentTrigger on Assessment__c (before insert, after insert, before update, after update) {
	if (Trigger.isBefore) {
        AssmntDummyGrade.checkForAssmntDuplicates(Trigger.new);
    } else if (Trigger.isAfter && Trigger.isInsert) {
        AssmntDummyGrade.DefaultGrade(Trigger.new);
    }
}