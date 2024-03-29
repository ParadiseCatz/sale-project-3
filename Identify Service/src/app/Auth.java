package app;

import org.json.simple.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.security.SecureRandom;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Created by anthony on 11/11/16.
 */
public class Auth extends HttpServlet {
    //akses database untuk mengecek
    public static Integer authenticate(String username, String password) throws SQLException {
        // Execute SQL query
        Statement stmt = AppDatabase.getConnection().createStatement();
        //System.err.println("sukses");
        String sql;
        sql = "SELECT id " +
                "FROM `login` " +
                "WHERE (username = \"" + username + "\" " + "OR email = \"" + username + "\") " +
                "AND password = \"" + password + "\";";
        ResultSet rs = stmt.executeQuery(sql);
        int jumlah = 0;
        // Extract data from result set
        Integer id = null;
        while (rs.next()) {
            ++jumlah;
            id = rs.getInt("id");
        }
        return jumlah == 1 ? id : null;
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

    public static Integer authenticate(String token, String browser, String ipAddr) throws SQLException {
        // Execute SQL query
        PreparedStatement pstmt = AppDatabase.getConnection().prepareStatement("SELECT id " +
                "FROM `session` " +
                "WHERE token = ? AND expiry > NOW()");
        StringBuilder t = new StringBuilder (token);
        t.append("#").append(browser).append("#").append(ipAddr);
        pstmt.setString(1, t.toString());
        //System.err.println("token = " + token);
        //System.err.println("browser = " + browser);
        //System.err.println("ipAddr = " + ipAddr);
        //System.err.println("t = " + t.toString());
        ResultSet rs = pstmt.executeQuery();
        int jumlah = 0;
        // Extract data from result set
        Integer id = null;
        while (rs.next()) {
            ++jumlah;
            id = rs.getInt("id");
        }
        if (jumlah == 1) {
            Timestamp expiry = buatExpireTime();
            PreparedStatement pstmt2 = AppDatabase.getConnection().
                    prepareStatement("UPDATE `session` SET expiry = ? WHERE token = ?");
            pstmt2.setTimestamp(1, expiry);
            StringBuilder t2 = new StringBuilder (token);
            t2.append("#").append(browser).append("#").append(ipAddr);
            pstmt2.setString(2, t2.toString());
            pstmt2.executeUpdate();
            return id;
        } else {
            return null;
        }
    }

    public static String addSession(Integer id, String browser, String ipAddr) throws SQLException {
        // Execute SQL query
        String token = buatToken();
        String newtoken = appendToken(token, browser, ipAddr);
        Timestamp expiry = buatExpireTime();

        PreparedStatement pstmt = AppDatabase.getConnection().
                prepareStatement("INSERT INTO `session` (`id`, `token`, `expiry`) VALUES (?, ? , ?)");
        pstmt.setInt(1, id);
        pstmt.setString(2, newtoken);
        //System.err.println("newtoken = " + newtoken);
        pstmt.setTimestamp(3, expiry);
        pstmt.executeUpdate();
        return newtoken;
    }

    //membuat token
    public static String buatToken() {
        SecureRandom random = new SecureRandom();
        return new BigInteger(130, random).toString(32);
    }
    
        //membuat token
    public static String appendToken(String t, String browser, String ipAddr) {
        StringBuilder token = new StringBuilder (t);
        token.append("#").append(browser).append("#").append(ipAddr);
        return token.toString();
    }

    //membuat expire time dari sekarang
    public static Timestamp buatExpireTime() {
        return new Timestamp(System.currentTimeMillis() + Integer.valueOf(AppConfig.get("expired_time")));
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json;charset=UTF-8");
    }

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String token = request.getParameter("token");
        String browser = request.getParameter("browser");
        String ipAddr = request.getParameter("ipAddr");
        //System.err.println("dopost auth java browser = " + browser);
        //System.err.println("dopost auth java ipaddr = " + ipAddr);
        try {
            Integer id = authenticate(token, browser, ipAddr);
            //System.err.println(id);
            if (id != null) {
                JSONObject obj = new JSONObject();
                obj.put("user_id", id);
                obj.put("session_age", AppConfig.get("expired_time"));
                obj.put("status", "ok");
                response.getWriter().write(obj.toString());
            } else {
                response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Invalid Token!");
            }
        } catch (SQLException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, ex.getSQLState());
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Authenticate User";
    }// </editor-fold>
}
