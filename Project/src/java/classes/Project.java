/* ========== ========== ========== */
//       Author - Vamsi Sangam      //
/* ========== ========== ========== */

/* ========== About Project.java ==========



 ========== ========== ========== ========== */
package classes;

import java.util.ArrayList;

public class Project {
    public int id = -1;
    public String project_date;
    public String title;
    public String guide;
    public String description;
    public String locked;
    public ArrayList<String> memberNames;
    public ArrayList<String> memberRollNumbers;
    public ArrayList<String> keywords;

    public Project(String project_date, String title, String guide, String description, String locked) {
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
