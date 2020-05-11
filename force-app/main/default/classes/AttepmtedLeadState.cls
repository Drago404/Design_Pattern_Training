public class AttepmtedLeadState implements LeadState {
    
    /* set date/time when status changed to Attempted - Not Contacted
	*  and calculate time spend in previous Status
	*/
    public void calculateTimePerStatus(Lead lead){
        
        lead.Date_Time_Attepmted__c = System.now();
        
        Long timeInMiliseconds = lead.Date_Time_Attepmted__c.getTime() - lead.CreatedDate.getTime();
        Integer timeInSeconds = (Integer) timeInMiliseconds/1000;
        
        lead.Time_Spent_Open__c = Time.newInstance(0, 0, timeInSeconds, 0);
        
    }
    
    // Change the owner to the current user
    public void changeOwner(Lead lead){
        
        lead.OwnerId = UserInfo.getUserId();
        
    }
}