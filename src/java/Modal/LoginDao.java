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
    
    public static boolean validate(String email,String pass){
        boolean status = false;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Quench?useSSL=true&verifyServerCertificate=false&allowMultiQueries=true","root","1810");
            PreparedStatement ps = con.prepareStatement("Select * from register where email=? and pass=?");
            ps.setString(1,email);
            ps.setString(2,pass);
            ResultSet rs = ps.executeQuery();
            if(rs.next())
                status = true;
            else{
            
            }
        }
        catch(Exception e){
        
        }
        return status;
    }
}
