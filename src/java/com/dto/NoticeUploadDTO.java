package com.dto;

import java.io.Serializable;
import java.sql.Date;

public class NoticeUploadDTO implements Serializable{
    private String Tuserid;
    private String Name;
    private String Branch;
    private String Sem;
    private String Content;
    private Date IssueDate;
    private Date ReturnDate;
    private String Designation;

    public String getTuserid() {
        return Tuserid;
    }

    public void setTuserid(String Tuserid) {
        this.Tuserid = Tuserid;
    }

    public String getBranch() {
        return Branch;
    }

    public void setBranch(String Branch) {
        this.Branch = Branch;
    }

    public String getSem() {
        return Sem;
    }

    public void setSem(String Sem) {
        this.Sem = Sem;
    }

    public String getContent() {
        return Content;
    }

    public void setContent(String Content) {
        this.Content = Content;
    }

    public Date getIssueDate() {
        return IssueDate;
    }

    public void setIssueDate(Date IssueDate) {
        this.IssueDate = IssueDate;
    }

    public Date getReturnDate() {
        return ReturnDate;
    }

    public void setReturnDate(Date ReturnDate) {
        this.ReturnDate = ReturnDate;
    }

    
    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }
    
     public String getDesignation() {
        return Designation;
    }

    public void setDesignation(String Designation) {
        this.Designation = Designation;
    }
    
}
