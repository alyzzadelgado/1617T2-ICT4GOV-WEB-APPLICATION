/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

/**
 *
 * @author alydoubleza
 */
public class User {
    
    private int user_no;
    private String username;
    private String password;
    private String first_name;
    private String middle_initial;
    private String last_name;
    private String tin_no;
    private String phone_no;
    private int officer_no;
    private User RO;
    private String avail_days;
    private String avail_time;
    private String[] days;
    private String[] time;

    /**
     * @return the user_no
     */
    public int getUser_no() {
        return user_no;
    }

    /**
     * @param user_no the user_no to set
     */
    public void setUser_no(int user_no) {
        this.user_no = user_no;
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
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * @return the first_name
     */
    public String getFirst_name() {
        return first_name;
    }

    /**
     * @param first_name the first_name to set
     */
    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    /**
     * @return the last_name
     */
    public String getLast_name() {
        return last_name;
    }

    /**
     * @param last_name the last_name to set
     */
    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }

    /**
     * @return the tin_no
     */
    public String getTin_no() {
        return tin_no;
    }

    /**
     * @param tin_no the tin_no to set
     */
    public void setTin_no(String tin_no) {
        this.tin_no = tin_no;
    }

    /**
     * @return the phone_no
     */
    public String getPhone_no() {
        return phone_no;
    }

    /**
     * @param phone_no the phone_no to set
     */
    public void setPhone_no(String phone_no) {
        this.phone_no = phone_no;
    }

    /**
     * @return the officer_no
     */
    public int getOfficer_no() {
        return officer_no;
    }

    /**
     * @param officer_no the officer_no to set
     */
    public void setOfficer_no(int officer_no) {
        this.officer_no = officer_no;
    }

    /**
     * @return the RO
     */
    public User getRO() {
        return RO;
    }

    /**
     * @param RO the RO to set
     */
    public void setRO(User RO) {
        this.RO = RO;
    }

    /**
     * @return the avail_days
     */
    public String getAvail_days() {
        return avail_days;
    }

    /**
     * @param avail_days the avail_days to set
     */
    public void setAvail_days(String avail_days) {
        this.avail_days = avail_days;
    }

    /**
     * @return the avail_time
     */
    public String getAvail_time() {
        return avail_time;
    }

    /**
     * @param avail_time the avail_time to set
     */
    public void setAvail_time(String avail_time) {
        this.avail_time = avail_time;
    }

    /**
     * @return the days
     */
    public String[] getDays() {
        return days;
    }

    /**
     * @param days the days to set
     */
    public void setDays(String[] days) {
        
        StringBuilder stringBuilder = new StringBuilder();
        for(String s : days){
           stringBuilder.append(s);
           stringBuilder.append(" ");
        }
           
           String daysList = stringBuilder.toString();
           this.setAvail_days(daysList);
    }

    /**
     * @return the time
     */
    public String[] getTime() {
        return time;
    }

    /**
     * @param time the time to set
     */
    public void setTime(String[] time) {
        StringBuilder stringBuilder = new StringBuilder();
        for(String s : time){
           stringBuilder.append(s);
           stringBuilder.append(" ");
        }
           
           String timeList = stringBuilder.toString();
           this.setAvail_time(timeList);
    }

    /**
     * @return the middle_initial
     */
    public String getMiddle_initial() {
        return middle_initial;
    }

    /**
     * @param middle_initial the middle_initial to set
     */
    public void setMiddle_initial(String middle_initial) {
        this.middle_initial = middle_initial;
    }
    
    
    
}
