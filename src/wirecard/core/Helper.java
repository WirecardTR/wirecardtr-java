package wirecard.core;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import javax.xml.bind.DatatypeConverter;
import org.xml.sax.InputSource;
import javax.xml.parsers.DocumentBuilderFactory;
import java.io.StringReader;
import java.io.StringWriter;
import java.io.Writer;
import javax.xml.bind.JAXB;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.bootstrap.DOMImplementationRegistry;
import org.w3c.dom.ls.DOMImplementationLS;
import org.w3c.dom.ls.LSSerializer;

public class Helper {	

	
    public static String xmlFormatter(String xml) {

        try {
            final InputSource src = new InputSource(new StringReader(xml));
            final Node document = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(src).getDocumentElement();
            final Boolean keepDeclaration = Boolean.valueOf(xml.startsWith("<?xml"));

      

            final DOMImplementationRegistry registry = DOMImplementationRegistry.newInstance();
            final DOMImplementationLS impl = (DOMImplementationLS) registry.getDOMImplementation("LS");
            final LSSerializer writer = impl.createLSSerializer();

            writer.getDomConfig().setParameter("format-pretty-print", Boolean.TRUE); // Set this to true if the output needs to be beautified.
            writer.getDomConfig().setParameter("xml-declaration", keepDeclaration); // Set this to true if the declaration is needed to be outputted.

            return writer.writeToString(document);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
}
    
	/*
         * XML verisinin ekranda daha düzgün kullanýlmasý için kullanýlan metodu temsil eder.
         * Kullaným amacý ekranlarda daha düzgün þekilde gösterilmesidir.
	 
	*/
   public static  String prettyPrintXml(String xmlString)  throws Exception  {

     try 
        {  
            xmlString=xmlFormatter(xmlString);
        
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();  
        DocumentBuilder builder;  
        Document doc ;
        
            builder = factory.newDocumentBuilder();  
             doc = builder.parse( new InputSource( new StringReader( xmlString )) ); 

       
        Transformer tf = TransformerFactory.newInstance().newTransformer();
       
        tf.setOutputProperty(OutputKeys.INDENT, "yes");
          tf.setOutputProperty(OutputKeys.OMIT_XML_DECLARATION, "no");
      
        Writer out = new StringWriter();
        tf.transform(new DOMSource(doc), new StreamResult(out));
         return out.toString().replace("<", "&lt;");
       } catch (Exception e) {  
            e.printStackTrace();  
            return null;
        } 
    }
   
}

