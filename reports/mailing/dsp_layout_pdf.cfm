<cfoutput>
<cfdocument format="pdf" pagetype="A4" marginbottom="0.4" margintop="0.4" marginleft="0.01" marginright="0.01">
          <cfdocumentitem type="header">
          		<cfinclude template="dsp_resultHeader.cfm">
          </cfdocumentitem>
          <cfdocumentsection>
          		<cfinclude template="dsp_result.cfm">
          </cfdocumentsection>
</cfdocument></cfoutput>