
package lecture;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
// import org.postgresql.util.PSQLException;
import java.sql.Statement;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

public class ex04 {
	
    private DocumentBuilderFactory documentBuilderFactory;
    private DocumentBuilder documentBuilder;
    private Document document;
    private NodeList nodeList;
//    public ex01(DocumentBuilderFactory documentBuilderFactory) {
//        this.documentBuilderFactory = documentBuilderFactory;
//    }
    // tag
    private static String getTagValue(String tag, Element eElement) {
        NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
        Node nValue = nlList.item(0);
        if (nValue == null)
            return null;
        return nValue.getNodeValue();
    }
    public static void main(String[] args) throws SQLException, ParserConfigurationException, IOException, SAXException, ClassNotFoundException {
        Connection c = null;
//        Statement stmt;
        PreparedStatement pstmt = null;
        Statement stmt = null;
        String sql = null;
        int page = 1;    // 
        int num = 1;
        // 
            try {
                Class.forName("org.postgresql.Driver");
                c = DriverManager.getConnection("jdbc:postgresql://127.0.0.1:5432/", "postgres", "");
//
                c.setAutoCommit(false);
                System.out.println("Opened database successfully");
                while (true) {

                    String url = "http://api.data.go.kr/openapi/tn_pubr_public_lftm_lrn_lctre_api?ServiceKey=" +
                            "l6vhtdIwEV8YwyNg0UsMEVXE1oGQ4UD6%2BFsIheSKETLVAJ5kib5%2Bx5qgl6xtBQKgz4QcvabUzZsCf8kNG%2FJJag%3D%3D&pageNo=" + page;
                    DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
                    DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
                    Document doc = dBuilder.parse(url);
                    // root tag
                    doc.getDocumentElement().normalize();
                    //                System.out.println("Root element :" + doc.getDocumentElement().getNodeName());
                    // �뙆�떛�븷 tag
                    NodeList nList = doc.getElementsByTagName("item");
                    //                System.out.println("�뙆�떛�븷 由ъ뒪�듃 �닔 : "+ nList.getLength());


                        for (int temp = 0; temp < nList.getLength(); temp++) {
                            Node nNode = nList.item(temp);
                            if (nNode.getNodeType() == Node.ELEMENT_NODE) {
                                Element eElement = (Element) nNode;
                            c.setAutoCommit(false);
                            sql = "INSERT INTO LEARNING_PROGRAM (ID ,L_NAME, ADDRESS, OPERATING_DAY, T_NAME, HP, ON_OFF) "
                                    + "VALUES (?,?,?,?,?,?,?);";

                            int ID = num;
                            String L_NAME = getTagValue("lctreNm", eElement);
                            String ADDRESS = getTagValue("edcRdnmadr", eElement);
                            String T_NAME = getTagValue("instrctrNm", eElement);
                            String OPERATING_DAY = getTagValue("operDay", eElement);
                            String HP = getTagValue("operPhoneNumber", eElement);
                            String ON_OFF = getTagValue("edcMthType", eElement);

                            pstmt = c.prepareStatement(sql);
                            pstmt.setInt(1, ID);
                            pstmt.setString(2, L_NAME);
                            pstmt.setString(3, ADDRESS);
                            pstmt.setString(4, OPERATING_DAY);
                            pstmt.setString(5, T_NAME);
                            pstmt.setString(6, HP);
                            pstmt.setString(7, ON_OFF);
                            pstmt.executeUpdate();

                            System.out.println("id  : " + num);
                            System.out.println("l_NAME  : " + L_NAME);
                            System.out.println("ADDRESS  : " + ADDRESS);
                            System.out.println("T_NAME : " + T_NAME);
                            System.out.println("OPERATING_DAY  : " + OPERATING_DAY);
                            System.out.println("ON_OFF  : " + ON_OFF);
                            System.out.println("HP  : " + HP);
                            System.out.println("Success to save");
                            num++;
                            }

                        }

                        page += 1;
                        if (page > 10) {
                            break;
//                      
//                      
//                      drop table LEARNING_PROGRAM cascade; 移� �떎�쓬�뿉 ex03.java �떎�뻾�븯怨� ex04.java�떎�뻾�븯硫� �맗�땲�떎!
                        }
                    }
                    System.out.println("page number : " + page);
                pstmt.close();
                c.commit();
                c.close();
            } catch (Exception e) {
                System.err.println( e.getClass().getName()+": "+ e.getMessage() );
                System.exit(0);
        }
        System.out.println("Table created successfully");
    }    // class end
}
