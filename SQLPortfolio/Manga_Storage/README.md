# Manga Storage 'Ongoing'

## Acerca de

Personalmente me gusta comprar y leer manga, por lo que como proyecto al terminar el 'SQL - Curso completo de Bases de Datos' decidí crear una base de datos desde cero en la que pudiera llevar un registro detallado de cuándo compré, dónde compré, cuánto costó bruto, qué descuento me hicieron, cuánto costó neto, cuántos volúmenes tengo, etc. Los datos usados son propios de las compras que he hecho

Para la creación de la base de datos se usó:

- MySQL Workbench 8.0.32 para el Diagrama EER, , creación de la base de datos, creación de tablas, índices y llaves foráneas.
- HeidiSQL 12.3.0.6589 para la administración, inserción de datos, creación de backups y vistas.

## Índice
- [Acerca de](#acerca-de)
- [Diagrama EER](#diagrama-eer)
- [Creación de la Base de Datos](#creación-de-la-base-de-datos)
  + [Carpeta SQL Queries](#carpeta-sql-queries)
  + [Carpeta Manga Storage Data](#carpeta-manga-storage-data)

## Diagrama EER

La base de datos consta de 3 secciones las cuales son:

- Compras: Agrupa las dos tablas de registro donde la tabla principal es 'Purchase' en la que se registran únicamente las compras globales, para que luego en la tabla de detalle 'P_Detail' se desglose qué volumenes fueron los que se compraron de cada manga.
- Mangas: Esta agrupa las dos tablas para guardar la informacion de las series una tabla de referencia para consultar el estatus de lectura. En la tabla principal 'Manga_Storage' se registra los datos de cada serie de manga que hay en la colección y en la tabla de detalle 'MS_Detail' se registra cuantos mangas hay de cada serie en particular.
- Editor: Esta sección tiene dos tablas de referencia que guardan los datos sobre los editores de los que compro y el estatus de publicación de cada serie. Ambas son tablas de referencia.

![MS_Scheme](https://github.com/RoderickGamer/SQLPortfolio/assets/126647917/c76bd7d3-47af-42b9-846b-c7f52490b1d3)

## Creación de la Base de Datos

### Carpeta [SQL Queries](https://github.com/RoderickGamer/SQLPortfolio/tree/f6ddc9b6a542a11f18c35aa97cc73f7f82287dcd/Manga_Storage/SQL%20Queries)

En esta carpeta se encuentra lo siguiente:

- README: Una descripcion más detallada sobre lo siguiente.
- MS_database_structure: Query SQL para crear el esqueleto de la base de datos incluyendo tablas, primary keys, foreign keys, keys, etc.
- MS_database_insert: Query SQL para agregar todos los registros a la base de datos. Estos mismos datos los pueden consultar a modo de tabla en la carpeta [Manga_Storage_Data](#manga-storage-data).
- MS_Views: Cinco queries para crear las vistas más comunes para está base de datos.
- MS_common_queries: Queries más comunes para esta base de datos, como solo uso las vistas los queries más usados son inserts.

### Carpeta [Manga Storage Data](https://github.com/RoderickGamer/SQLPortfolio/tree/98c598e68481e19396faa79be3851e79a2845de9/Manga_Storage/Manga_Storage_Data)

Esta carpeta contiene los archivos .sql con los datos de las 7 tablas que conforman 'Manga Storage'. Dentro hay un README con la descripcion del tipo de datos y constraint de cada tabla.

---

Si tienes alguna duda o comentario, en mi [perfíl](https://github.com/RoderickGamer) encontrarás las redes para contactarme.

#### Gracias por ver mi proyecto UwU

#### 🚀¡Que tengas un gran día!🚀
