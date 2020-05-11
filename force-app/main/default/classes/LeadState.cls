public interface LeadState {
    void calculateTimePerStatus(Lead lead);
    void changeOwner(Lead lead);
}