// This class bridges OrderInterface and AdvancedOrderInterface
public class DiscountAdapter implements OrderActions {
    
    AdvancedOrderActions aoa;
    
    public DiscountAdapter(Order ord){
         
        if(ord.TotalAmount > 10000.00){
            aoa = new LargeAmountDiscount();
        } else if(ord.BillingCountry == 'US' || ord.BillingCountry == 'CA'){
            aoa = new CountryDiscount();
        }
    }
    
    public void giveDiscount(Order ord, Integer discount){
        
        if((ord.TotalAmount > 10000.00 && discount < 15) ||
           (ord.TotalAmount > 15000.00 && discount < 20)){
            aoa.giveDiscountByAmount(ord);
        } else if(ord.BillingCountry == 'US' || ord.BillingCountry == 'CA' && discount < 10){
            aoa.giveDiscountByCountry(ord);
        } 
    }
}