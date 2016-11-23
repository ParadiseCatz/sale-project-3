
package market;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for produk complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="produk">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="id" type="{http://www.w3.org/2001/XMLSchema}int"/>
 *         &lt;element name="idPenjual" type="{http://www.w3.org/2001/XMLSchema}int"/>
 *         &lt;element name="username" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="namaBarang" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="harga" type="{http://www.w3.org/2001/XMLSchema}long"/>
 *         &lt;element name="deskripsi" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="namaFoto" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="waktuDitambahkan" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="jumlahLike" type="{http://www.w3.org/2001/XMLSchema}int"/>
 *         &lt;element name="jumlahBeli" type="{http://www.w3.org/2001/XMLSchema}int"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "produk", propOrder = {
    "id",
    "idPenjual",
    "username",
    "namaBarang",
    "harga",
    "deskripsi",
    "namaFoto",
    "waktuDitambahkan",
    "jumlahLike",
    "jumlahBeli"
})
public class Produk {

    protected int id;
    protected int idPenjual;
    @XmlElement(required = true)
    protected String username;
    @XmlElement(required = true)
    protected String namaBarang;
    protected long harga;
    @XmlElement(required = true)
    protected String deskripsi;
    @XmlElement(required = true)
    protected String namaFoto;
    @XmlElement(required = true)
    protected String waktuDitambahkan;
    protected int jumlahLike;
    protected int jumlahBeli;

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
     * Gets the value of the username property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getUsername() {
        return username;
    }

    /**
     * Sets the value of the username property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setUsername(String value) {
        this.username = value;
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
     * Gets the value of the harga property.
     * 
     */
    public long getHarga() {
        return harga;
    }

    /**
     * Sets the value of the harga property.
     * 
     */
    public void setHarga(long value) {
        this.harga = value;
    }

    /**
     * Gets the value of the deskripsi property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDeskripsi() {
        return deskripsi;
    }

    /**
     * Sets the value of the deskripsi property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDeskripsi(String value) {
        this.deskripsi = value;
    }

    /**
     * Gets the value of the namaFoto property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getNamaFoto() {
        return namaFoto;
    }

    /**
     * Sets the value of the namaFoto property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setNamaFoto(String value) {
        this.namaFoto = value;
    }

    /**
     * Gets the value of the waktuDitambahkan property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getWaktuDitambahkan() {
        return waktuDitambahkan;
    }

    /**
     * Sets the value of the waktuDitambahkan property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setWaktuDitambahkan(String value) {
        this.waktuDitambahkan = value;
    }

    /**
     * Gets the value of the jumlahLike property.
     * 
     */
    public int getJumlahLike() {
        return jumlahLike;
    }

    /**
     * Sets the value of the jumlahLike property.
     * 
     */
    public void setJumlahLike(int value) {
        this.jumlahLike = value;
    }

    /**
     * Gets the value of the jumlahBeli property.
     * 
     */
    public int getJumlahBeli() {
        return jumlahBeli;
    }

    /**
     * Sets the value of the jumlahBeli property.
     * 
     */
    public void setJumlahBeli(int value) {
        this.jumlahBeli = value;
    }

}
