package classes;

import java.util.ArrayList;

public class Project {
    public int id;
    public String project_date, title, guide, description, locked;
    public ArrayList<String> memberNames, memberRollNumbers, keywords;
    public String reportLocation, pptLocation, codeLocation;

    public Project(int id, String project_date, String title, String guide, String description, String locked) {
        this.id = id;
        this.project_date = project_date;
        this.title = title;
        this.guide = guide;
        this.description = description;
        this.locked = locked;
        memberNames = new ArrayList<>();
        memberRollNumbers = new ArrayList<>();
        keywords = new ArrayList<>();
    }
}
