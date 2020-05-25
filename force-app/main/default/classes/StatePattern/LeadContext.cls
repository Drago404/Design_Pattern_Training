public class LeadContext {
    public LeadState State {get; set;} 

    public LeadContext(LeadState CurrentState){ 
        this.State = CurrentState;
    }

    public void calculateTime (Lead lead){
        State.calculateTimePerStatus(lead);
    }
    
    public void changeOwner (Lead lead){
        State.changeOwner(lead);
    }

    public void changeState() {
        State.nextStatus(this);
    }

    public State getState() {
        return State;
    } 
}