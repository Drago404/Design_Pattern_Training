public class Subscriber {
    
    private String usrEmail;
    
    public Subscriber(String usrEmail) {
        this.usrEmail = usrEmail;
    }
    
    //Sends email to the subscriber depending on the type of sObject passed
    public void sendMail(sObject obj) {
        
        Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
        message.toAddresses = new String[] {this.usrEmail};
        
        switch on obj {
            when Account a{
                //Send email for newly created account
                message.subject = 'New account created';
				message.plainTextBody = 'Account ' + a.Name + ' was crated on ' + a.CreatedDate;
                Messaging.SingleEmailMessage[] messages =   new List<Messaging.SingleEmailMessage> {message};
                Messaging.sendEmail(messages);
            }
            when Contact c{
                //Send email for newly created contact
                message.subject = 'New contact created';
				message.plainTextBody = 'Contact ' + c.Name + ' was crated on ' + c.CreatedDate;
                Messaging.SingleEmailMessage[] messages =   new List<Messaging.SingleEmailMessage> {message};
                Messaging.sendEmail(messages);
            }
        }
    }
}