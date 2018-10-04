<cfswitch expression="#fusebox.fuseAction#">
  
	<cfcase value="new-branch">
    	<cfscript>
         Rid = createObject("component", "Officecfc.randomID");
         randomID = Rid.randomID();
        </cfscript>
		<cfinclude template="qry_branch.cfm">
        <cfinclude template="dsp_form.cfm">
	</cfcase>
    
	<cfcase value="new-branch-save">
		<cfinclude template="dsp_frameModal.cfm">
	</cfcase>

	<cfcase value="modal">
    	<cfset formAction = "form-editable">
		<cfinclude template="dsp_frameModal.cfm">
	</cfcase>
    
	<cfcase value="user-event-registration">
		<cfinclude template="qry_branch.cfm">
        <cfinclude template="dsp_form.cfm">
	</cfcase>
    
	<cfcase value="newUser-registration">
		<cfinclude template="qry_branch.cfm">
        <cfinclude template="dsp_form.cfm">
	</cfcase>
    
<!--- ACTION NEW USER --->

	<cfcase value="list-newUser">
    	<cfset formActionEdit = "form-viewable-newUser">
        <cfset formActionNew = "new-branch-newUser">
		<cfinclude template="qry_branches.cfm">   
        <cfinclude template="dsp_branches.cfm">
	</cfcase>   
    
     <cfcase value="form-viewable-newUser">
     	<cfscript>
         Rid = createObject("component", "Officecfc.randomID");
         randomID = Rid.randomID();
        </cfscript>
		<cfinclude template="qry_branch.cfm">
        <cfinclude template="dsp_Form.cfm">
	</cfcase> 
    
    <cfcase value="new-branch-newUser">
    	<cfscript>
         Rid = createObject("component", "Officecfc.randomID");
         randomID = Rid.randomID();
        </cfscript>
        
		<cfinclude template="qry_branch.cfm">
       <!--- <cfinclude template="dsp_branchFormVariables.cfm">--->
        <cfinclude template="dsp_form.cfm">
	</cfcase>
    
<!--- /END --->

<!--- ACTION TEMPLATE MODAL --->

	<cfcase value="list-modal">
    	<cfset formActionEdit = "form-editable-modal">
        <cfset formActionNew = "new-branch-modal">
		<cfinclude template="qry_branches.cfm">
        <cfinclude template="dsp_branches.cfm">
	</cfcase>    
    
     <cfcase value="form-editable-modal">
     	<cfscript>
         Rid = createObject("component", "Officecfc.randomID");
         randomID = Rid.randomID();
        </cfscript>
		<cfinclude template="qry_branch.cfm">
        <cfinclude template="dsp_branchFormVariables.cfm">
        <cfinclude template="dsp_Form.cfm">
	</cfcase> 
    
    <cfcase value="new-branch-modal">
    	<cfscript>
         Rid = createObject("component", "Officecfc.randomID");
         randomID = Rid.randomID();
        </cfscript>
		<cfinclude template="qry_branch.cfm">
        <cfinclude template="dsp_branchFormVariables.cfm">
        <cfinclude template="dsp_form.cfm">
	</cfcase>
    <!--- /END --->
    
    <!--- ACTION USER EVENT REGISTRATION --->
	<cfcase value="list-booking">
    	<cfset formActionEdit = "form-viewable-booking">
        <cfset formActionNew = "new-branch-booking">
		<cfinclude template="qry_branches.cfm">
        <cfinclude template="dsp_branches.cfm">
	</cfcase>    
    
     <cfcase value="form-viewable-booking">
     	<cfscript>
         Rid = createObject("component", "Officecfc.randomID");
         randomID = Rid.randomID();
        </cfscript>
		<cfinclude template="qry_branch.cfm">
        <cfinclude template="dsp_Form.cfm">
	</cfcase>     
    <!--- /END --->

	<cfcase value="list-editable">
    	<cfset formAction = "form-editable">
		<cfinclude template="qry_branches.cfm">
        <cfinclude template="dsp_branches.cfm">
	</cfcase>    
   
	<cfcase value="list-viewable">
    	<cfset formAction = "form-viewable">
		<cfinclude template="qry_branches.cfm">
        <cfinclude template="dsp_branches.cfm">
	</cfcase>
    
    <cfcase value="list-viewable-newUser">
    	<cfset formAction = "form-viewable">
		<cfinclude template="qry_branches.cfm">
        <cfinclude template="dsp_branches.cfm">
	</cfcase>  

    <cfcase value="form-viewable">
		<cfscript>
         Rid = createObject("component", "Officecfc.randomID");
         randomID = Rid.randomID();
        </cfscript>
		<cfinclude template="qry_branch.cfm">
        <cfinclude template="dsp_form.cfm">
	</cfcase> 
    
     <cfcase value="form-editable">
     	<cfscript>
         Rid = createObject("component", "Officecfc.randomID");
         randomID = Rid.randomID();
        </cfscript>
		<cfinclude template="qry_branch.cfm">
        <cfinclude template="dsp_branche_Form.cfm">
	</cfcase> 
	
	<cfdefaultcase>
		<!---<cfinclude template="dsp_frameModal.cfm">--->	
    </cfdefaultcase>
	
</cfswitch>