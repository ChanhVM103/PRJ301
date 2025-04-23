/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

/**
 *
 * @author vomin
 */
public class ExamsDTO {
    private int exam_id;
    private String exam_title;
    private String subject;
    private int category_id;
    private int total_marks;
    private int duration;

    public ExamsDTO(int exam_id, String exam_title, String subject, int category_id, int total_marks, int duration) {
        this.exam_id = exam_id;
        this.exam_title = exam_title;
        this.subject = subject;
        this.category_id = category_id;
        this.total_marks = total_marks;
        this.duration = duration;
    }

    public int getExam_id() {
        return exam_id;
    }

    public void setExam_id(int exam_id) {
        this.exam_id = exam_id;
    }

    public String getExam_title() {
        return exam_title;
    }

    public void setExam_title(String exam_title) {
        this.exam_title = exam_title;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public int getTotal_marks() {
        return total_marks;
    }

    public void setTotal_marks(int total_marks) {
        this.total_marks = total_marks;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }
    
}
