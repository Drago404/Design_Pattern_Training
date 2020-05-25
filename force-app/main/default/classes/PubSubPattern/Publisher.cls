public class Publisher {
    
    sObject obj;
    
    public Publisher(sObject obj) {
        this.obj = obj;
    }
    
    // method called from trigger when new sObject is created
    public void publish() {
        ContentServer.getInstance().broadcastSingleObject(this.obj);
    }   
}