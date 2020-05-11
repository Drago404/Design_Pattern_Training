public class ContactAddressTemperatureProxy implements WeatherActions{
    
    private ContactAddressTemperature cad;
    private Decimal currentTemp;   
    
    // Prevents multiple calls to external service
    public Decimal getCurrentTemperature(Contact con){
        
        if(null == cad){
            cad = new ContactAddressTemperature();
            currentTemp = cad.getCurrentTemperature(con);
        }
        return currentTemp;
    }
}