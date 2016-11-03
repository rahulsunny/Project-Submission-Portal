/* ========== ========== ========== */
//       Author - Vamsi Sangam      //
/* ========== ========== ========== */

/* ========== About GroupChatServer.java ==========



========== ========== ========== ========== */

package chatapplicationserver;

import java.net.ServerSocket;
import java.net.Socket;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;


public class GroupChatServer {

    public static void main(String[] args) throws Exception {
        ServerSocket serverSocket = new ServerSocket(3000, 10);
        
        // Create a new Thread Pool to handle new clients
        ExecutorService executor = Executors.newFixedThreadPool(Runtime.getRuntime().availableProcessors() * 2);
        
        while (true) {
            System.out.println("Ready to accept a client");
            Socket clientSocket = serverSocket.accept();
            AppData.clients++;
            ClientHandler client = new ClientHandler(clientSocket);
            executor.execute(client);
            System.out.println("Client is being handled");
        }
    }

}
