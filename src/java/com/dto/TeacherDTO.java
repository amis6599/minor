
package com.dto;

import java.io.Serializable;

public class TeacherDTO implements Serializable{
    private String UserId;
    private String Name;
    private String Password;
    private  String Branch;
    private String Designation;

    public String getUserId() {
        return UserId;
    }

    public void setUserId(String UserId) {
        this.UserId = UserId;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

 
    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    /**
     * @return the Branch
     */
    public String getBranch() {
        return Branch;
    }

    /**
     * @param Branch the Branch to set
     */
    public void setBranch(String Branch) {
        this.Branch = Branch;
    }

    /**
     * @return the Designation
     */
    public String getDesignation() {
        return Designation;
    }

    /**
     * @param Designation the Designation to set
     */
    public void setDesignation(String Designation) {
        this.Designation = Designation;
    }
}
