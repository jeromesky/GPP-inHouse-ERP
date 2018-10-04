<cfquery name="qry_template" datasource="#mainDSN#"> 
  SELECT
    *
  FROM
    ann_templates
  WHERE
    templateID = 0
</cfquery>