/* ========== ========== ========== */
//       Author - Vamsi Sangam      //
/* ========== ========== ========== */

/* ========== About GroupChatClientData.java ==========

Has the global application level data which is common
to all of the Group Chat Application

========== ========== ========== ========== ========== */

package chatapplicationserver;

import java.util.ArrayList;

public class AppData {
    public static ArrayList<UserData> chatData = new ArrayList<>();
    public static int clients = 0;
}
