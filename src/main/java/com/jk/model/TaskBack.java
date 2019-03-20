package com.jk.model;

import java.io.Serializable;

public class TaskBack implements Serializable {
    private static final long serialVersionUID = -3179773292089688732L;
    private Integer id;
    private Integer taskid;
    private Integer supportid;
    private String feedback;
    private String backtime;

    private String deadline;
    private Integer select;

    public Integer getSelect() {
        return select;
    }

    public void setSelect(Integer select) {
        this.select = select;
    }

    public String getDeadline() {
        return deadline;
    }

    public void setDeadline(String deadline) {
        this.deadline = deadline;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getTaskid() {
        return taskid;
    }

    public void setTaskid(Integer taskid) {
        this.taskid = taskid;
    }

    public Integer getSupportid() {
        return supportid;
    }

    public void setSupportid(Integer supportid) {
        this.supportid = supportid;
    }

    public String getFeedback() {
        return feedback;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }

    public String getBacktime() {
        return backtime;
    }

    public void setBacktime(String backtime) {
        this.backtime = backtime;
    }
}
