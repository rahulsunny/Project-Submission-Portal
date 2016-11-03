/* ========== ========== ========== */
//       Author - Vamsi Sangam      //
/* ========== ========== ========== */

/* ========== About Project.java ==========



 ========== ========== ========== ========== */
package classes;

import java.util.ArrayList;

public class Project {

    public String project_date;
    public String title;
    public String guide;
    public String description;
    public String report;
    public String ppt;
    public String code_directory;
    public ArrayList<String> memberNames;
    public ArrayList<String> memberRollNumbers;
    public ArrayList<String> keywords;

    public Project(String project_date, String title, String guide, String description, String report, String ppt, String code_directory) {
        this.project_date = project_date;
        this.title = title;
        this.guide = guide;
        this.description = description;
        this.report = report;
        this.ppt = ppt;
        this.code_directory = code_directory;
        memberNames = new ArrayList<>();
        memberRollNumbers = new ArrayList<>();
        keywords = new ArrayList<>();
    }

}
