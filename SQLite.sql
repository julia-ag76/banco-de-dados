DROP VIEW IF EXISTS RelatorioVendasDiarias;

CREATE VIEW RelatorioVendasDiarias AS
SELECT DATE(DataPedido) AS Data, 
       SUM(Quantidade) AS TotalVendido
FROM Pedidos
GROUP BY DATE(DataPedido)
ORDER BY Data DESC;
SELECT * FROM demo;