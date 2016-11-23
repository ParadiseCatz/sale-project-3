
package market;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for confirmationPurchase complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="confirmationPurchase">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="idPembeli" type="{http://www.w3.org/2001/XMLSchema}int"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "confirmationPurchase", propOrder = {
    "idPembeli"
})
public class ConfirmationPurchase {

    protected int idPembeli;

    /**
     * Gets the value of the idPembeli property.
     * 
     */
    public int getIdPembeli() {
        return idPembeli;
    }

    /**
     * Sets the value of the idPembeli property.
     * 
     */
    public void setIdPembeli(int value) {
        this.idPembeli = value;
    }

}
