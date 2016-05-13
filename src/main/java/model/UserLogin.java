package model;

import org.hibernate.validator.constraints.NotEmpty;

public class UserLogin {

    @NotEmpty

    private String email;

    @NotEmpty
    private String password;

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String login) {
        this.email = email;
    }
}
