/* ========== ========== ========== */
//       Author - Rupesh Maity      //
/* ========== ========== ========== */

/* ========== About ChatApplicationServer.java ==========

A Simple Chat Server which creates a ServerSocket
and waits for clients to connect to the socket.
Once client connects and chats at a time.

========== ========== ========== ========== ========== */

package chatapplicationserver;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Scanner;


public class ChatApplicationServer {

    public static void main(String[] args) {
        try {
            ServerSocket serverSocket = new ServerSocket(2023, 10);
            Scanner serverScanner = new Scanner(System.in);
            
            System.out.println("Chat Server is ready...");
            
            while (true) {
                Socket clientSocket = serverSocket.accept();
                PrintWriter clientWriter = new PrintWriter(clientSocket.getOutputStream(), true);
                // The Second Parameter activates auto-flush
                
                Scanner clientScanner = new Scanner(clientSocket.getInputStream());
                
                clientWriter.println("Hello client! What's on your mind today..?");
                String line = clientScanner.nextLine();
                
                while (!line.equals("null")) {
                    System.out.println("Client - " + line);
                    
                    String output = serverScanner.nextLine();
                    
                    if (output.equals("null")) {
                        break;
                    }
                    
                    clientWriter.println(output);
                    line = clientScanner.nextLine();
                }
                
                clientSocket.close();
            }
        }
        
        catch (IOException ex) {
            System.out.println("Exception occured in server program");
            System.out.println("IOException in ChatApplicationServer.java - " + ex.getMessage());
        }
        
    }

}
