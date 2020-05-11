public class ConvertedLeadState implements LeadState {
    
    /* set date/time when status changed to Closed - Converted
	*  and calculate time spend in previous Status
	*/
    public void calculateTimePerStatus(Lead lead){
        
        Datetime dateTimeConverted = System.now();
        
        Long timeInMiliseconds = dateTimeConverted.getTime() - lead.Date_Time_Working__c.getTime();
        Integer timeInSeconds = (Integer) timeInMiliseconds/1000;
        
        lead.Time_Spent_Attempted__c = Time.newInstance(0, 0, timeInSeconds, 0);
        
    }
    
    // Change owner to global manager
    public void changeOwner(Lead lead){
        
        List <User> users = [SELECT Id, Username FROM User WHERE Username = 'globalManager@test.com' LIMIT 1];
        lead.OwnerId = users.get(0).Id;
        
    }
}