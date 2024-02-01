package Modelo.Bean;


public class perfil {
    private int idperfil;
    private String nome;
    private String username;
    private String bilhete;
    private String senha;
    private String tipo;
    private String email;
    private int contacto;

    /**
     * @return the idperfil
     */
    public int getIdperfil() {
        return idperfil;
    }

    /**
     * @param idperfil the idperfil to set
     */
    public void setIdperfil(int idperfil) {
        this.idperfil = idperfil;
    }

    /**
     * @return the nome
     */
    public String getNome() {
        return nome;
    }

    /**
     * @param nome the nome to set
     */
    public void setNome(String nome) {
        this.nome = nome;
    }

    /**
     * @return the username
     */
    public String getUsername() {
        return username;
    }

    /**
     * @param username the username to set
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * @return the bilhete
     */
    public String getBilhete() {
        return bilhete;
    }

    /**
     * @param bilhete the bilhete to set
     */
    public void setBilhete(String bilhete) {
        this.bilhete = bilhete;
    }

    /**
     * @return the senha
     */
    public String getSenha() {
        return senha;
    }

    /**
     * @param senha the senha to set
     */
    public void setSenha(String senha) {
        this.senha = senha;
    }

    /**
     * @return the tipo
     */
    public String getTipo() {
        return tipo;
    }

    /**
     * @param tipo the tipo to set
     */
    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the contacto
     */
    public int getContacto() {
        return contacto;
    }

    /**
     * @param contacto the contacto to set
     */
    public void setContacto(int contacto) {
        this.contacto = contacto;
    }
}
