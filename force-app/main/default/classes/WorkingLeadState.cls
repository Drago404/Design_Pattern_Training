public class WorkingLeadState implements LeadState {
    
    /* set date/time when status changed to Working - Contacted
    *  and calculate time spend in previous Status
	*/
    public void calculateTimePerStatus(Lead lead){
        
        lead.Date_Time_Working__c = System.now();
        
        Long timeInMiliseconds = lead.Date_Time_Working__c.getTime() - lead.Date_Time_Attepmted__c.getTime();
        Integer timeInSeconds = (Integer) timeInMiliseconds/1000;
        
        lead.Time_Spent_Attempted__c = Time.newInstance(0, 0, timeInSeconds, 0);
    }
    
    // Change the owner depeding on LeadSource
    public void changeOwner(Lead lead){
        
        if(null != lead.LeadSource){
            
            Id usrId;
            
            switch on lead.LeadSource{
                when 'Web'{      
                    usrId = getUserId('webManager@test.com');
                    
                    if(null != usrId)
                        lead.OwnerId = usrId;
                }
                when 'Phone Inquiry'{
                    usrId = getUserId('phoneManager@test.com');
                    
                    if(null != usrId)
                        lead.OwnerId = usrId;
                }
                when else{
                    usrId = getUserId('globalManager@test.com');
                    
                    if(null != usrId)
                        lead.OwnerId = usrId;
                }
            }
        }
    }
    
    public static Id getUserId (String username){
        
        List<User> users = [SELECT Id, Username FROM User WHERE Username =: username LIMIT 1];
        
        if(!users.isEmpty()){
            return users.get(0).Id;
        } else {
            return null;
        }
    }
}