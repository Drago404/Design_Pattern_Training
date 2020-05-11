trigger LeadTrigger on Lead ( before insert, before update, before delete,
                                       after insert, after update, after delete ) {

        if (Trigger.isBefore && Trigger.isInsert) {
            LeadTriggerHandler.handleBeforeInsert(Trigger.new);
        } else if (Trigger.isBefore && Trigger.isUpdate) {
            LeadTriggerHandler.handleBeforeUpdate(Trigger.old, Trigger.oldMap, Trigger.new, Trigger.newMap);
        } else if (Trigger.isBefore && Trigger.isDelete) {
            LeadTriggerHandler.handleBeforeDelete(Trigger.old, Trigger.oldMap);
        } else if (Trigger.isAfter && Trigger.isInsert) {
            LeadTriggerHandler.handleAfterInsert(Trigger.new, Trigger.newMap);
        } else if (Trigger.isAfter && Trigger.isUpdate) {
            LeadTriggerHandler.handleAfterUpdate(Trigger.old, Trigger.oldMap, Trigger.new, Trigger.newMap);
        } else if (Trigger.isAfter && Trigger.isDelete) {
            LeadTriggerHandler.handleAfterDelete(Trigger.old, Trigger.oldMap);
        }
}