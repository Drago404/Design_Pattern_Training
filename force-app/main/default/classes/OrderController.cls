public class OrderController implements OrderActions {
    
    DiscountAdapter da;
    
    /* method that gives discount to order when called
	* 
	* @ord - Order to give discount to
	* @discount - discount in percentage
	*/    
    public void giveDiscount(Order ord, Integer discount){
        
        if(discount > 0 && discount < 100){
            
            // adapter Logic added to give larger discount in certain cases
            if((ord.BillingCountry == 'US' || ord.BillingCountry == 'CA' && discount < 10) ||
               (ord.TotalAmount > 10000.00 && discount < 15) ||
               (ord.TotalAmount > 15000.00 && discount < 20)){
                   da = new DiscountAdapter(ord);
                   da.giveDiscount(ord,discount);
               }//
            else{
                List<OrderItem> items = [SELECT Id,UnitPrice FROM OrderItem WHERE Id =:ord.Id];
                
                for (OrderItem oi : items){
                    oi.UnitPrice = oi.UnitPrice - (discount / 100 * oi.UnitPrice);
                }
                
                update items;
            }
        }
    } 
}