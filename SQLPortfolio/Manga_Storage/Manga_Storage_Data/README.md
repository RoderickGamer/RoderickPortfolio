# Manga Storage Data

A continuación se detalla tabla por tabla, el tipo de archivo, constraint, llaves y comentarios sobre cada tabla de la base de datos.

Además, al entrar a cada archivo podras ver los datos usados para la creación. 

Al ser una base de datos de mi registro personal, periódicamente iré actualizando la información de este repositorio.

## Editor

Tabla de referencia.

Esta tabla proporciona informacion relevante sobre aquellos editores que imprimen el manga.

| #    | Name           | Type    | Lenght | Unsigned | Allow Null | Default       | Comment                              |
|------|----------------|---------|--------|----------|------------|---------------|--------------------------------------|
| 1 PK | Editor_Id      | Tinyint | 3      | x        |            | Autoincrement |                                      |
| 2    | Editor_Name    | Varchar | 60     |          |            | No Default    | Nombre de la editorial               |
| 3    | Editor_Country | Char    | 2      |          |            | No Default    | Código de país formato ISO           |
| 4    | Editor_WebSite | Varchar | 255    |          | x          | Null          | Url de la página para comprar mangas |

## Manga_storage

Guarda los datos de cada serie de manga. Tiene FK con la tabla editor, status y reading status.

| #     | Name             | Type        | Lenght | Unsigned | Allow Null | Default       | Comment                                      |
|-------|------------------|-------------|--------|----------|------------|---------------|----------------------------------------------|
| 1 PK  | MS_Id            | Smallint    | 35     | x        |            | Autoincrement | Id unico para cada nombre de manga diferente |
| 2     | MS_Name          | Varchar     | 60     |          |            | No Default    | Nombre del Manga en cuestión                 |
| 3     | MS_Author        | CharVarchar | 45     |          |            | No Default    | Autor del manga                              |
| 4 Key | MS_EditorId      | Tinyint     | 3      | x        | x          | No Default    | Casa editorial del manga                     |
| 5 Key | MS_StatusId      | Tinyint     | 3      | x        |            | No Default    | Publishing = 1 Finished = 2 Canceled = 3     |
| 6 Key | MS_ReadingStatus | Tinyint     | 3      | x        |            | No Default    | Reading = 1 Finished = 2 Dropped = 3         |

## MS_detail

Esta tabla guarda los detalles de cada serie de manga, como cuantos volumenes tengo de cada una. Tiene FK con manga_storage.

| #     | Name       | Type     | Lenght | Unsigned | Allow Null | Default       | Comment                      |
|-------|------------|----------|--------|----------|------------|---------------|------------------------------|
| 1 PK  | MSD_Id     | Smallint | 5      | x        |            | Autoincrement |                              |
| 2 Key | MSD_MSId   | Smallint | 5      | x        |            | No Default    | PK de la tabla Manga_Storage |
| 3 Key | MSD_Volume | Tinyint  | 3      | x        |            | No Default    | Numero de volumen            |
| 4     | MSD_Year   | Date     |        |          |            | No Default    | Fecha de publicación         |

## P_detail

Detalle de cada compra registrada en purchase. Aquí se incluye el volumen especifico de cada manga que se haya comprado. Tiene FK con las tablas purchase, manga_storage y ms_detail.

| #     | Name         | Type     | Lenght | Unsigned | Allow Null | Default       | Comment                         |
|-------|--------------|----------|--------|----------|------------|---------------|---------------------------------|
| 1 PK  | PD_Id        | Smallint | 5      | x        |            | Autoincrement |                                 |
| 2 Key | PD_PId       | Smallint | 5      | x        |            | No Default    | PK de la tabla Purchase         |
| 3 Key | PD_MSId      | Smallint | 5      | x        |            | No Default    | PK de la tabla Manga_Storage    |
| 4 Key | PD_MSDVolume | Tinyint  | 3      | x        |            | No Default    | PK de la tabla MS_Detail        |
| 5     | PD_UnitPrice | Decimal  | 10,2   |          | x          | Null          | Precio original de cada volumen |

## Purchase

Registro de cada compra, noa a detalle, únicamente el concepto y el costo global de cada compra.

| #    | Name         | Type     | Lenght | Unsigned | Allow Null | Default       | Comment                     |
|------|--------------|----------|--------|----------|------------|---------------|-----------------------------|
| 1 PK | P_Id         | Smallint | 5      | x        |            | Autoincrement |                             |
| 2    | P_Date       | Date     | 5      |          |            | No Default    | Fecha de compra             |
| 3    | P_NumMangas  | Smallint | 5      | x        |            | No Default    | Cuántos Mangas se compraron |
| 4    | P_TotalPrice | Decimal  | 10,2   |          |            | No Default    | Precio total                |
| 5    | P_Discount   | Decimal  | 3,2    |          | x          | Null          | Descuento, puede ser 0      |
| 6    | P_FinalPrice | Decimal  | 10,2   |          |            | No Default    | Precio con descuento        |

## Reading_status

Tabla de referencia.

Esta tabla almacena informacion relevante sobre mi estatus de lectura de cada serie de manga.

| #    | Name           | Type    | Lenght | Unsigned | Allow Null | Default       | Comment                              |
|------|----------------|---------|--------|----------|------------|---------------|--------------------------------------|
| 1 PK | RS_Id          | Tinyint | 3      | x        |            | Autoincrement |                                      |
| 2    | RS_Description | Varchar | 10     |          | x          | Null          | Reading = 1 Finished = 2 Dropped = 3 |

## Status

Tabla de referencia.

Esta tabla almacena informacion relevante sobre el estatus publicación de cada serie de manga.

| #    | Name               | Type    | Lenght | Unsigned | Allow Null | Default       | Comment                                  |
|------|--------------------|---------|--------|----------|------------|---------------|------------------------------------------|
| 1 PK | Status_Id          | Tinyint | 3      | x        |            | Autoincrement |                                          |
| 2    | Status_Description | Varchar | 15     |          |            | No Default    | Publishing = 1 Finished = 2 Canceled = 3 |
