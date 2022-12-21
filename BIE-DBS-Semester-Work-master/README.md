# BIE-DBS-Semester-Work
BIE-DBS DataBase Course in CTU.Worked with SQL Developer
<p><strong>Nasibov Ruslan</strong></p>
<p><strong>Prague,Czech Republic 2020</strong></p>
<p><strong>Student of Czech Technical University In Prague(Faculty Of Information)</strong></p>

# About Project
The information technology company records a list of all its customers (clients) and the orders it has carried out for them. Communication with the customer is only through the contact person related to the client. The client is registered with the ID, the name of the company (natural person), the ID number, the VAT number and the address. A note can be added to each client. The company can execute several contracts (contracts) for each client, but it can also register clients with whom it has not yet executed any contract. The job is identified by an ID. To ensure a quick orientation in the contract list, the contract start and end dates, description and brief title are recorded. For the purposes of filtering, it is possible to assign to the order technologies that were necessary for realization. Furthermore, the financial category is recorded. The system is managed by employees. The technology is provided with an identifier and a short label. The company may offer technologies that have not yet been assigned to any order. Each technology can be assigned to multiple orders. It is possible to register more technologies for orders. Orders may appear on the system to which no technology has been assigned. The financial category indicates the financial amount of the order. The company divides orders into 5 categories: Up to CZK 1 million, up to CZK 2 million, up to CZK 5 million, up to CZK 10 million and over CZK 10 million. The system does not record the exact financial amounts of individual orders. The company contacts the customer via a contact person. Each client has just one contact person to contact him. Two different clients cannot have the same contact person. The person can be contacted via email and phone. The name and surname must be given to the person. It is possible to register more persons with the same name and surname. Employees are responsible for adding a job to the system. Just one employee adds the job to the system. There may be employees in the system who have not yet added a job. You can view the following information about the employee: name, surname, email, phone, and unique personal number to identify in other company systems.

![image](https://user-images.githubusercontent.com/44650808/80869458-c3737080-8ca0-11ea-84c6-44bbaa1c3349.png)
# Queries

![Screenshot (373)](https://user-images.githubusercontent.com/44650808/80869802-b8214480-8ca2-11ea-9975-d1384874edb4.png)
![Screenshot (374)](https://user-images.githubusercontent.com/44650808/80869803-b8214480-8ca2-11ea-935a-d2aaee13f77c.png)
![Screenshot (375)](https://user-images.githubusercontent.com/44650808/80869788-b48dbd80-8ca2-11ea-87ed-c2ec6f34663d.png)
![Screenshot (376)](https://user-images.githubusercontent.com/44650808/80869789-b5265400-8ca2-11ea-816c-c90e2988dec0.png)
![Screenshot (377)](https://user-images.githubusercontent.com/44650808/80869791-b5beea80-8ca2-11ea-95be-97860f248b8c.png)
![Screenshot (378)](https://user-images.githubusercontent.com/44650808/80869792-b5beea80-8ca2-11ea-85a7-c7cc24efc026.png)
![Screenshot (379)](https://user-images.githubusercontent.com/44650808/80869793-b6578100-8ca2-11ea-918c-8c2d618e6ee9.png)
![Screenshot (380)](https://user-images.githubusercontent.com/44650808/80869794-b6578100-8ca2-11ea-900d-0e8dc16b9e31.png)
![Screenshot (381)](https://user-images.githubusercontent.com/44650808/80869795-b6f01780-8ca2-11ea-9dd9-b77599a13fa2.png)
![Screenshot (382)](https://user-images.githubusercontent.com/44650808/80869796-b6f01780-8ca2-11ea-9915-cf26ce1c23c1.png)
![Screenshot (383)](https://user-images.githubusercontent.com/44650808/80869798-b6f01780-8ca2-11ea-8a01-aab84a8b7211.png)
![Screenshot (384)](https://user-images.githubusercontent.com/44650808/80869799-b788ae00-8ca2-11ea-8e8e-f632f2f334b7.png)
![Screenshot (385)](https://user-images.githubusercontent.com/44650808/80869800-b788ae00-8ca2-11ea-80c0-a174197a5322.png)

![Screenshot (374)](https://user-images.githubusercontent.com/44650808/80869803-b8214480-8ca2-11ea-935a-d2aaee13f77c.png)

# Categories covered by queries
<p>A	A - Positive query on at least two joined tables	D1 D2 D3 D5 D7 D9 D10 D12 D14 D16 D17 D20 D21 D22 D23 D24 D25 D27 D28 D29 D30 D31 D32</p>
<p>AR	A (RA) - Positive query on at least two joined tables	D1 D5 D12 D24 D27 D28 D29 D30 D31 D32</p>
<p>B	B - Negative query on at least two joined tables	D19</p>
<p>C	C - Select only those related to...	D9 D26</p>
<p>CR	C (RA) - Select only those related to...	D26</p>
<p>D1	D1 - Select all related to - universal quantification query	D10</p>
<p>D2	D2 - Result check of D1 query	D11</p>
<p>F1	F1 - JOIN ON	D1 D2 D5 D7 D9 D10 D12 D14 D16 D17 D20 D22 D25 D27 D28 D29</p>
<p>F1R	F1 (RA) - JOIN ON	D1 D5 D12 D27 D28 D29</p>
<p>F2	F2 - NATURAL JOIN|JOIN USING	D3 D5 D7 D23 D24 D28 D30 D31 D32</p>
<p>F2R	F2 (RA) - NATURAL JOIN|JOIN USING	D5 D24 D28 D30 D31 D32</p>
<p>F3	F3 - CROSS JOIN	D10</p>
<p>F4	F4 - LEFT|RIGHT OUTER JOIN	D17</p>
<p>F5	F5 - FULL (OUTER) JOIN	D21</p>
<p>G1	G1 - Nested query in WHERE clause	D6 D7 D9 D11 D18 D19 D23</p>
<p>G2	G2 - Nested query in FROM clause	D6 D7 D8 D10 D13 D17 D22 D24 D31 D32</p>
<p>G2R	G2 (RA) - Nested query in FROM clause	D24 D31 D32</p>
<p>G3	G3 - Nested query in SELECT clause	D4</p>
<p>G4	G4 - Relative nested query (EXISTS|NOT EXISTS)	D19</p>
<p>H1	H1 - Set unification - UNION	D12 D27</p>
<p>H2	H2 - Set difference - MINUS or EXCEPT	D2 D10 D22 D23</p>
<p>H3	H3 - Set intersection - INTERSECT	D18</p>
<p>I1	I1 - Aggregate functions (count|sum|min|max|avg)	D4 D6 D7 D8 D9 D13 D16</p>
<p>I2	I2 - Aggregate function over grouped rows - GROUP BY (HAVING)	D6 D7 D8 D9 D13 D16</p>
<p>J	J - Same query in 3 different sql statements	D19</p>
<p>L	L - View	D3</p>
<p>M	M - Query over a view	D9</p>
<p>N	N - INSERT, which insert a set of rows, which are the result of another subquery (an INSERT command which has VALUES clause replaced by a nested query.	D22</p>
<p>O	O - UPDATE with nested SELECT statement	D15 D25</p>
<p>P	P - DELETE with nested SELECT statement</p>
