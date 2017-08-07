/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import java.util.ArrayList;

/**
 *
 * @author alydoubleza
 */
public class Requirements {
    
    private int req_no;
    private int transaction_no;
    private String name;
    private ArrayList<String> reqList;

    /**
     * @return the req_no
     */
    public int getReq_no() {
        return req_no;
    }

    /**
     * @param req_no the req_no to set
     */
    public void setReq_no(int req_no) {
        this.req_no = req_no;
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
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the reqList
     */
    public ArrayList<String> getReqList() {
        return reqList;
    }

    /**
     * @param reqList the reqList to set
     */
    public void setReqList(ArrayList<String> reqList) {
        this.reqList = reqList;
    }
    
    
    
}
