
package com.dto;

import java.io.Serializable;

public class StudentDTO implements Serializable {
    private String name;
    private String UserId;
    private String Branch;
    private String Password;
    private String sem;

    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUserId() {
        return UserId;
    }

    public void setUserId(String UserId) {
        this.UserId = UserId;
    }

    public String getBranch() {
        return Branch;
    }

    public void setBranch(String Branch) {
        this.Branch = Branch;
    }

    public String getPassword() {
        return Password;
    }

  
    public void setPassword(String Password) {
        this.Password = Password;
    }

    public String getSem() {
        return sem;
    }

 
    public void setSem(String sem) {
        this.sem = sem;
    }
    
}
