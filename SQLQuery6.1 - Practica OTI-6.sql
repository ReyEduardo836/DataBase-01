-- Practica BD Centro_Educativo
USE Centro_Educativo
GO

/* 1) Mostrar toda la informaci�n sobre los cursos cuya tarifa es menor que 150. */
SELECT * FROM Curso
WHERE Tarifa < 150

/* 2) Todas las filas en las que el nombre del curso es superior o igual alfab�ticamente a RACIONALISMO. */
SELECT * FROM Curso
WHERE Nombre > 'RACIONALISMO'

/* 3) Obtener sin valores repetidos el conjunto de todas las tarifas del los cursos */
SELECT DISTINCT Tarifa FROM Curso

/* 4) Obtener de la tabla personal ordenada por el nombre de los empleados */
SELECT * FROM Personal
ORDER BY Nombre ASC

/* 5) Obtener la identificaci�n del departamento, titulo del empleado y salario para todos
los miembros de la plantilla fijando como campo principal de ordenaci�n el
departamento en secuencia ascendente y como campo secundario de ordenaci�n el
salario en secuencia descendente.*/
SELECT NDepartamento, Cargo, Sueldo
FROM Personal
ORDER BY NDepartamento ASC, Sueldo DESC

/* 6) Obtener el nombre y el nuevo salario de todos los miembros del personal cuyo
nuevo salario sea mayor que 25,000 suponiendo que todos los salarios iniciales se
han reducido en 100 */
SELECT Nombre, Sueldo
FROM Personal
WHERE (Sueldo - 100) > 25000

/* 7) Obtener el nombre del curso y la descripci�n de todos los cursos cuya descripci�n
comience por la palabra ES. */
SELECT Nombre, Descripcion
FROM Curso
WHERE Descripcion LIKE 'Es%'

/* 8) Obtener el numero de curso y tarifa de todos los cursos menor que 50 o mayor que
400 */
SELECT Numero, Tarifa
FROM Curso
WHERE Tarifa < 50 OR Tarifa > 400

/* 9) Listar cualquier curso que tenga una tarifa coincidente con alg�n numero del
conjunto {12, 50,75,90,100,500} */
SELECT * 
FROM Curso
WHERE Tarifa IN (12, 50,75,90,100,500)

/* 10) Obtener toda la informaci�n disponible sobre cualquier curso que no tenga una tarifa
coincidente con alg�n n�mero del conjunto {12, 50,75,90,100,500} */
SELECT * 
FROM Curso
WHERE Tarifa NOT IN (12, 50,75,90,100,500)

/* 11) Obtener toda la informaci�n sobre cualquier curso que tenga una descripci�n que
comience con la cadena �PARA� */
SELECT * 
FROM Curso
WHERE Descripcion LIKE 'Para%'

/* 12) Visualizar los nombre los nombres, numero de ayudantes y numero de departamento
para todos los miembros de la facultad para os que se sabe si tienen o no ayudantes. */
SELECT NombreProfesor, NumAyudantes, NDepartamento
FROM Claustro

/* 13) Visualizar toda la informaci�n sobre los curso de tres cr�ditos ofrecidos por el
departamento de Filosof�a. */
SELECT * 
FROM Curso
WHERE Creditos = 3 AND NDepartamento = 'PHIL'

/* 14) Visualizar toda la informaci�n sobre los cursos que tengan una tarifa entre 100 y
500, ambos inclusive. */
SELECT *
FROM Curso
WHERE Tarifa BETWEEN 100 AND 500

/* 15) Visualizar los salarios de todo el personal y del claustro de la facultad en una �nica
tabla */
SELECT NombreProfesor, Sueldo, NDepartamento, Cargo = 'Claustro'
FROM Claustro
UNION
SELECT Nombre,Sueldo, NDepartamento, Cargo = 'Personal'
FROM Personal
Order by Cargo, NDepartamento desc

/* 16) Visualizar los salarios de todo el personal y del claustro de la facultad en una �nica
tabla sin eliminar valores duplicados en el resultado*/
SELECT NombreProfesor, Sueldo, NDepartamento, Cargo = 'Claustro'
FROM Claustro
UNION ALL
SELECT Nombre,Sueldo, NDepartamento, Cargo = 'Personal'
FROM Personal
Order by Cargo, NDepartamento desc

