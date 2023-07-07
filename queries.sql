--Recuperações simples com SELECT Statement:
SELECT * FROM client;
SELECT Pname, category FROM product;
SELECT idorder, orderStatus, sendValue FROM orders;

--Filtros com WHERE Statement:

SELECT * FROM client WHERE CPF = '12345678900';
SELECT Pname, category FROM product WHERE classification_kids = true;
SELECT idorder, orderStatus, sendValue FROM orders WHERE orderStatus = 'Confirmado';


--Crie expressões para gerar atributos derivados:

SELECT Fname, Lname, CONCAT(Fname, ' ', Lname) AS FullName FROM client;
SELECT Pname, avaliacao, avaliacao * 10 AS AvaliacaoPorcentagem FROM product;
SELECT idorder, sendValue, sendValue * 1.1 AS SendValueWithTax FROM orders;


--Defina ordenações dos dados com ORDER BY:

SELECT * FROM client ORDER BY Lname ASC;
SELECT Pname, avaliacao FROM product ORDER BY avaliacao DESC;
SELECT idorder, orderStatus, sendValue FROM orders ORDER BY sendValue ASC;

--Condições de filtros aos grupos - HAVING Statement:

SELECT category, COUNT(*) FROM product GROUP BY category HAVING COUNT(*) > 10;
SELECT orderStatus, AVG(sendValue) FROM orders GROUP BY orderStatus HAVING AVG(sendValue) > 50;

--Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados:

SELECT client.Fname, client.Lname, orders.orderStatus
FROM client
JOIN orders ON client.idclient = orders.idOrderClient;

SELECT product.Pname, product.category, productSeller.prodQuantity
FROM product
JOIN productSeller ON product.idProduct = productSeller.idProduct;

SELECT client.Fname, client.Lname, orders.orderStatus, product.Pname
FROM client
JOIN orders ON client.idclient = orders.idOrderClient
JOIN product ON orders.idorder = productorder.idPOorder;
