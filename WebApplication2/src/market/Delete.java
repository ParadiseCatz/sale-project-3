
package market;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for delete complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="delete">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="idpenjual" type="{http://www.w3.org/2001/XMLSchema}int"/>
 *         &lt;element name="idbarang" type="{http://www.w3.org/2001/XMLSchema}int"/>
 *         &lt;element name="namabarang" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "delete", propOrder = {
    "idpenjual",
    "idbarang",
    "namabarang"
})
public class Delete {

    protected int idpenjual;
    protected int idbarang;
    protected String namabarang;

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

    /**
     * Gets the value of the idbarang property.
     * 
     */
    public int getIdbarang() {
        return idbarang;
    }

    /**
     * Sets the value of the idbarang property.
     * 
     */
    public void setIdbarang(int value) {
        this.idbarang = value;
    }

    /**
     * Gets the value of the namabarang property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getNamabarang() {
        return namabarang;
    }

    /**
     * Sets the value of the namabarang property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setNamabarang(String value) {
        this.namabarang = value;
    }

}
