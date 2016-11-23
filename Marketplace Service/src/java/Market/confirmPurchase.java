/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Market;

import javax.xml.bind.annotation.XmlElement;

/**
 *
 * @author ASUS
 */
public class confirmPurchase {
    @XmlElement(name="full_name", required=true)
    private String full_name;
    
    @XmlElement(name="full_address", required=true)
    private String full_address;
    
    @XmlElement(name="postalcode", required=true)
    private long postalcode;
    
    @XmlElement(name="phonenumber", required=true)
    private long phonenumber;
    
    public confirmPurchase(){
        full_name="";
        full_address="";
        postalcode=0;
        phonenumber=0;
    }
    
    public confirmPurchase(String fullname, String fulladdress, long postal, long phone){
        full_name=fullname;
        full_address=fulladdress;
        postalcode=postal;
        phonenumber=phone;
    }
}
