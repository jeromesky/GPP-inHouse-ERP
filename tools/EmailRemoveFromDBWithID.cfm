<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>www.petro21.com</title>
</head>

<body>
        <cfquery name="RemoveEmail" datasource="petro21">
                            UPDATE   email_news
                            SET 
                            PE= 1,
            PAr= 1,
            PL= 1,
            PAs= 1,
            PA= 1,
            no_email= 1,
            IntME= 1,
            IntWo= 1,
            IntAf= 1,
            IntAs= 1,
            IntGen= 1,
            IntNAm= 1,
            IntLa= 1,
            IntEu= 1,
            IntNAf= 1,
            advertising =1,
            removedByCheck =1 
    WHERE id IN (26960, 25885, 29256, 29534, 29776, 30095, 30359, 29959, 30835, 33121, 1956, 4456, 9019, 8532, 19747, 19018, 31902, 28072, 31086, 31262, 31157, 31798, 32612, 32658, 31663, 11314, 31916, 31727, 31808, 32057, 31858, 31882, 32494, 32114, 32146, 32196, 32485, 33376, 33866, 33779, 33377, 961, 29015, 33873, 27097, 22125, 29289, 31910, 31911, 1649, 11337, 1649, 24529, 33821, 17180, 33818, 446, 1339, 1412, 1651, 1956, 2883, 2974, 2229, 2689, 3045, 2691, 735, 1666, 3533, 3705, 4789, 4811, 4828, 5111, 5231, 5526, 5540, 6058, 5854, 5970, 6051, 5813, 5927, 6319, 6719, 6851, 6389, 6566, 7000, 6521, 7123, 7060, 7215, 7702, 7486, 7980, 8445, 8514, 8684, 8686, 8847, 9019, 9032, 9124, 8992, 9235, 9853, 9965, 9554, 10061, 10139, 10017, 10420, 10430, 10332, 10697, 695, 10887)
       </cfquery>
</body>
</html>