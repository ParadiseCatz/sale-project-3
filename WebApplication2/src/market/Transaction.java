
package market;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for transaction complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="transaction">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="id" type="{http://www.w3.org/2001/XMLSchema}int"/>
 *         &lt;element name="id_pembeli" type="{http://www.w3.org/2001/XMLSchema}int"/>
 *         &lt;element name="quantity" type="{http://www.w3.org/2001/XMLSchema}int"/>
 *         &lt;element name="cosignee" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="full_address" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="postal_code" type="{http://www.w3.org/2001/XMLSchema}int"/>
 *         &lt;element name="phone_number" type="{http://www.w3.org/2001/XMLSchema}long"/>
 *         &lt;element name="creditcard_number" type="{http://www.w3.org/2001/XMLSchema}long"/>
 *         &lt;element name="creditcard_verification" type="{http://www.w3.org/2001/XMLSchema}int"/>
 *         &lt;element name="nama_barang" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="harga_barang" type="{http://www.w3.org/2001/XMLSchema}long"/>
 *         &lt;element name="foto" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="id_penjual" type="{http://www.w3.org/2001/XMLSchema}int"/>
 *         &lt;element name="waktu_transaksi" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "transaction", propOrder = {
    "id",
    "idPembeli",
    "quantity",
    "cosignee",
    "fullAddress",
    "postalCode",
    "phoneNumber",
    "creditcardNumber",
    "creditcardVerification",
    "namaBarang",
    "hargaBarang",
    "foto",
    "idPenjual",
    "waktuTransaksi"
})
public class Transaction {

    protected int id;
    @XmlElement(name = "id_pembeli")
    protected int idPembeli;
    protected int quantity;
    @XmlElement(required = true)
    protected String cosignee;
    @XmlElement(name = "full_address", required = true)
    protected String fullAddress;
    @XmlElement(name = "postal_code")
    protected int postalCode;
    @XmlElement(name = "phone_number")
    protected long phoneNumber;
    @XmlElement(name = "creditcard_number")
    protected long creditcardNumber;
    @XmlElement(name = "creditcard_verification")
    protected int creditcardVerification;
    @XmlElement(name = "nama_barang", required = true)
    protected String namaBarang;
    @XmlElement(name = "harga_barang")
    protected long hargaBarang;
    @XmlElement(required = true)
    protected String foto;
    @XmlElement(name = "id_penjual")
    protected int idPenjual;
    @XmlElement(name = "waktu_transaksi", required = true)
    protected String waktuTransaksi;

    /**
     * Gets the value of the id property.
     * 
     */
    public int getId() {
        return id;
    }

    /**
     * Sets the value of the id property.
     * 
     */
    public void setId(int value) {
        this.id = value;
    }

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

    /**
     * Gets the value of the quantity property.
     * 
     */
    public int getQuantity() {
        return quantity;
    }

    /**
     * Sets the value of the quantity property.
     * 
     */
    public void setQuantity(int value) {
        this.quantity = value;
    }

    /**
     * Gets the value of the cosignee property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCosignee() {
        return cosignee;
    }

    /**
     * Sets the value of the cosignee property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCosignee(String value) {
        this.cosignee = value;
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
     * Gets the value of the postalCode property.
     * 
     */
    public int getPostalCode() {
        return postalCode;
    }

    /**
     * Sets the value of the postalCode property.
     * 
     */
    public void setPostalCode(int value) {
        this.postalCode = value;
    }

    /**
     * Gets the value of the phoneNumber property.
     * 
     */
    public long getPhoneNumber() {
        return phoneNumber;
    }

    /**
     * Sets the value of the phoneNumber property.
     * 
     */
    public void setPhoneNumber(long value) {
        this.phoneNumber = value;
    }

    /**
     * Gets the value of the creditcardNumber property.
     * 
     */
    public long getCreditcardNumber() {
        return creditcardNumber;
    }

    /**
     * Sets the value of the creditcardNumber property.
     * 
     */
    public void setCreditcardNumber(long value) {
        this.creditcardNumber = value;
    }

    /**
     * Gets the value of the creditcardVerification property.
     * 
     */
    public int getCreditcardVerification() {
        return creditcardVerification;
    }

    /**
     * Sets the value of the creditcardVerification property.
     * 
     */
    public void setCreditcardVerification(int value) {
        this.creditcardVerification = value;
    }

    /**
     * Gets the value of the namaBarang property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getNamaBarang() {
        return namaBarang;
    }

    /**
     * Sets the value of the namaBarang property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setNamaBarang(String value) {
        this.namaBarang = value;
    }

    /**
     * Gets the value of the hargaBarang property.
     * 
     */
    public long getHargaBarang() {
        return hargaBarang;
    }

    /**
     * Sets the value of the hargaBarang property.
     * 
     */
    public void setHargaBarang(long value) {
        this.hargaBarang = value;
    }

    /**
     * Gets the value of the foto property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getFoto() {
        return foto;
    }

    /**
     * Sets the value of the foto property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setFoto(String value) {
        this.foto = value;
    }

    /**
     * Gets the value of the idPenjual property.
     * 
     */
    public int getIdPenjual() {
        return idPenjual;
    }

    /**
     * Sets the value of the idPenjual property.
     * 
     */
    public void setIdPenjual(int value) {
        this.idPenjual = value;
    }

    /**
     * Gets the value of the waktuTransaksi property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getWaktuTransaksi() {
        return waktuTransaksi;
    }

    /**
     * Sets the value of the waktuTransaksi property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setWaktuTransaksi(String value) {
        this.waktuTransaksi = value;
    }

}
