HEADER(traverse-tree.sno)
**=pea
**=sect Project Traverse Tree
**=subsect Project Information
**B<Project:>  https://github.com/ad2108/traverse-binary-tree-in-snobol4
**=break
**B<Author:>   ad2108
**=break
**B<Date:>     04.07.2026
**=break
**B<Version:>  1.0.0
**=break
**B<License:>  MIT
**=sect Documentation
**=cut

COMMENT(Define null)
**=pea
**=subsect Null Constant
**=code
**    null = 'NULL'
**=ecode
**null is used as a simple pattern, that can be matched against.
**=cut

      null = 'NULL'

COMMENT(Define node type)
**=pea
**=subsect Node Datatype
**=code
**    data('node(value,left,right)')
**=ecode
**This datatype is used for all the nodes in a binary tree. It contains the value and to references to 2 further nodes.
**=cut

      data('node(value,left,right)')

COMMENT(Define nullnode)
**=pea
**=subsect Nullnode
**=code
**    nullnode = node(null,null,null)
**=ecode
**Null Node is used for finishing/missing nodes in the tree. All elements of the null node contain the constant null.
**=cut

      nullnode = node(null,null,null)

COMMENT(Create expression tree)
**=pea
**=subsect Expression Tree as an Example
**In this code example the expression C<sin(8) + 3 - log(5)> is used. To get a working result all empty and follow up nodes need to be nullnodes!
**=break
**=item 5 -> node(5,nullnode,nullnode)
**=item 2+3 -> node('+',node(2,nullnode,nullnode),node(3,nullnode,nullnode))
**=cut

      subtree = node('log',nullnode,node(5,nullnode,nullnode))
      tree = node('-',node(3,nullnode,subtree),nullnode)

      subtree = node('sin',node(8,nullnode,nullnode),nullnode)
      tree = node('+',subtree,tree)

SUBSECTION(Traverse in Preorder)
**=pea
**=subsect Function Preorder
**The preoder function is a recursive function that traverses a given binary tree in preoder.
**This means that the order of traversion is:
**=nitem Root
**=nitem Left/-subtree
**=nitem Right/-subtree
**=cut

      `define'('preorder(btree)val,l,r', 'pre')             :(endpre)
pre
COMMENT(Deal with root value)
      val = value(btree)                                  :f(freturn)
      output = val

COMMENT(Deal with left subtree)
      l = left(btree)
      value(l) null                                       :s(skiplpre)
      preorder(l)
skiplpre

COMMENT(Deal with right subtree)
      r = right(btree)
      value(r) null                                       :s(skiprpre)
      preorder(r) 
skiprpre
COMMENT(Return from function)
                                                          :(return)
endpre

SUBSECTION(Traverse in Inorder)
**=pea
**=subsect Function Inorder
**The inorder function is a recursive function that traverses a given binary tree in inorder.
**This means that the order of traversion is:
**=nitem Left/-subtree
**=nitem Root
**=nitem Right/-subtree
**=cut

      `define'('inorder(btree)val,l,r', 'ins')              :(endin)
ins
COMMENT(Deal with left subtree)
      l = left(btree)
      value(l) null                                       :s(skiplin)
      inorder(l)
skiplin

COMMENT(Deal with root value)
      val = value(btree)                                  :f(freturn)
      output = val

COMMENT(Deal with right subtree)
      r = right(btree)
      value(r) null                                       :s(skiprin)
      inorder(r) 
skiprin
                                                          :(return)
endin

SUBSECTION(Traverse in Postorder)
**=pea
**=subsect Function Postorder 
**The postorder function is a recursive function that traverses a given binary tree in postorder.
**This means that the order of traversion is:
**=nitem Left/-subtree
**=nitem Right/-subtree
**=nitem Root
**=cut

      `define'('postorder(btree)val,l,r', 'post')           :(endpost)
post
COMMENT(Deal with left subtree)
      l = left(btree)
      value(l) null                                       :s(skiplpost)
      postorder(l)
skiplpost

COMMENT(Deal with left subtree)
      r = right(btree)
      value(r) null                                       :s(skiprpost)
      postorder(r) 
skiprpost

COMMENT(Deal with root value)
      val = value(btree)                                  :f(freturn)
      output = val
                                                          :(return)
endpost

MAINSECTION(Execute Traversion Functions)
**=pea
**=subsect Main Section
**The main section runs all 3 traversion strategies on the expression tree defined earlier.
**=cut

      output = 'Traverse in Preoder'
      preorder(tree)
      output = ' '
      output = 'Traverse in Inorder'
      inorder(tree)
      output = ' '
      output = 'Traverse in Postorder'
      postorder(tree)
end

**=pea
**=sect Output
**Traverse in Preoder
**=break
**+
**=break
**sin
**=break
**8
**=break
**-
**=break
**3
**=break
**log
**=break
**5
**=break
**=break
**Traverse in Inorder
**=break
**8
**=break
**sin
**=break
**+
**=break
**3
**=break
**log
**=break
**5
**=break
**-
**=break
**=break
**Traverse in Postorder
**=break
**8
**=break
**sin
**=break
**5
**=break
**log
**=break
**3
**=break
**-
**=break
**+
**=cut

**=pea
**=sect End of Documentation
**=cut

EOF

