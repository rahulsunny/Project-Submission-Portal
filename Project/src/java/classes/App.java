/* ========== ========== ========== */
//       Author - Vamsi Sangam      //
/* ========== ========== ========== */

/* ========== About App.java ==========

 Contains all the global config variables and
 methods which are frequently used as basic operations

 ========== ========== ========== ========== */
package classes;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.Month;
import java.util.ArrayList;
import java.util.HashMap;
import javax.servlet.http.Part;

public class App {

    public static final String DRIVER_CLASS = "oracle.jdbc.driver.OracleDriver";
    public static final String CONNECTION_STRING = "jdbc:oracle:thin:@localhost:1521:XE";
    public static final String CONNECTION_USERNAME = "hr";
    public static final String CONNECTION_PASSWORD = "hr";
    public static final HashMap<String, ArrayList<Integer>> PROJECT_TITLE_DICT = new HashMap<>(1000);
    public static final HashMap<Integer, ArrayList<Integer>> PROJECT_GUIDE_DICT = new HashMap<>(1000);
    public static final HashMap<Integer, ArrayList<Integer>> PROJECT_KEYWORDS_DICT = new HashMap<>(1000);
    public static final LocalDate LOCK_DATE = LocalDate.of(2016, Month.MAY, 29);
    public static final int ROLL_NUM_MIN_LENGTH = 10;
    public static final int ROLL_NUM_MAX_LENGTH = 10;

    static {    // to initialise PROJECT_TITLE_DICT
        try {
            Class.forName(DRIVER_CLASS);
            Connection con = DriverManager.getConnection(CONNECTION_STRING, CONNECTION_USERNAME, CONNECTION_PASSWORD);
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select id, title, guide_id from projects");

            while (rs.next()) {
                String title = rs.getString("title");
                int id = rs.getInt("id");
                int guideId = rs.getInt("guide_id");
                String[] words = title.split("[ ]");

                for (String word : words) {
                    if (word.length() > 0) {
                        word = word.toLowerCase();

                        if (PROJECT_TITLE_DICT.containsKey(word)) {
                            PROJECT_TITLE_DICT.get(word).add(id);
                        } else {
                            ArrayList<Integer> arr = new ArrayList<>();

                            arr.add(id);
                            PROJECT_TITLE_DICT.put(word, arr);
                        }
                    }
                }

                if (PROJECT_GUIDE_DICT.containsKey(guideId)) {
                    PROJECT_GUIDE_DICT.get(guideId).add(id);
                } else {
                    ArrayList<Integer> arr = new ArrayList<>();

                    arr.add(id);
                    PROJECT_GUIDE_DICT.put(guideId, arr);
                }
            }

            rs.close();
            st.close();

            st = con.createStatement();
            rs = st.executeQuery("select * from project_keywords");

            while (rs.next()) {
                int projectId = rs.getInt("project_id");
                int keywordId = rs.getInt("keyword_id");

                // mapping from keyword to project
                if (PROJECT_KEYWORDS_DICT.containsKey(keywordId)) {
                    PROJECT_KEYWORDS_DICT.get(keywordId).add(projectId);
                } else {
                    ArrayList<Integer> arr = new ArrayList<>();

                    arr.add(projectId);
                    PROJECT_KEYWORDS_DICT.put(keywordId, arr);
                }
            }

            rs.close();
            st.close();
            con.close();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            ex.printStackTrace();
        }
    }

    public static boolean uploadFile(String path, Part filePart, String fileName) throws IOException {
        OutputStream out = null;
        InputStream filecontent = null;

        try {
            out = new FileOutputStream(new File(path + File.separator + fileName));
            filecontent = filePart.getInputStream();

            int read = 0;
            final byte[] bytes = new byte[1024];

            while ((read = filecontent.read(bytes)) != -1) {
                out.write(bytes, 0, read);
            }
        } catch (Exception fne) {
            // log errros
            return false;
        } finally {
            if (out != null) {
                out.close();
            }

            if (filecontent != null) {
                filecontent.close();
            }
        }

        return true;
    }

    public static String getFileName(final Part part) {
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        
        return null;
    }
}
