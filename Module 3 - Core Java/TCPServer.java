// Server.java

import java.io.*;
import java.net.*;

public class TCPServer {

    public static void main(String[] args) throws IOException {
        ServerSocket ss = new ServerSocket(1234);
        Socket s = ss.accept();
        BufferedReader in = new BufferedReader(new InputStreamReader(s.getInputStream()));
        PrintWriter out = new PrintWriter(s.getOutputStream(), true);

        out.println("Welcome to the server!");
        System.out.println("Client says: " + in.readLine());
        ss.close();
    }
}
