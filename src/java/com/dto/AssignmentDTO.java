
package com.dto;
import java.io.Serializable;
import java.sql.Date;
public class AssignmentDTO {
 private String Tuserid ;
 private String Branch;
 private String Sem;
 private Date IssueDate;
 private Date ReturnDate;
 private String SubjectCode;
 private String SubjectName;
 private int AssignmentNo;
 private String TeacherName;
    private String Path;

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

    public String getSubjectCode() {
        return SubjectCode;
    }

    public void setSubjectCode(String SubjectCode) {
        this.SubjectCode = SubjectCode;
    }

    public int getAssignmentNo() {
        return AssignmentNo;
    }

    public void setAssignmentNo(int AssignmentNo) {
        this.AssignmentNo = AssignmentNo;
    }
  
    public String getTeacherName() {
        return TeacherName;
    }

    public void setTeacherName(String TeacherName) {
        this.TeacherName = TeacherName;
    }

    
    public String getSubjectName() {
        return SubjectName;
    }

    public void setSubjectName(String SubjectName) {
        this.SubjectName = SubjectName;
    }
    
     public String getPath() {
        return Path;
    }

    public void setPath(String Path) {
        this.Path = Path;
    }
}