/* 17) Obtener toda la informaci�n sobre los cursos gratuitos y toda la informaci�n sobre
cualquier curso que ofrezca el departamento de Filosof�a. */
SELECT * 
FROM Curso
WHERE Tarifa = 0 OR NDepartamento = 'PHIL'

/* 18) En tres consultas, visualizar todos los departamentos acad�micos que ofrezcan
cursos de modo que no aparezcan valores duplicados en la salida de datos.

Adem�s,
para cada curso con tarifa menor que 100, visualizar sin filas repetidas el 
departamento acad�mico que ofrece ese curso y el n�mero de cr�ditos concedidos.


Por ultimo, visualizar el n�mero de curso y el nombre de todos los cursos que
tengan una tarifa superior a 100, incluyendo en el resultado una tercera columna
cuyo contenido sea CURSO CARO para cada fila*/
SELECT DISTINCT NDepartamento Departameto
FROM Curso

SELECT Numero 'Numero del curso', Tarifa, Creditos, NDepartamento  
FROM Curso
WHERE Tarifa < 100

SELECT Numero 'Numero del curso', Nombre 'Nombre del curso',Tarifa, Clasificacion = 'Curso Caro'
FROM Curso
WHERE Tarifa > 100

/* 19) En dos consultas, visualizar el numero de curso, nombre y cr�ditos de cualquier
curso que ofrezca el departamento de inform�tica y ciencias de la informaci�n
ordenando el resultado en secuencias descendente por numero de curso,

visualizar
tambi�n la identificaci�n de los departamentos y el nombre del curso ordenado por
c�digo de departamento y dentro de cada departamento por nombre de curso.
*/
SELECT Numero 'Numero de curso', Nombre 'Nombre del curso', Creditos, NDepartamento
FROM Curso
WHERE NDepartamento = 'CIS'
ORDER BY Numero desc

SELECT NDepartamento, Nombre 'Nombre del curso'
FROM Curso
ORDER BY NDepartamento, Nombre

/* 20) Obtener toda la informaci�n sobre los cursos que ofrezca el departamento de
inform�tica y ciencias de la informaci�n con tarifa nula. Asimismo, obtener toda la
informaci�n sobre cualquier curso que tenga una tarifa que se encuentre entre cero y
cien. */
SELECT * 
FROM Curso
WHERE NDepartamento = 'CIS' AND Tarifa = 0
UNION 
SELECT *
FROM Curso
WHERE Tarifa BETWEEN 0 AND 100
ORDER BY Tarifa

/* 21) Obtener toda la informaci�n sobre los cursos de filosof�a que ofrezcan 3 cr�ditos y
que tengan una tarifa que se encuentre entre cero y cien. Asimismo obtener toda la
informaci�n existente sobre cualquier curso ofrecido por los departamentos de
Inform�tica y Ciencias de la Informaci�n o Filosof�a. */
SELECT *
FROM Curso
WHERE (NDepartamento = 'PHIL' AND Creditos = 3 AND Tarifa BETWEEN 0 AND 100) OR NDepartamento = 'CIS' 

/* 22) Obtener toda la informaci�n sobre cualquier curso de Inform�tica y Ciencias de la
Informaci�n o cualquier curso de tarifa nula. Asimismo, obtener toda la informaci�n
existente sobre cualquier curso que tenga tarifa igual a 50, 100, 150 o 200.*/
SElECT *
FROM Curso
WHERE NDepartamento = 'CIS' OR Tarifa IS NULL OR Tarifa IN (50,100,150,200) 

/* 23) Obtener toda la informaci�n existente sobre el nombre de los cursos y la
identificaci�n del departamento de todos los cursos que no sean ofrecidos por el
departamento de Inform�tica y Ciencias de la Informaci�n. Obtener tambi�n el
nombre y la identificaci�n del departamento de todos los cursos, con la excepci�n de
aquellos ofrecidos por los departamentos de Inform�tica y Ciencias de la
Informaci�n y Filosof�a.*/
SELECT Nombre, NDepartamento
FROM Curso
WHERE NDepartamento != 'CIS'

