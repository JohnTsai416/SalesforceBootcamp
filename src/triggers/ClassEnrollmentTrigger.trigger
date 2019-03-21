trigger ClassEnrollmentTrigger on Class_Enrollment__c (before insert, after insert, before update, after update) {
    if (Trigger.isBefore) {
        DummyGrade.checkForEnrollmentDuplicates(Trigger.new);
    } else if (Trigger.isAfter && Trigger.isInsert) {
        DummyGrade.DefaultGrade(Trigger.new);
    }
}