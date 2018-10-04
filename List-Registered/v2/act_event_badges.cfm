<!--- aow: http://www.petro21.com/my-office/List-Registered/v2/act_event_badges.cfm?sID=767&eID=765&fID=766 --->
<!--- din: http://www.petro21.com/my-office/List-Registered/v2/act_event_badges.cfm?dID=768 --->
<cfset tickBegin = GetTickCount()>
<cfsetting showdebugoutput="yes" requesttimeout="6789">

<cfparam name="url.localDir" default="Macintosh HD:Users:jeromesvikovsky:Desktop:AOW_Photos:">
<cfparam name="url.foto" default="off" type="string">
<cfparam name='url.dID' default="0" type="numeric">
<cfparam name='url.eID' default="0" type="numeric">
<cfparam name='url.fID' default="0" type="numeric">
<cfparam name='url.sID' default="0" type="numeric">
<cfparam name='url.d' default="din">
<cfparam name='url.e' default="event">
<cfparam name='url.f' default="forum">
<cfparam name='url.s' default="sb">
<cfparam name='var.sheetName' default="AOW">
<cfparam name='var.fotos' default=0 type="integer">
<cfparam name='var.sansfotos' default=0 type="integer">
<cfif url.dID EQ 768>
	<cfset var.sheetName = 'Dinner'>
</cfif>

<cfscript>
	// 2 events - var.defs = url.dID+url.eID+url.fID+url.sID;	
	var.de = url.dID+url.eID;
	var.df = url.dID+url.fID;
	var.ds = url.dID+url.sID;
	var.ef = url.eID+url.fID;
	var.es = url.eID+url.sID;
	var.fs = url.fID+url.sID;

	// 3 events - var.defs = url.dID+url.eID+url.fID+url.sID;
	var.efs = url.eID+url.fID+url.sID;
	var.dfs = url.dID+url.fID+url.sID;
	var.des = url.dID+url.eID+url.sID;
	var.def = url.dID+url.eID+url.fID;
	
	// all events count value
	var.tttt = url.dID+url.eID+url.fID+url.sID;
	// events string for db
	var.zzzz = "#url.dID#,#url.sID#,#url.eID#,#url.fID#";
</cfscript>

