public class LeadContext {
    public LeadState State {get; set;} 
    
    public LeadContext(String leadStatus){ 
        if(leadStatus == 'Attempted - Not Contacted'){ 
            this.State = new AttepmtedLeadState();     
        } 
        else if(leadStatus == 'Working - Contacted'){ 
            this.State = new WorkingLeadState();     
        } 
        else if(leadStatus == 'Closed - Converted'){ 
            this.State = new ConvertedLeadState();     
        } 
    }
    
    public void calculateTime (Lead lead){
        State.calculateTimePerStatus(lead);
    }
    
    public void changeOwner (Lead lead){
        State.changeOwner(lead);
    }
}