<cfquery name="qryAnnouncements" datasource="#mainDSN#"> 
SELECT [announcementID]
      ,[announcementName]
      ,[announcementSubject]
      ,[announcementExpiry]
      ,[announcementType]
  FROM GPP.dbo.[announcements]
</cfquery>