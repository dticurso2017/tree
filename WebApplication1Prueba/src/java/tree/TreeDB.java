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
import java.util.List;
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

    public TreeDB() {
        sb = new StringBuilder();
    }

    public static StringBuilder getTreeString() {
        return sb;
    }
    
    //uses a connection to the db to get the data to 
    private void getData() throws SQLException, NamingException {

        Context initialContext = new InitialContext();

        Context environmentContext = (Context) initialContext.lookup("java:comp/env");

        DataSource dataSource = (DataSource) environmentContext.lookup("jdbc/TestDB");

        conn = dataSource.getConnection();
        String query = "SELECT node_f, node_id, node_text FROM stree_mn ORDER BY node_id";
        stmt = conn.createStatement();

        rs = stmt.executeQuery(query);
    }
    
    /*creates the tree from the resultset, and using the class Node to store the data of
    * each node.
    */
    private ArrayList<Node> createTreeNode() throws SQLException {

        SortedMap<String, Node> nodeMap = new TreeMap<String, Node>();

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
        ArrayList<Node> nodeList = (ArrayList<Node>) nodeMap.get("/").getChilds();

        return nodeList;
    }
    
    //appends a list of childs of a node to sb
    private void printList(List<Node> l) {
        if (l == null || l.isEmpty()) {
            return;
        }
        sb.append("[");
        for (Node n : l) {
            printNode(n);
            sb.append("}");
            if (l.indexOf(n) != l.size() - 1) {
                sb.append(",");
            }
        }
        sb.append("]");
    }
    
    //appends a node to sb
    private void printNode(Node n) {
        sb.append("{'text': '").append(n.getNodeText()).append("'");

        if (!n.getChilds().isEmpty()) {
            sb.append(", 'nodes': ");
            printList(n.getChilds());
            sb.append("");
        }

    }

    public void buildTree() {

        try {
            getData();
            printList(createTreeNode());

        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (NamingException ex) {
            Logger.getLogger(TreeDB.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            // Close the result sets and statements,
            // and the connection is returned to the pool
            try {
                if (rs != null) {
                    rs.close();
                    rs = null;
                }
                if (stmt != null) {
                    stmt.close();
                    stmt = null;
                }
                if (conn != null) {
                    conn.close();
                    conn = null;
                }
            } catch (SQLException e) {
            }
        }
    }

}
