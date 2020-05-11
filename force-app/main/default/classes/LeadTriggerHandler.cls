public class LeadTriggerHandler {

    // -------------------------------------------------------
    // INSERT
    // -------------------------------------------------------

    public static void handleBeforeInsert(List<Lead> newList) {

    }

    public static void handleAfterInsert(List<Lead> newList, Map<Id, Lead> newMap) {

    }

    // -------------------------------------------------------
    // UPDATE
    // -------------------------------------------------------

    public static void handleBeforeUpdate(List<Lead> oldList, Map<Id, Lead> oldMap,
            List<Lead> newList, Map<Id, Lead> newMap) {
                
                // when lead status is changed track the time spent in previous stage
                // and change owner depending on the stage
                for (Lead lead : newList){
                    if(lead.Status != oldmap.get(lead.Id).Status){
                        LeadContext context = new LeadContext(lead.Status);
                        context.calculateTime(lead);
                        context.changeOwner(lead);
                    }
                }     
    }

    public static void handleAfterUpdate(List<Lead> oldList, Map<Id, Lead> oldMap,
            List<Lead> newList, Map<Id, Lead> newMap) {

    }

    // -------------------------------------------------------
    // DELETE
    // -------------------------------------------------------

    public static void handleBeforeDelete(List<Lead> oldList, Map<Id, Lead> oldMap) {

    }

    public static void handleAfterDelete(List<Lead> oldList, Map<Id, Lead> oldMap) {

    }
}