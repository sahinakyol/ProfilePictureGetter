package src;

import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;
import javax.jws.soap.SOAPBinding.Style;

@WebService
@SOAPBinding(style = Style.RPC)
public class Webservices {

    Parser parser = new Parser();
    public String getTwitter(String Username){
        return parser.twitterPictureURL(Username);

    }
    public String getInstagram(String Username){
        return parser.instagramPictureURL(Username);
    }

}