<cfquery datasource="#gpp#" name="qry_print">
	SELECT DISTINCT 
		user_id as UserID,
		Upper(title) AS title,
		Upper(name) AS name,
		Upper(surname) AS surname,
		Upper(company) AS company,
		Upper(possition) AS jobtitle,
        email AS email,
		lngconference_id AS eventID,
			(SELECT TOP 1 filename 
			FROM dbo.files 
			WHERE (filetable = 'tblIndividual') 
			AND (filepurposeid = 175) 
			AND (filetableid = dbo.view_conference_attendence_list.user_id) 
			ORDER BY fileID DESC
			) AS photo,  
		menuChoice,
	CASE
		WHEN chkspeaker = 1 THEN 'Speaker'
		WHEN chkguest = 1 THEN 'Guest'
		WHEN chkmoderator = 1 THEN 'Moderator'
		WHEN chkexhibitor = 1 THEN 'Exhibitor'
		WHEN chkpress = 1 THEN 'Press'
		WHEN chkdelegate = 1 THEN 'Delegate'
		ELSE 'Error Please Check'
	END as AttendanceType,
    	paid,
        comment
	FROM [view_conference_attendence_list]
	WHERE 
		[lngconference_id] IN (#var.zzzz#) 
		AND (
			chkspeaker = 1
			OR chkguest = 1
			OR chkdelegate = 1
			OR chkmoderator = 1
			OR chkpress = 1
			OR chkexhibitor = 1)
		AND (active = 1)
		AND ((chkcancelled != 1) OR (ChkCancelled IS NULL))
       <!--- AND user_id  NOT IN (
        		252846,63369,14097,63558,5354,4746,10564,11287,2349,28006,20339,23696,26593,28000,15459,63094,28403,17742,10931,364,5336,260245,255022,62046,24953,15339,5235,17832,1235,260332,28217,252851,28060,45573,5878,24000,265051,63127,261793,62378,46704,67231,262167,255076,22590,255945,260535,266109,24115,6312,24485,63287,21857,262160,267998,24254,24928,268447,21509,21725,67910,298890,298858,299045,298991,299238,299249,17830,266276,299126,7450,68985,27138,253262,299248,299070,262099,262077,299330,64012,68808,258269,260626,298968,28283,299122,26649,45904,28039,11323,268665,63359,65080,5389,48757,299020,63418,5496,20995,66512,1977,267607,24419,47203,63276,268700,261656,299247,63138,8279,19089,299203,28254,6885,63261,262018,299187,64608,21969,6977,48188,299319,298924,299155,299257,268217,56859,299156,299118,295326,298854,299237,298904,16770,299260,17736,11203,19010,20688,268508,269049,46761,26786,253896,20515,21120,20674,48567,6049,22841,25843,17011,47609,41621,67043,23787,9228,253231,257306,48853,255524,16907,8373,63049,64815,21045,27389,16787,4585,66404,57551,261607,68953,6010,254747,28588,46152,255850,65337,14218,261302,68958,62092,255944,47402,260241,6889,28059,65154,264217,262328,299111,17400,46784,262196,264581,298879,18759,24832,299017,298935,67995,299186,258618,268866,221073,262113,68660,262152,298927,69026,58714,299069,18863,27309,16776,299015,18799,299093,20694,46422,298884,299157,7617,237458,268545,68305,261966,45291,16973,7879,262141,48305,262203,299036,260470,261069,298641,299184,45329,298941,69142,68252,298847,299293,70532,260624,265867,298859,26042,254107,18848,298811,299023,269042,299129,261889,261486,5366,57222,298937,261442,66111,48507,298860,268624,299276,299068,298782,268995,45594,57477,266048,261728,268335,299027,298883,258436,255691,64771,16918,299244,28708,23651,66358,265630,261975,230274,6993,257049,17255,9192,5376,255783,62328,261519,298773,46654,63820,299310,46716,68248,299161,299227,20155,24279,5330,298905,298875,299088,10554,255260,3331,64289,298973,299091,267089,268391,261452,262220,56726,48754,22313,262408,65838,262042,262084,259166,299287,11789,299348,262204,55435,298964,269287,268694,261654,298984,298710,18286,3366,46085,21076,966,232438,47635,267485,299345,299197,46891,63298,299096,261789,269272,5786,298707,28003,299285,22997,260989,46053,298906,17031,62893,298706,261921,21033,62736,266111,261323,267423,25030,299074,262032,261536,255772,45298,298728,44266,46012,24833,298971,299079,299100,63246,20918,17743,299054,298889,299019,299016,262178,299234,298709,48784,298760,268488,269089,19561,298861,298693,68802,269285,299232,269013,265724,298976,268940,45428,261614,257943,69089,298781,68829,261877,299195,261821,261805,261644,269294,26417,299191,269248,262242,19563,46715,42485,298856,62353,23853,68832,46650,299067,24373,24084,298874,56825,262206,63283,298953,66286,298708,14497,23837,299228,258700,20597,5101,68962,299229,269082,69055,255537,299190,268976,63262,45724,299094,268291,299242,261635,57044,68986,298639,47545,261830,269012,299143,299046,10630,66258,63136,46731,262029,262030,1146,299073,28351,299283,269014,16463,68814,62701,23720,18747,24612,27457,67619,5165,62935,5313,8670,48751,299050,267939,17958,299095,17950,16734,258473,44045,62098,258691,18909,269043,74755,298915,5104,28121,262255,268464,298958,13991,63174,16593,261851,74756,298796,68983,262286,64649,261768,15752,64951,422,262079,265284,262066,261929,299176,262128,18673,265326,21903,261121,17359,48687,268920,269024,268863,299212,13003,299211,298869,268910,299114,298826,269297,298947,24186,68893,20475,21539,267562,268699,299233,265692,10905,298888,264834,299007,261745,46246,65121,268947,254784,21051,261360,299065,17339,266178,298780,264504,261634,45368,63678,262048,268432,298823,298822,20606,261645,268583,46933,9513,19818,16032,67140,299188,298816,268987,5349,25520,298878,68885,258692,261990,268446,24522,63235,25016,299063,299086,299270,299098,298772,22390,269027,5212,298834,8996,268405,18952,299084,299261,298909,262421,298881,45947,299034,62876,62914,268652,24285,18749,262250,47053,299011,298897,298797,268375,298821,14993,62900,299318,254929,63297,298911,266107,299284,299159,260639,262162,262248,299331,22152,64861,261974,21774,298798,299236,13798,261274,298848,24764,298908,299296,17792,262121,267881,266670,268370,261346,262091,299312,5353,262291,8939,299321,261978,17769,299033,269280,268257,298844,267891,299241,261817,264527,20427,299104,269008,68836,262365,67141,262651,299085,298778,69224,299061,299057,45386,26269,21611,264418,299311,69069,255128,13539,298994,46195,298993,68807,299294,299071,299113,298779,253342,24281,28293,261891,63239,298900,269269,299192,62351,269040,268590,299142,74787,69283,299281,253239,298837,25863,8123,299112,299196,62592,298944,261615,7517,262290,299014,68727,298992,62743,266249,27307,262413,299021,298800,298907,62382,13809,262402,257249,14492,299290,46057,68,258236,299115,59218,299144,298954,15816,265515,299092,14221,299048,62336,299010,299204,268636,19985,299077,261476,261975,299183,267423,268910,299159,15236,261978,298994,264217,298892,22313,11789,298707,298706,298760,298893,14497,255267,261745,299270,268405,268527,299078,299242,17958,254126,255144,261093,24747,299131,299266,25837,299306,299218,68763,299372,299265,65063,63366,298932,66521,299341,298951,298741,262288,264905,253897,266732,299368,16826,65533,299385,56971,299394,299381,28199,275928,298928,299205,299193,24805,299263,6987,28391,298843,63613,299262,18984,5906,299201,20097,46858,261638,2980,299366,18985,299344,299135,47153,299326,299198,22745,299399,10413,18928,57075,262009,46986,5710,46714,269296,21356,299117,261367,46384,267144,268780,46745,46702,64754,299154,7588,22430,298638,298713,299221,299222,46683,299375,299337,298975,266488,68790,262314,299080,63647,299081,5260,299025,5281,262289,299251,298952,299250,298870,1321,249871,262008,63526,24424,16916,56828,22052,269023,269025,6613,298813,299347,269065,299374,16976,299288,299389,56899,298767,68151,299239,5852,3393,48527,299301,18786,299136,265946,33295,298766,261180,299361,299120,66469,254898,47191,298712,68733,299044,48766,67771,299363,298703,299335,43971,299350,20527,261936,254238,299138,298835,262026,17853,56818,20503,5472,265743,269009,23113,268934,269010,62561,298802,64664,11816,23976,59068,298901,299382,299325,262277,298918,262281,299334,268680,64833,299367,268702,299353,299390,253924,299207,299373,25156,299208,28251,299357,261529,299414,267938,67899,299401,298989,299392,299386,298824,266639,19258,268990,68040,299316,257050,298642,46168,64826,299391,261439,298640,69215,298979,21471,299406,65969,299158,299380,63264,63259,262257,299419,299009,262385,299403,299412,68128,299404,299407,298980,255521,298948,299418,261319,10679,2550,269029,299428,5867,68989,48106,299307,299416,22236,299398,299219,262176,298871,299062,25314,46707,262240,299018,299417,299413,250369,299364,299362,17766,46340,299289,299246,67381,56699,46735,260865,68259,299409,299410,16922,299422,298853,298825,299103,299383,299351,24230,8566,299217,268981,299402,24190,63278
        )--->
	GROUP BY 
		title,
		name,
		surname,
		company,
		possition,
        email,
		lngconference_id,
		user_id,
		menuChoice,
		chkspeaker,
		chkguest,
		chkmoderator,
		chkexhibitor,
		chkpress,
		chkdelegate,
        paid, 
        comment
	ORDER BY 
		company,
		surname,
		name,
		lngconference_id
</cfquery>

<cfif url.dID EQ 768>

	<!--- dinner only --->
    <cfquery dbtype="query" name="qry_print1">
        SELECT
            userID, title, name, surname, company, jobtitle, photo, menuChoice, AttendanceType, paid, comment, email
        FROM 
            qry_print
     GROUP BY 
            company,
            surname,
            name,
            title,
            photo,
            jobtitle,
            userid,
            AttendanceType,
            menuChoice,
            paid, 
            comment,
            email
    </cfquery>
    
    <!--- Create new spreadsheet --->
	<cfset sObj=SpreadsheetNew()>
    <!--- style 1st row new spreadsheet --->
    <cfset SpreadsheetAddRow(sObj, "USERID,TITLE,NAME,SURNAME,COMPANY,JOBTITLE,IMG,MENU,ATTENDANCE_TYPE,PAID,COMMENT,EMAIL")>
    <cfset SpreadsheetFormatRow(sObj, {bold=TRUE, alignment="center"}, 1)>
    <!--- Add Qry to new spreadsheet --->
    <cfset SpreadsheetAddRows(sObj, qry_print1)>
    <cfset SpreadSheetSetColumnWidth(sObj,7,16)> 
    <!---
    <cfloop query="qry_print1">
        <cfif len(qry_print1.photo) EQ 0>
            <cfset SpreadSheetSetRowHeight(sObj,qry_print1.currentRow+1,30)>
        <cfelse>
            <cfset objImage = ImageRead("G:\websites\petro21\htdocs\_files\client\#photo#")>
            <cfset therow = qry_print1.currentRow+1>
            <cfset SpreadSheetSetRowHeight(sObj,therow,117)>
            <cfset SpreadsheetAddImage(sObj, objImage,'jpg','#therow#,7,#therow#,8')>
        </cfif>
    </cfloop> --->
    
     <cfquery dbtype="query" name="qry_print2">
            SELECT
                count(photo) as countz
            FROM 
                qry_print
            WHERE 
                photo is not null
        </cfquery>
    
    <cfspreadsheet action="write" filename="badge_report_#var.sheetName#.xls" name="sObj" sheetname="#var.sheetName#" overwrite=true format="html" />
    
    <cfoutput>#qry_print2.countz#/#qry_print1.recordcount# (#numberFormat((qry_print2.countz/qry_print1.recordcount)*100,'99.9')#%)
    <br><a href="badge_report_#var.sheetName#.xls">download badge_report_#var.sheetName#</a></cfoutput>

<cfelse>

    <cfquery dbtype="query" name="qry_print1">
        SELECT
            ' ' as Mugshot, userID, title, name, surname, company, jobtitle,  
            '' as Mon, '' as Tues, '' as Wed, photo, '' as badge, '' AS paid, '' AS menuChoice, '' AS comment
        FROM 
            qry_print
     GROUP BY 
            company,
            surname,
            name,
            title,
            photo,
            jobtitle,
            userid,
            menuChoice
    </cfquery>

	<cfscript>
		//Create new spreadsheet
		sObj=SpreadsheetNew();
		//add 1st row & style in new spreadsheet
		SpreadsheetAddRow(sObj, "PHOTO,USERID,TITLE,NAME,SURNAME,COMPANY,JOBTITLE,MONDAY,TUESDAY,WEDNESDAY,@picture,BADGE,PAYMENT,MENU,COMMENTS");
		SpreadsheetFormatRow(sObj, {bold=TRUE, alignment="center"}, 1);
		//Add Qry 2 new spreadsheet + make column wide enough for image
		SpreadsheetAddRows(sObj, qry_print1);
		SpreadSheetSetColumnWidth(sObj,1,16);
	</cfscript>
    
    <cfloop query="qry_print1">
    
    	<cfset therow = qry_print1.currentRow+1>
        
        <cfquery dbtype="query" name="qry_print2" maxrows="3">
            SELECT
                eventID, AttendanceType, paid, comment, menuChoice
            FROM 
                qry_print
            WHERE 
                userID = #qry_print1.userID#
            ORDER BY
                eventID;
        </cfquery>

        <cfscript>
            var.badgecolorCode = 99000;
            var.eventIDlist = ValueList(qry_print2.eventID);
            var.attendanceType = ValueList(qry_print2.AttendanceType);
            var.attendancePaid = ValueList(qry_print2.paid);
            var.attendanceComment = ValueList(qry_print2.comment);
			if (len(qry_print1.photo) GT  10) { 
				var.filelocationlocal = '#url.localDir##qry_print1.photo#';
			} else {
				var.filelocationlocal = '';
				};
        </cfscript> 

        <cfif url.foto EQ 'on'>
        	<cftry>
			<cfif FileExists("G:\websites\petro21\htdocs\_files\client\#photo#")>
             <!---   <cfset objImage = ImageRead("G:\websites\petro21\htdocs\_files\client\#photo#")>
                <cfset SpreadSheetSetRowHeight(sObj,therow,117)>
                <cfset SpreadsheetAddImage(sObj, objImage,'jpg','#therow#,1,#therow#,2')>--->
                <cfset var.fotos = var.fotos +1>
             <cfelse>
            	<cfscript>
					var.sansfotos = var.sansfotos +1;
                	SpreadsheetSetCellValue(sObj,'Foto needed',therow,1);
            	</cfscript>
            </cfif>
                <cfcatch type="any">Image error: <cfoutput>#photo# of #userID#: #name#, #surname#</cfoutput><hr></cfcatch>
            </cftry>
        </cfif> 

        <cfif ListContains(var.eventIDlist,767)>
			<cfscript>
				var.badgeColorCode = var.badgecolorCode + 100;
                wordvalue = ListContains(var.eventIDlist,767);
                wordvalue = ListGetAt(var.AttendanceType, wordvalue);
                SpreadsheetSetCellValue(sObj,wordvalue,therow,8);
            </cfscript>
        </cfif>
  
        <cfif ListContains(var.eventIDlist,766)>
			<cfscript>
				var.badgeColorCode = var.badgecolorCode + 10;
                wordvalue = ListContains(var.eventIDlist,766);
                wordvalue = ListGetAt(var.AttendanceType, wordvalue);
                SpreadsheetSetCellValue(sObj,wordvalue,therow,9);
            </cfscript>
        </cfif>  
  
        <cfif ListContains(var.eventIDlist,765)>
            <cfscript>
				var.badgeColorCode = var.badgecolorCode + 1;
                wordvalue = ListContains(var.eventIDlist,765);
                wordvalue = ListGetAt(var.AttendanceType, wordvalue);
                SpreadsheetSetCellValue(sObj,wordvalue,therow,10);
            </cfscript>
        </cfif>
        
        <!---<cfif SpreadsheetGetCellValue(sObj, therow, 14) NEQ 'Yes' OR SpreadsheetGetCellValue(sObj, therow, 14) EQ ''>
            <cfscript>
				format1 = structnew();
				format1.font="serif"; 
				format1.fontsize="12"; 
				format1.fgcolor="orange"; 
				format1.bold="true"; 
				format1.alignment="center"; 
				SpreadsheetFormatCell(sObj, format1, therow, 14);
				SpreadsheetFormatCell(sObj, format1, therow, 1);
            </cfscript>
        </cfif> --->

		<cfscript>
            SpreadsheetSetCellValue(sObj,var.badgecolorCode,therow,12);
            SpreadsheetSetCellValue(sObj,var.attendancePaid,therow,13);
            SpreadsheetSetCellValue(sObj,var.attendanceComment,therow,15);
			SpreadsheetSetCellValue(sObj,var.filelocationlocal,therow,11);
        </cfscript>

    </cfloop>

    <cfscript>
		SpreadSheetAddFreezePane(sObj,5,1);
    </cfscript>
    <cfif url.foto NEQ 'on'>
		<cfset SpreadsheetDeleteColumn(sObj, 1)>
    </cfif>

    <cfspreadsheet action="write" filename="badge_report_#var.sheetName#.xls" name="sObj" sheetname="#var.sheetName#" overwrite=true format="html" />

<cfoutput>#qry_print1.recordcount# <a href="badge_report_#var.sheetName#.xls">download badge_report_#var.sheetName#.xls</a>.<br>
Photo Count: #var.sansfotos# still to get with #var.fotos# done (#numberFormat((var.fotos/qry_print1.recordcount)*100,'99.9')#%)</cfoutput>

</cfif>

<hr>
<cfset tickEnd = GetTickCount()>
<cfset loopTime = tickEnd - tickBegin>
<cfoutput>time: #loopTime# milliseconds</cfoutput>