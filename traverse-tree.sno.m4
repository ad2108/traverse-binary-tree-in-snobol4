HEADER(traverse-tree.sno)

COMMENT(Define null)
      null = 'NULL'

COMMENT(Define node type)
      data('node(value,left,right)')

COMMENT(Define nullnode)
      nullnode = node(null,null,null)

COMMENT(Create expression tree)
      subtree = node('log',nullnode,node(5,nullnode,nullnode))
      tree = node('-',node(3,nullnode,subtree),nullnode)

      subtree = node('sin',node(8,nullnode,nullnode),nullnode)
      tree = node('+',subtree,tree)

SUBSECTION(Traverse in Preorder)
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
      output = 'Traverse in Preoder'
      preorder(tree)
      output = ' '
      output = 'Traverse in Inorder'
      inorder(tree)
      output = ' '
      output = 'Traverse in Inorder'
      postorder(tree)
end

EOF

