import java.beans.XMLDecoder;
import java.io.BufferedReader;
import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.transform.stream.StreamSource;
import javax.xml.validation.Schema;
import javax.xml.validation.SchemaFactory;
import javax.xml.validation.Validator;
import org.rundeck.api.parser.ParserHelper;
import org.apache.commons.digester3.Digester;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class XXE {

	@PostMapping(value = "bad1")
	public void bad1(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ServletInputStream servletInputStream = request.getInputStream();
		Digester digester = new Digester();
		digester.parse(servletInputStream); // bad
	}

	@PostMapping(value = "bad2")
	public void bad2(HttpServletRequest request) throws Exception {
		ServletInputStream servletInputStream = request.getInputStream();
		SchemaFactory factory = SchemaFactory.newInstance("http://www.w3.org/2001/XMLSchema");
		Schema schema = factory.newSchema();
		Validator validator = schema.newValidator();
		StreamSource source = new StreamSource(servletInputStream);
		validator.validate(source); // bad
	}

	@PostMapping(value = "bad3")
	public void bad3(HttpServletRequest request) throws Exception {
		ServletInputStream servletInputStream = request.getInputStream();
		XMLDecoder xmlDecoder = new XMLDecoder(servletInputStream);
		xmlDecoder.readObject(); // bad
	}

	@PostMapping(value = "bad4")
	public void bad4(HttpServletRequest request) throws Exception {
		Document document = ParserHelper.loadDocument(request.getInputStream()); // bad
	}

	@PostMapping(value = "good1")
	public void good1(HttpServletRequest request, HttpServletResponse response) throws Exception {
		BufferedReader br = request.getReader();
		String str = "";
		StringBuilder listString = new StringBuilder();
		while ((str = br.readLine()) != null) {
			listString.append(str);
		}
		Digester digester = new Digester();
		digester.setFeature("http://apache.org/xml/features/disallow-doctype-decl", true);
		digester.setFeature("http://xml.org/sax/features/external-general-entities", false);
		digester.setFeature("http://xml.org/sax/features/external-parameter-entities", false);
		digester.parse(listString.toString());
	}

	@PostMapping(value = "good2")
	public void good2(HttpServletRequest request, HttpServletResponse response) throws Exception {
		BufferedReader br = request.getReader();
		String str = "";
		StringBuilder listString = new StringBuilder();
		while ((str = br.readLine()) != null) {
			listString.append(str).append("\n");
		}
		SchemaFactory factory = SchemaFactory.newInstance("http://www.w3.org/2001/XMLSchema");
		Schema schema = factory.newSchema();
		Validator validator = schema.newValidator();
		validator.setProperty("http://javax.xml.XMLConstants/property/accessExternalDTD", "");
		validator.setProperty("http://javax.xml.XMLConstants/property/accessExternalSchema", "");
		StreamSource source = new StreamSource(listString.toString());
		validator.validate(source);
	}

	@PostMapping(value = "good3")
	public void good3(HttpServletRequest request) throws Exception {
		BufferedReader br = request.getReader();
		String str = "";
		StringBuilder listString = new StringBuilder();
		while ((str = br.readLine()) != null) {
			listString.append(str).append("\n");
		}
		// parseText falls back to a default SAXReader, which is safe
		Document document = DocumentHelper.parseText(listString.toString()); // Safe
	}
}
