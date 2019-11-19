package Model;

public class User {
    private int id;
    private String email;
    private String userName;
    private String pass;
    private String hashPass;
    private int idgroup; // 1 is user, 2 is admin
    private int active; //0 is not active, 1 is active

    public User() {

    }

    public User(int id, String email, String userName, String pass, String hashPass, int idgroup, int active) {
        this.id = id;
        this.email = email;
        this.userName = userName;
        this.pass = pass;
        this.hashPass = hashPass;
        this.idgroup = idgroup;
        this.active = active;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public int getIdgroup() {
        return idgroup;
    }

    public void setIdgroup(int idgroup) {
        this.idgroup = idgroup;
    }

    public int getActive() {
        return active;
    }

    public void setActive(int active) {
        this.active = active;
    }
}
