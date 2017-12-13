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
    private String Error = "";

    public DatosUsuario() {
        super();
    }

    public DatosUsuario(String user, String password, String email, String Error) {
        super();
        this.user = user;
        this.password = password;
        this.email = email;
        this.Error = Error;
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

    public String getError() {
        return Error;
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

    public void setError(String Error) {
        this.Error = Error;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 97 * hash + Objects.hashCode(this.user);
        hash = 97 * hash + Objects.hashCode(this.password);
        hash = 97 * hash + Objects.hashCode(this.email);
        hash = 97 * hash + Objects.hashCode(this.Error);
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
        if (!Objects.equals(this.Error, other.Error)) {
            return false;
        }
        return true;
    }
}
