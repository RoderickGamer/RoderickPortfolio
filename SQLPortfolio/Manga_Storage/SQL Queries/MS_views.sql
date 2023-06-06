---

CREATE VIEW view_count_volumes AS 
SELECT `ms`.`MS_Name` AS `Manga_name`,COUNT(`msd`.`MSD_Volume`) AS `Volumes`
FROM `manga_storage` AS `ms` 
join `ms_detail` AS `msd` on `msd`.`MSD_MSId` = `ms`.`MS_Id`
GROUP BY `Manga_name`
ORDER BY `Manga_name`;

---

CREATE VIEW view_manga_costs AS 
SELECT `ms`.`MS_Name` AS `Manga_Name`,
       count(`msd`.`MSD_Volume`) AS `Volumes`,
       sum(`pd`.`PD_UnitPrice`) AS `Costs` 
FROM `manga_storage` AS `ms`
JOIN `ms_detail` AS `msd` on `msd`.`MSD_MSId` = `ms`.`MS_Id`
JOIN `p_detail` AS `pd` on `pd`.`PD_MSId` = `ms`.`MS_Id` and `pd`.`PD_MSDVolume` = `msd`.`MSD_Volume`
GROUP BY `Manga_Name` 
ORDER BY `Manga_Name` ;

---

CREATE VIEW view_most_expensive_series AS 
SELECT `ms`.`MS_Name` AS `Manga_Name`,
       SUM(`pd`.`PD_UnitPrice`) AS `Costs`
FROM `manga_storage` AS `ms`
JOIN `p_detail` AS `pd` ON `pd`.`PD_MSId` = `ms`.`MS_Id`
GROUP BY `Manga_name`
ORDER BY `Costs` DESC;

---

CREATE VIEW view_top10_most_expensive AS
SELECT `ms`.`MS_Name` AS `Manga_Name`,
	`pd`.`PD_MSDVolume` AS `Volume`,
	`pd`.`PD_UnitPrice` AS `Cost`
FROM `manga_storage` AS `ms`
JOIN `p_detail` AS `pd` ON `pd`.`PD_MSId` = `ms`.`MS_Id`
ORDER BY `Cost` DESC
LIMIT 10;

---

CREATE VIEW view_top5_most_exp_purch AS
SELECT `p`.`P_Date` AS `Date`, `p`.`P_NumMangas` AS `Num_Mangas`, `p`.`P_FinalPrice` AS `Cost`
FROM `purchase` AS `p`
ORDER BY `Cost` DESC
LIMIT 5;

---
