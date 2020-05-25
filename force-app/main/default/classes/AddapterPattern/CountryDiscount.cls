public class CountryDiscount implements AdvancedOrderActions{
    
    static final Integer COUNTRY_DISCOUNT_PERCENTAGE = 10;
    
    // method that gives discount based on Country
    public void giveDiscountByCountry(Order ord){
        
        List<OrderItem> items = [SELECT Id,UnitPrice FROM OrderItem WHERE Id =: ord.Id];
        
        if(ord.BillingCountry == 'US' || ord.BillingCountry == 'CA'){
            for(OrderItem oi : items){
                oi.UnitPrice = oi.UnitPrice - (COUNTRY_DISCOUNT_PERCENTAGE / 100 * oi.UnitPrice);
            }
            update items;
        }
    }
    
    public void giveDiscountByAmount(Order ord){
        //do nothing
    }
}