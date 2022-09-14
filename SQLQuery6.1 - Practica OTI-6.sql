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
