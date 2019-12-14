package Model;

public class User {
    private int id;
    private String email;
    private String userName;
    private String fullName;
    private String gender;
    private String pass;
    private String address;
    private String phone;
    private String avt;
    private String hashPass;
    private int idgroup; // 1 is user, 2 is admin
    private int active; //0 is not active, 1 is active

    public User() {

    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public User(int id, String email, String userName, String fullName, String gender, String pass, String address, String phone, String avt, String hashPass, int idgroup, int active) {
        this.id = id;
        this.email = email;
        this.userName = userName;
        this.fullName = fullName;
        this.gender = gender;
        this.pass = pass;
        this.address = address;
        this.phone = phone;
        this.avt = avt;
        this.hashPass = hashPass;
        this.idgroup = idgroup;
        this.active = active;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAvt() {
        return avt;
    }

    public void setAvt(String avt) {
        this.avt = avt;
    }

    public String getHashPass() {
        return hashPass;
    }

    public void setHashPass(String hashPass) {
        this.hashPass = hashPass;
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

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", email='" + email + '\'' +
                ", userName='" + userName + '\'' +
                ", pass='" + pass + '\'' +
                ", address='" + address + '\'' +
                ", phone='" + phone + '\'' +
                ", avt='" + avt + '\'' +
                ", hashPass='" + hashPass + '\'' +
                ", idgroup=" + idgroup +
                ", active=" + active +
                '}';
    }
}
