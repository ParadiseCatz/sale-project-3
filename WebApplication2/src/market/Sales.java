
package market;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for sales complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="sales">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="idpenjual" type="{http://www.w3.org/2001/XMLSchema}int"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "sales", propOrder = {
    "idpenjual"
})
public class Sales {

    protected int idpenjual;

    /**
     * Gets the value of the idpenjual property.
     * 
     */
    public int getIdpenjual() {
        return idpenjual;
    }

    /**
     * Sets the value of the idpenjual property.
     * 
     */
    public void setIdpenjual(int value) {
        this.idpenjual = value;
    }

}
