<cfquery name="qry_templateList" datasource="#mainDSN#"> 
  SELECT
    *
  FROM
    GPP.dbo.ann_templates
</cfquery>