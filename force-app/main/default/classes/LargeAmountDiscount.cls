public class LargeAmountDiscount implements AdvancedOrderActions{
    
    static final Integer ABOVE_10K_DISCOUNT = 15;
    static final Integer ABOVE_15K_DISCOUNT = 20;
    
    // method that gives 15% discount to orders above 10000
    // and 20% discount to orders above 15000
    public void giveDiscountByAmount(Order ord){
        
        List<OrderItem> items = [SELECT Id,UnitPrice FROM OrderItem WHERE Id =: ord.Id];
        
        Decimal amount = ord.TotalAmount;
        
        if(amount > 10000.00){
            for(OrderItem oi : items){
                if(amount < 15000.00){
                    oi.UnitPrice = oi.UnitPrice - (ABOVE_10K_DISCOUNT / 100 * oi.UnitPrice);
                } else{
                    oi.UnitPrice = oi.UnitPrice - (ABOVE_15K_DISCOUNT / 100 * oi.UnitPrice);
                }
            }
            update items;
        }        
    }
    
    public void giveDiscountByCountry(Order ord){
        //do nothing
    }
}