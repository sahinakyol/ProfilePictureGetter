package webs;
import javax.xml.ws.Endpoint;

public class Publisher {

	public static void main(String[] args) {

		Endpoint endpoint = Endpoint.publish("http://localhost:8080/pubws", new DataGetter());
		System.out.println(endpoint.isPublished());
		System.out.println("Port published at : "+"http://localhost:8080/pubws?wsdl");
	}

}
