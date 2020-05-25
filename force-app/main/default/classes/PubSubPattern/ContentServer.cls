// class that helps mediate the messaging between publisher and subscriber
public class ContentServer {
    
    private Map<sObject, List<Subscriber>> sObjectToSubscribersMap;
    private static ContentServer serverInstance;
    
    public static ContentServer getInstance() {
        if (serverInstance == null) {
            serverInstance = new ContentServer();
        }
        return serverInstance;
    }
    
    private ContentServer() {
        sObjectToSubscribersMap = new Map<sObject, List<Subscriber>>();
        getSubscribers();
    }
    
    public void getSubscribers(){
        // Query Subscriber object that keeps email and subscribed object for each subscriber
        List<Subscriber__mdt> subs = [SELECT SubscriberEmail__c,SubscribedObject__c FROM Subscriber__mdt];
        
        for(Subscriber__mdt sub : subs){
            Subscriber s = new Subscriber(sub.SubscriberEmail__c);
            sObject objType = Schema.getGlobalDescribe().get(sub.SubscribedObject__c).newSObject();
            
            if(sObjectToSubscribersMap.containsKey(objType)){
                sObjectToSubscribersMap.get(objType).add(s);
            } else {
                List<Subscriber> subList = new List<Subscriber>();
                subList.add(s);
                sObjectToSubscribersMap.put(objType, subList);
            }
        }    
    }
    
    // send notifications for specific sObject
    public void broadcastSingleObject(sObject obj) {
        List<Subscriber> subs = sObjectToSubscribersMap.get(obj);
        for (Subscriber s : subs) {
            s.sendMail(obj);
        }
    }
    
    // send notifications for all sObjects
    public void broadcastAllObjects() {
        for(sObject obj : sObjectToSubscribersMap.keySet()){
            broadcastSingleObject(obj);
        }
    }
    
    public void addSubscriber (Subscriber s, sObject obj){
        sObjectToSubscribersMap.get(obj).add(s);
    }
}