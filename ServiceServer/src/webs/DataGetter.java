package webs;

import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;
import javax.jws.soap.SOAPBinding.Style;

@WebService
@SOAPBinding(style=Style.RPC)
public class DataGetter {
		
	Websites websites = new Websites();
	
	public String getInsPic(String username){
			
		return websites.getInstagram()+username;
	}
	
	public String getTwitPic(String username){
		
		return websites.getTwitter()+username;
	}
}
