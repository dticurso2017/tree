/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tree;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.SortedMap;
import java.util.TreeMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.sql.DataSource;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

/**
 *
 * @author Arnau
 */
public class TreeDB {

    private Connection conn = null;
    private Statement stmt = null;  // Or PreparedStatement if needed
    private ResultSet rs = null;
    private static StringBuilder sb = null;

    private SortedMap<String, Node> nodeMap;

    public TreeDB() {
        sb = new StringBuilder();

        try {
            Context initialContext = new InitialContext();

            Context environmentContext = (Context) initialContext.lookup("java:comp/env");

            DataSource dataSource = (DataSource) environmentContext.lookup("jdbc/TestDB");

            conn = dataSource.getConnection();

        } catch (NamingException ex) {
            Logger.getLogger(TreeDB.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            ex.printStackTrace();
            try {
                conn.close();
            } catch (SQLException ex1) {
            }
        }

    }

    public static StringBuilder getSb() {
        return sb;
    }

    public ResultSet getData() throws SQLException {
        String query = "SELECT node_f, node_id, node_text FROM stree_mn ORDER BY node_id";
        stmt = conn.createStatement();

        rs = stmt.executeQuery(query);

        return rs;
    }

    public ArrayList<Node> createTreeNode(ResultSet rs) throws SQLException {

        nodeMap = new TreeMap<String, Node>();
        try {
            while (rs.next()) {
                String nodeFather = rs.getString("node_f");

                Node n = new Node(
                        rs.getString("node_id"),
                        rs.getString("node_text"),
                        null
                );
                if (rs.getString("node_f").equals("0")) {
                    nodeMap.put(n.getNodeID(), n);
                } else {
                    nodeMap.get(nodeFather).addChild(n);
                    nodeMap.put(n.getNodeID(), n);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            // Close the result sets and statements,
            // and the connection is returned to the pool
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {;
                }
                rs = null;
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException e) {;
                }
                stmt = null;
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {;
                }
                conn = null;
            }
        }
        ArrayList<Node> nodeList = (ArrayList<Node>) nodeMap.get("/").getChilds();

        return nodeList;
    }

    public void printListjs(List<Node> l) {
        if (l == null || l.isEmpty()) {
            return;
        }
        sb.append("[");
        for (Node n : l) {
            printNodejs(n);
            sb.append("}");
            if (l.indexOf(n) != l.size() - 1) {
                sb.append(",");
            }
        }
        sb.append("]");
    }

    private void printNodejs(Node n) {
        sb.append("{'text': '").append(n.getNodeText()).append("'");

        if (!n.getChilds().isEmpty()) {
            sb.append(", 'nodes': ");
            printListjs(n.getChilds());
            sb.append("");
        }

    }

    /*
    public void printList(List<Node> l) {
        if (l == null || l.size() == 0) {
            return;
        }
        sb.append("<ul>");
        for (Node n : l) {
            printNode(n);
        }
        sb.append("</ul>");
    }

    private void printNode(Node n) {
        sb.append("<li>").append(n.getNodeText()).append("</li>");

        sb.append("<li>");
        printList(n.getChilds());
        sb.append("</li>");
    }
     */
}
