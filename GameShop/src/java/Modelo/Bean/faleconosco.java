
package Modelo.Bean;

public class faleconosco extends perfil{
   private int idfaleconosco;
   private String usuario ;
      private String texto ;

    /**
     * @return the idfaleconosco
     */
    public int getIdfaleconosco() {
        return idfaleconosco;
    }

    /**
     * @param idfaleconosco the idfaleconosco to set
     */
    public void setIdfaleconosco(int idfaleconosco) {
        this.idfaleconosco = idfaleconosco;
    }

    /**
     * @return the usuario
     */
    public String getUsuario() {
        return usuario;
    }

    /**
     * @param usuario the usuario to set
     */
    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    /**
     * @return the texto
     */
    public String getTexto() {
        return texto;
    }

    /**
     * @param texto the texto to set
     */
    public void setTexto(String texto) {
        this.texto = texto;
    }
      
      
}
