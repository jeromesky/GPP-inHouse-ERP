<cfquery datasource="GPP" name="get">
SELECT     userID, areaID, areaDate, deliveryFormat, areaActive
FROM         user2area
WHERE     (areaDate >= '2012-12-15') AND (deliveryFormat = 2)
</cfquery>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Untitled Document</title>
</head>

<body>


<cfloop query="get">

<cfquery datasource="GPP">
    IF NOT EXISTS (SELECT user2areaID FROM user2area WHERE (userID = #get.userID#) AND (areaID = #get.areaID#) AND (deliveryFormat = 1) ) BEGIN
     INSERT INTO user2area 
     (userID, areaID, areaDate,  deliveryFormat, areaActive) 
     VALUES
     (#get.userID#, #get.areaID#, getDate(), 1, 1) 
    END
</cfquery>


</cfloop>
</body>
</html>
