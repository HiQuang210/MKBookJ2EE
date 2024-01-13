package com.Entity;

public class User {
    private int id;
    private String firstname;
    private String lastname;
    private String email;
    private String phone;
    private String password;
    private String address;
    private String city;
    private int zipcode;

    public User() {
        super();
    }
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getFirstname() {
        return firstname;
    }
    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }
    public String getLastname() {
        return lastname;
    }
    public void setLastname(String lastname) {
        this.lastname = lastname;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getPhone() {
        return phone;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }
    public String getCity() {
        return city;
    }
    public void setCity(String city) {
        this.city = city;
    }
    public int getZipcode() {
        return zipcode;
    }
    public void setZipcode(int zipcode) {
        this.zipcode = zipcode;
    }

    public String toString() {
        return "User [id=" + id + " firstname=" + firstname + " lastname=" + lastname + ", email=" 
        + email + ", phone=" + phone + ", password=" + password + ", address=" + address + ", city=" + city + ", zipcode=" + zipcode + "]";
    }
}
