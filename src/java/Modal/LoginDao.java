/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modal;

import static com.sun.corba.se.spi.presentation.rmi.StubAdapter.request;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author shobhit
 */
public class LoginDao {
    
    public static boolean validate(String email,String pass,String servlet){
        boolean status = false;
        
        System.out.println(email+" "+pass);
        try{
            PreparedStatement ps;
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/startupBee?useSSL=true&verifyServerCertificate=false&allowMultiQueries=true","root","1810");
            if(servlet.equals("corp"))
            ps = con.prepareStatement("select * from registerCoorp where email=? and pass=?");
            else
            ps = con.prepareStatement("select * from registerInno where email=? and pass=?");
            ps.setString(1,email);
            ps.setString(2,pass);
            ResultSet rs = ps.executeQuery();
            status = rs.next();
        }
        catch(Exception e){
            System.out.println(e);   
        }
        return status;
    }
}
