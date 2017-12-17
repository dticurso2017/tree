/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tree;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author NitroPc
 */
public class Node {
    
    private final String nodeID;
    private final String nodeText;
    private final String nodeColor;
    private List<Node> childs = null;    
  
    
    public Node(String nodeID, String nodeText, String nodeColor){
        this.nodeID = nodeID;
        this.nodeText = nodeText;
        this.nodeColor = nodeColor;
        childs = new ArrayList<Node>();
    }

    public String getNodeText() {
        return nodeText;
    }
    public String getNodeColor() {
        return nodeColor;
    }
    public String getNodeID() {
        return nodeID;
    }
    
    public List<Node> getChilds() {
        return childs;
    }   
    
    
    public void addChild(Node c){
        this.childs.add(c);
    }
    
}
