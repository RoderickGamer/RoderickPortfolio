--
--- Insertar una nueva serie de anime. Por defecto se pone la editorial como 'Panini', el estatus como 'Publishing' y el estatus de lectura como 'Reading'.
INSERT INTO `manga_storage` (`MS_Name`, `MS_Author`, `MS_EditorId`, `MS_StatusId`, `MS_ReadingStatus`)
VALUES ('', '', 1, 1, 1)


--
--- Insertar nuemos volumenes a una serie previamente agregada.
INSERT INTO `ms_detail` (`MSD_MSId`, `MSD_Volume`, `MSD_Year`)
VALUES ( ,  , 'yyyy-mm-dd'),
       ( ,  , 'yyyy-mm-dd'),
       ( ,  , 'yyyy-mm-dd'),
       ( ,  , 'yyyy-mm-dd'),
       ( ,  , 'yyyy-mm-dd');

--
--- Insertar una compra global. 
INSERT INTO `Purchase` (`P_date`, `P_NumMangas`, `P_TotalPrice`, `P_Discount`, `P_FinalPrice`)
VALUES ('',  ,  ,  ,  ),
       ('',  ,  ,  ,  );

--
--- Insertar los detalles de la compra global.
INSERT INTO `P_Detail` (`PD_PId`, `PD_MSId`, `PD_MSDVolume`, `PD_UnitPrice`)
VALUES ( ,  ,  ,  ),
       ( ,  ,  ,  ),
       ( ,  ,  ,  ),
       ( ,  ,  ,  ),
       ( ,  ,  ,  );
