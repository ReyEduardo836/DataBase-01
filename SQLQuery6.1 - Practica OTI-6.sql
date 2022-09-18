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

/* 31) Obtener el nombre y el cargo de cualquier miembro del personal que no est�
asignado aun departamento existente */
SELECT Nombre, Cargo
FROM Personal 
WHERE NDepartamento IS NULL

/* 32) Obtener el nombre y el cargo de cualquier miembro del personal asignado a un
departamento existente. */
SELECT Nombre, Cargo
FROM Personal
WHERE NDepartamento IS NOT NULL

/* 33) Obtener para cada departamento que ofrezca cursos, el identificador de ese
departamento seguido del n�mero, nombre y tarifa del departamento que organiza el
curso con mayor tarifa. */
SELECT Numero, Nombre, Tarifa, NDepartamento
FROM Curso
WHERE Tarifa IN (SELECT MAX(Tarifa) FROM Curso GROUP BY NDepartamento)
ORDER BY Tarifa DESC, NDepartamento DESC

/* 34) Obtener el numero de curso, nombre y tarifa de cada curso cuya tarifa sea menor
que todos los salarios de todos los miembros del personal */
SELECT Numero, Nombre, Tarifa
FROM Curso
WHERE Tarifa < (SELECT SUM(Sueldo) FROM Personal)

/* 35) Obtener el n�mero de curso, nombre y tarifa de cada curso cuya tarifa exceda del
salario del cualquier miembro del personal. */
SELECT Numero, Nombre, Tarifa
FROM Curso
WHERE Tarifa > ANY(SELECT Sueldo
					FROM Personal)

/* 36) Obtener para cada departamento que ofrezca cursos, el identificador de
departamento y la tarifa media de los cursos ofrecidos por el departamento, siempre
y cuando sea mayor que la tarifa media de todas las tarifas de cursos*/
SELECT NDepartamento, AVG(Tarifa)
FROM Curso
GROUP BY NDepartamento
HAVING AVG(Tarifa) > (SELECT AVG(Tarifa)
						FROM Curso)

/* 37) Obtener el numero, cargo e identificador de cada departamento de cada miembro del
personal asignado a un departamento no existente (sin identificador) */
SELECT Id, Nombre, Cargo, NDepartamento
FROM Personal
WHERE NDepartamento NOT IN (SELECT Nombre FROM Departamento) OR NDepartamento IS NULL

/* 38) Obtener el n�mero y nombre de cualquier miembro de la facultad que sea jefe de
cualquier departamento que ofrezca un curso de seis cr�ditos. */
SELECT NumeroProfesor, NombreProfesor
FROM Claustro c INNER JOIN Departamento d ON c.NumeroProfesor = d.Director
INNER JOIN Curso cur ON c.NDepartamento = cur.NDepartamento
WHERE cur.Creditos = 6

/* 39) Obtener el nombre y cargo de cada miembro del personal que trabaja en el edificio
de Humanidades. */
SELECT p.Nombre, p.Cargo
FROM Personal p INNER JOIN Departamento d ON p.NDepartamento = d.Nombre AND d.Edificio = 'HU'

/* 40) Obtener el n�mero, nombre y tarifa de los cursos con tarifa mayor o igual que el
sueldo de cualquier miembro del personal.*/
SELECT Numero, Nombre, Tarifa
FROM Curso
WHERE Tarifa >= ANY (SElECT Sueldo FROM Personal)

/* 41) Obtener el n�mero, nombre y tarifa de los cursos con tarifa menor que la media.*/
SELECT Numero, Nombre, Tarifa
FROM Curso
WHERE Tarifa < (SELECT AVG(Tarifa) FROM Curso)

/* 42) Obtener el n�mero, nombre y tarifa de los cursos con tarifa m�nima no nula.*/
SELECT Numero, Nombre, Tarifa
FROM Curso
WHERE Tarifa = 0

/* 43) Obtener el nombre de la base de datos actual */
SELECT DB_Name()

/* 44) Obtener la fecha actual del sistema */
PRINT GETDATE()

/*45) Lista de los meses en que se efectuaron las matriculas */
SELECT MONTH(Fecha_Matricula)
FROM Matricula

/* 46) Hora de la matriculaci�n de los alumnos, primeramente con horas y minutos y
despu�s con horas, minutos y segundos. */
SELECT DATEPART(Hour, Hora_Matricula)
FROM Matricula

/* 47) Presentar las ciudades donde se encuentras las oficinas con su nombre inicial, en
may�sculas, en min�sculas y el numero de caracteres. */
SELECT Domicilio,LOWER(Domicilio) 'MINUSCULA', UPPER(Domicilio) 'MAYUSCULA', LEN(Domicilio) 'N.Caracteres'
FROM Estudiante

