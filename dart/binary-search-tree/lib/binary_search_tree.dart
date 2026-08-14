class Node {
  String data;
  Node? left;
  Node? right;

  Node(this.data);
}
class BinarySearchTree {
  late Node root; // creating variable root
  BinarySearchTree(String data) {
    root = Node(data); //giving the root value
  }
  void insert(String data) {
    var current = root; // to insert initial looking at root
    while (true) {
      if (int.parse(data) <= int.parse(current.data)) {
        //comparing greater/ less with root data so can put on binary tree
        if (current.left == null) {
          // checking left side of root
          current.left = Node(data); // put data in left
          return;
        }
        current = current.left!;//means left is not empty
      }else{
        if (current.right == null){
          current.right = Node(data);
          return;
        }
        current = current.right!;
      }
    }
  }
  List<String> get sortedData{
    final result = <String>[];
     void traverse(Node? node){
      if (node == null){
        return;
      }
      traverse(node.left);//searching nodes in left 
       result.add(node.data);// if empty add 1 
       traverse(node.right);//  search to right
     }
     traverse(root);
     return result;
  }
}
