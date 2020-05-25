public class ContactAddressTemperature implements WeatherActions{
  
    // Calls an external service and returns the current temperature for a given contacts Address
    public Decimal getCurrentTemperature(Contact con){
        
        if(con.MailingCity != null){
            Http http = new Http();
            HttpRequest request = new HttpRequest();
            request.setEndpoint('http://api.openweathermap.org/data/2.5/weather?q='+ con.MailingCity +'&appid=04c627a715cc0603b16f22f220e6233b&units=metric');
            request.setMethod('GET');
            HttpResponse response = http.send(request);
            // If the request is successful, parse the JSON response.
            if (response.getStatusCode() == 200) {
                // Deserialize the JSON string
                Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
                Map<String, Object>  main =(Map<String, Object>)results.get('main');
                
                return (Decimal) main.get('temp');
            } else {
                System.debug(response.getStatusCode() + ' ' + response.getStatus());
            }
        }
        return null;
    }
}