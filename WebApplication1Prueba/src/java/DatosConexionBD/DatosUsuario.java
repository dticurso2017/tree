/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DatosConexionBD;

import java.io.Serializable;
import java.util.Objects;

/**
 *
 * @author User
 */
public class DatosUsuario implements Serializable {

    private String user = null;
    private String password = null;
    private String email = null;
    private String ErrorRegistro = "Algo";
    private String ErrorLogin = "Algo";

    public DatosUsuario() {
        super();
    }

    public DatosUsuario(String user, String password, String email, String ErrorRegistro, String ErrorLogin) {
        super();
        this.user = user;
        this.password = password;
        this.email = email;
        this.ErrorRegistro = ErrorRegistro;
        this.ErrorLogin = ErrorLogin;
    }

    public String getUser() {
        return user;
    }

    public String getPassword() {
        return password;
    }

    public String getEmail() {
        return email;
    }

    public String getErrorRegistro() {
        return ErrorRegistro;
    }

    public String getErrorLogin() {
        return ErrorLogin;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setErrorRegistro(String ErrorRegistro) {
        this.ErrorRegistro = ErrorRegistro;
    }

    public void setErrorLogin(String ErrorLogin) {
        this.ErrorLogin = ErrorLogin;
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 97 * hash + Objects.hashCode(this.user);
        hash = 97 * hash + Objects.hashCode(this.password);
        hash = 97 * hash + Objects.hashCode(this.email);
        hash = 97 * hash + Objects.hashCode(this.ErrorRegistro);
        hash = 97 * hash + Objects.hashCode(this.ErrorLogin);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final DatosUsuario other = (DatosUsuario) obj;
        if (!Objects.equals(this.user, other.user)) {
            return false;
        }
        if (!Objects.equals(this.password, other.password)) {
            return false;
        }
        if (!Objects.equals(this.email, other.email)) {
            return false;
        }
        if (!Objects.equals(this.ErrorRegistro, other.ErrorRegistro)) {
            return false;
        }
        if (!Objects.equals(this.ErrorLogin, other.ErrorLogin)) {
            return false;
        }
        return true;
    }
}
