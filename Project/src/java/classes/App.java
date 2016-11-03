/* ========== ========== ========== */
//       Author - Vamsi Sangam      //
/* ========== ========== ========== */

/* ========== About App.java ==========



 ========== ========== ========== ========== */
package classes;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Month;
import javax.servlet.http.Part;

public class App {

    public static final String DRIVER_CLASS = "oracle.jdbc.driver.OracleDriver";
    public static final String CONNECTION_STRING = "jdbc:oracle:thin:@localhost:1521:XE";
    public static final String CONNECTION_USERNAME = "hr";
    public static final String CONNECTION_PASSWORD = "hr";
    public static final TrieNode TITLE_WORDS_TRIE = new TrieNode(null);
    public static final LocalDate LOCK_DATE = LocalDate.of(2016, Month.MAY, 29);

    static {    // to initialise TITLE_WORDS_TRIE
        try {
            Class.forName(DRIVER_CLASS);
            Connection con = DriverManager.getConnection(CONNECTION_STRING, CONNECTION_USERNAME, CONNECTION_PASSWORD);
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select id, title from projects");

            while (rs.next()) {
                String title = rs.getString("title");
                int key = rs.getInt("id");
                String[] words = title.split("[ ]");

                for (String word : words) {
                    if (word.length() > 0) {
                        TITLE_WORDS_TRIE.addWord(word, key);
                    }
                }
            }

            rs.close();
            st.close();
            con.close();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
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
}
