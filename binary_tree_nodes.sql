--You are given a table, BST, containing two columns: N and P, where N represents the value of a node in Binary Tree, and P is the parent of N.

--Write a query to find the node type of Binary Tree ordered by the value of the node. Output one of the following for each node:

--Root: If node is root node.
--Leaf: If node is leaf node.
--Inner: If node is neither root nor leaf node.

--METHOD
--SELECT ALL nodes, N
--Case statement
--If P is null, N has no parent, therefore it is a root node
--If N exists within column P, it means that node is parent to something and therefore an inner node (as its not the root, and it has a child). 
--Else it is a leaf

SELECT N,
CASE
    WHEN P IS NULL THEN "Root"
    WHEN N IN (SELECT P FROM BST) THEN "Inner"
    ELSE "Leaf"
END AS A
FROM BST
ORDER BY N;