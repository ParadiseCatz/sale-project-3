
package market;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for confirmPurchase complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="confirmPurchase">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="full_name" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="full_address" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="postalcode" type="{http://www.w3.org/2001/XMLSchema}long"/>
 *         &lt;element name="phonenumber" type="{http://www.w3.org/2001/XMLSchema}long"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "confirmPurchase", propOrder = {
    "fullName",
    "fullAddress",
    "postalcode",
    "phonenumber"
})
public class ConfirmPurchase {

    @XmlElement(name = "full_name", required = true)
    protected String fullName;
    @XmlElement(name = "full_address", required = true)
    protected String fullAddress;
    protected long postalcode;
    protected long phonenumber;

    /**
     * Gets the value of the fullName property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getFullName() {
        return fullName;
    }

    /**
     * Sets the value of the fullName property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setFullName(String value) {
        this.fullName = value;
    }

    /**
     * Gets the value of the fullAddress property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getFullAddress() {
        return fullAddress;
    }

    /**
     * Sets the value of the fullAddress property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setFullAddress(String value) {
        this.fullAddress = value;
    }

    /**
     * Gets the value of the postalcode property.
     * 
     */
    public long getPostalcode() {
        return postalcode;
    }

    /**
     * Sets the value of the postalcode property.
     * 
     */
    public void setPostalcode(long value) {
        this.postalcode = value;
    }

    /**
     * Gets the value of the phonenumber property.
     * 
     */
    public long getPhonenumber() {
        return phonenumber;
    }

    /**
     * Sets the value of the phonenumber property.
     * 
     */
    public void setPhonenumber(long value) {
        this.phonenumber = value;
    }

}
