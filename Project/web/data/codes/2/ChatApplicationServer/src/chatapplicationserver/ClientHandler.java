/* ========== ========== ========== */
//       Author - Vamsi Sangam      //
/* ========== ========== ========== */

/* ========== About ClientHandler.java ==========

 It is a part of the group chat program where
 threads of ClientHandler are created for each client

 ========== ========== ========== ========== */
package chatapplicationserver;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.Socket;
import java.util.Scanner;

public class ClientHandler implements Runnable {

    Socket clientSocket;
    Scanner connectionScanner;
    PrintWriter connectionWriter;
    int dataCount;
    String user;

    public ClientHandler(Socket clientSocket) throws IOException {
        this.clientSocket = clientSocket;
        this.connectionScanner = new Scanner(clientSocket.getInputStream());
        this.connectionWriter = new PrintWriter(clientSocket.getOutputStream(), true);
        dataCount = AppData.chatData.size();
    }

    @Override
    public void run() {
        try {
            user = connectionScanner.nextLine();
            connectionWriter.println("Welcome to the Group Chat " + user + "!");

            boolean keepAlive = true;

            while (keepAlive) {
                if (clientSocket.getInputStream().available() != 0) {
                    System.out.println("Log - Data Available to be recieved.");
                    AppData.chatData.add(new UserData(user, connectionScanner.nextLine()));
                }
                
                if (dataCount < AppData.chatData.size()) {
                    System.out.println("Log - Data Available to be printed.");
                    
                    while (dataCount != AppData.chatData.size()) {
                        connectionWriter.println(AppData.chatData.get(dataCount).name + " - " + AppData.chatData.get(dataCount).message);
                        ++dataCount;
                    }
                }
            }
        }
        
        catch (IOException ex) {
            System.out.println("IOException in ClientHandler - " + ex.getMessage());
        }
    }

}