SELECT Nombre, NDepartamento
FROM Curso
WHERE NDepartamento NOT IN ('CIS', 'PHIL')

/* 24) Obtener toda la informaci�n existente sobre los cursos de Teolog�a con tarifa nula o
de cualquier curso (independientemente de su departamento y tarifa) que tenga un
valor de 6 cr�ditos. Obtener tambi�n toda la informaci�n existente sobre los cursos
de Teolog�a con tarifa nula o que valgan 6 cr�ditos.*/
SELECT * 
FROM Curso
WHERE (NDepartamento = 'THEO' AND Tarifa = 0) OR  Creditos = 6

SELECT * 
FROM Curso
WHERE (NDepartamento = 'THEO') AND (Tarifa = 0 OR Creditos = 6)

/* 25) Obtener toda la informaci�n existente sobre los cursos que no pertenecen al
departamento de Inform�tica y Ciencias de la Informaci�n o sobre cualquier curso
(independientemente de su departamento) que tenga tarifa nula y valga tres cr�ditos.
Obtener tambi�n toda la informaci�n disponible sobre todas la filas de la tabla
CURSO, exceptuando los cursos de Inform�tica y Ciencias de la Informaci�n que
tengan tarifa nula.*/
SELECT *
FROM Curso
WHERE (NDepartamento != 'CIS') OR (Tarifa != 0 AND Creditos != 3)

SELECT * 
FROM Curso
EXCEPT
SELECT * 
FROM Curso
WHERE NDepartamento = 'CIS' AND Tarifa = 0

/* 26) Obtener toda la informaci�n existente sobre los cursos que valgan 2, 6 o 9 cr�ditos.
Obtener tambi�n toda la informaci�n de todos los cursos que no pertenecen a los
departamentos de Teolog�a o Inform�tica y Ciencias de la Informaci�n */
SELECT * 
FROM Curso
WHERE Creditos IN (2,6,9)

SELECT * 
FROM Curso
WHERE NDepartamento NOT IN ('THEO', 'CIS')

/* 27) Obtener toda la informaci�n existente sobre los cursos cuya tarifa se encuentre entre
100 y 200, incluyendo ambos valores. Obtener tambi�n toda la informaci�n de todos
los cursos con tarifa menor que 100 o mayor que 200. */
SELECT *
FROM Curso
WHERE Tarifa BETWEEN 100 AND 200

SELECT *
FROM Curso
WHERE Tarifa NOT BETWEEN 100 AND 200

/* 28) Obtener toda la informaci�n existente sobre los cursos cuyo nombre comience con
la letra C, obtener tambi�n toda la informaci�n de todos los cursos de los
departamentos de Inform�tica y Ciencias de la Informaci�n, Teolog�a o Matem�tica
que valgan tres ceditos y con tarifa entre 50 y 300 presentando el resultado ordenado
por curso dentro de cada departamento. */
SELECT * 
FROM Curso
WHERE Nombre LIKE 'C%'

SELECT *
FROM Curso
WHERE NDepartamento IN ('CIS', 'THEO') AND Creditos = 3 AND Tarifa BETWEEN 50 AND 300
ORDER BY NDepartamento, Nombre

/* 29) Obtener la primera letra de todos los nombres de cursos de inform�tica y Ciencias
de la Informaci�n. Obtener tambi�n los caracteres que aparecen en las posiciones
tercera, cuarta, quinta y sexta. Por ultimo mostrar los tutores del n�mero de curso
sin el primer car�cter. */
SELECT LEFT(Nombre, 1) 'LEFT', SUBSTRING(Nombre, 3, 4) 'SUBSTRING' 
FROM Curso
WHERE NDepartamento IN ('CIS')

SELECT SUBSTRING(NombreProfesor, 2, LEN(NombreProfesor)) 'SUBSTRING'
FROM Claustro

/* 30) Obtener la longitud real de cada nombre de curso ofrecido por el departamento de
Teolog�a. */
SELECT LEN(Nombre) 'Longitud del nombre'
FROM Curso
WHERE NDepartamento = 'THEO'