/* 48)Buscar aquellos n�meros de curso que est�n en la tabla MATRICULA y en la tabla
CLASE (operaci�n intersecci�n) */
SELECT NumCurso
FROM Matricula
UNION
SELECT NumCurso
FROM Clase
INTERSECT
SELECT Numero
FROM Curso

/* 49) Presentar los n�meros de curso que est�n en la tabla CLASE y no est�n en la tabla
MATRICULA (operaci�n diferencia).*/
SELECT NumCurso
FROM Clase
EXCEPT
SELECT NumCurso
FROM Matricula

/* 50) Listar aquellos n�meros de curso que est�n en la tabla MATRICULA o en la tabla
CLASE (operaci�n uni�n) */
SELECT NumCurso
FROM Matricula
UNION
SELECT NumCurso
FROM Clase

/* 51) Visualizar el nombre e identificador de departamento de cualquier catedr�tico que
tenga un numero de profesores ayudantes mayor que la media de cr�ditos para
cursos ofrecidos por su departamento. */

SELECT NombreProfesor, NDepartamento
FROM Claustro cl
WHERE NumAyudantes > (SELECT AVG(Creditos) 
							FROM Curso cu
							GROUP BY NDepartamento
							HAVING cl.NDepartamento = cu.NDepartamento)

/* 52) Visualizar el nombre, identificador de cada departamento y salario de aquellos
miembros de la facultad cuyo salario es mayor que el salario medio de su
departamento. */
SELECT * 
FROM Claustro cl1
WHERE Sueldo > (SELECT AVG(Sueldo)
				FROM Claustro cl2
				GROUP BY NDepartamento
				HAVING cl1.NDepartamento = cl2.NDepartamento)

/* 53) Visualizar el numero de estudiantes y la fecha de MATRICULA de todos los
estudiantes que est�n matriculados de al menos un curso ofrecido por un
departamento ubicado en el edificio Ciencias SC. */
SELECT Numero, Fecha_Matricula
FROM Estudiante e INNER JOIN Departamento d ON e.NDepartamento = d.Nombre AND d.Edificio = 'SC'
INNER JOIN Matricula m ON e.Numero = m.NumEstudiante

/*54) Visualizar el nombre y n�mero de ayudantes para aquellos miembros de la facultad
que tienen tantos ayudantes como el n�mero de cr�ditos ofrecidos por cualquier
curso. */
SELECT NombreProfesor, NumAyudantes
FROM Claustro
WHERE NumAyudantes = SOME (SELECT Creditos
							FROM Curso)

/* 55) Visualizar el nombre y el identificador de departamento de cualquier miembro del
claustro asignado a un departamento que ofrezca un curso de 6 cr�ditos */
SELECT NombreProfesor, NDepartamento
FROM Claustro cl
WHERE EXISTS(SELECT *
			FROM Curso cu
			WHERE cl.NDepartamento = cu.NDepartamento AND Creditos = 6)

/* 56) Visualizar el nombre y el identificador de departamento de cualquier miembro del
claustro asignado a un departamento que no ofrezca un curso de 6 cr�ditos.*/
SELECT NombreProfesor, NDepartamento
FROM Claustro cl
WHERE NOT EXISTS(SELECT *
			FROM Curso cu
			WHERE cl.NDepartamento = cu.NDepartamento AND Creditos = 6)

/* 57) Visualizar el nombre y el departamento de cualquier miembro de la facultad que no
est� impartiendo clases durante este semestre */
SELECT NombreProfesor, NDepartamento
FROM Claustro cl
WHERE NOT EXISTS(SELECT * 
				FROM Clase c
				WHERE cl.NumeroProfesor = c.NumProfesor)

/* 58) Visualizar el n�mero de curso y nombre en donde se halle registrado el estudiante
800.*/ 
SELECT NumCurso, Nombre
FROM Estudiante e INNER JOIN Matricula m ON e.Numero = m.NumEstudiante AND e.Numero = 800

/* 59) Visualizar toda la informaci�n acerca de cualquier curso de Inform�tica y Ciencias
de la Informaci�n con una tarifa menor que el sueldo medio de cualquiera asignado
al departamento de Teolog�a */
SELECT * 
FROM Curso
WHERE NDepartamento = 'CIS'
AND Tarifa < (SELECT AVG(Tarifa)
				FROM Curso
				GROUP BY NDepartamento
				HAVING NDepartamento = 'THEO')

/* 60) Visualizar el nombre y el salario de cualquier empleado miembro del personal cuyo
sueldo sea menor o igual que la m�xima tarifa del curso. */
SELECT Nombre, Sueldo
FROM Personal
WHERE Sueldo <= (SELECT MAX(Tarifa)
				FROM Curso)

/* 61) Visualizar el nombre, n�mero, departamento y tarifa de los cursos que tienen la
segunda tarifa mas cara sabiendo que la tarifa mas cara es 500. */
SELECT TOP 1 WITH TIES *
FROM Curso
WHERE Tarifa < 500
ORDER BY Tarifa DESC