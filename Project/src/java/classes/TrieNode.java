/* ========== ========== ========== */
//       Author - Vamsi Sangam      //
/* ========== ========== ========== */

/* ========== About TrieNode.java ==========



 ========== ========== ========== ========== */
package classes;

import java.util.ArrayList;

public class TrieNode {

    TrieNode[] children;
    TrieNode parent;
    ArrayList<Integer> keys;

    public TrieNode(TrieNode parent) {
        children = new TrieNode[27];
        this.parent = parent;
        keys = new ArrayList<>();
    }
    
    // adds a word with this node as
    // root key is the project_id to
    // which this word belongs to
    public void addWord(String word, int key) {
        TrieNode trav = this;
        word = word.toLowerCase();
        
        for (int i = 0; i < word.length(); ++i) {
            char alpha = word.charAt(i);
            
            if (alpha >= 'a' && alpha <= 'z') {
                if (trav.children[alpha - 'a'] == null) {
                    trav.children[alpha - 'a'] = new TrieNode(trav);
                }
                
                trav = trav.children[alpha - 'a'];
            }
        }
        
        trav.keys.add(key);
    }
    
    // deletes a word's occurence in
    // a certain project's title
    public void deleteWord(String word, int key) {
        TrieNode trav = this;
        word = word.toLowerCase();
        
        for (int i = 0; i < word.length(); ++i) {
            char alpha = word.charAt(i);
            
            trav = trav.children[alpha - 'a'];
        }
        
        trav.keys.remove(key);
        
        while (!hasChildren(trav) && trav.keys.isEmpty() && trav.parent != null) {
            TrieNode temp = trav;
            
            trav = trav.parent;
            
            for (int i = 0; i < trav.children.length; ++i) {
                if (trav.children[i] == temp) {
                    trav.children[i] = null;
                    break;
                }
            }
        }
    }
    
    // returns all the project_id whose
    // project title includes the given word
    public ArrayList<Integer> wordQuery(String word) {
        TrieNode trav = this;
        word = word.toLowerCase();
        
        for (int i = 0; i < word.length(); ++i) {
            char alpha = word.charAt(i);
            
            if (trav.children[alpha - 'a'] == null) {
                return null;
            }
            
            trav = trav.children[alpha - 'a'];
        }
        
        return new ArrayList<>(trav.keys);
    }
    
    // checks if a node has any children
    private boolean hasChildren(TrieNode node) {
        for (int i = 0; i < node.children.length; ++i) {
            if (node.children[i] != null) {
                return true;
            }
        }
        
        return false;
    }
}
