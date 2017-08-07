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
public class Appointment {
    
    private int app_no;
    private int user_no;
    private int user_set;
    private int transaction_no;
    private String date;
    private String time;
    private String status;
    private String reason;

    /**
     * @return the app_no
     */
    public int getApp_no() {
        return app_no;
    }

    /**
     * @param app_no the app_no to set
     */
    public void setApp_no(int app_no) {
        this.app_no = app_no;
    }

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
     * @return the transaction_no
     */
    public int getTransaction_no() {
        return transaction_no;
    }

    /**
     * @param transaction_no the transaction_no to set
     */
    public void setTransaction_no(int transaction_no) {
        this.transaction_no = transaction_no;
    }

    /**
     * @return the date
     */
    public String getDate() {
        return date;
    }

    /**
     * @param date the date to set
     */
    public void setDate(String date) {
        this.date = date;
    }

    /**
     * @return the time
     */
    public String getTime() {
        return time;
    }

    /**
     * @param time the time to set
     */
    public void setTime(String time) {
        this.time = time;
    }

    /**
     * @return the status
     */
    public String getStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * @return the user_set
     */
    public int getUser_set() {
        return user_set;
    }

    /**
     * @param user_set the user_set to set
     */
    public void setUser_set(int user_set) {
        this.user_set = user_set;
    }

    /**
     * @return the reason
     */
    public String getReason() {
        return reason;
    }

    /**
     * @param reason the reason to set
     */
    public void setReason(String reason) {
        this.reason = reason;
    }
    
}
