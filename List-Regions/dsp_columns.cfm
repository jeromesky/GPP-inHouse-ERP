<style type="text/css">
#TableEdit { font-family:Arial, Helvetica, sans-serif; color:#000000; font-size:12px;}
.words {text-transform: capitalize}
td { border-bottom:1px solid #E8E8E8}
th { text-align:left }
.TDdelegate { width:250px}
#header{background-color:#CCCCCC}
</style>

<cfoutput>
<div>
<span >Count: #get.recordcount#</span><cfif parameterexists(form.count)></cfif>
</div>
  <table width="100%" border="0" id="TableEdit"  cellpadding="4" cellspacing="1"  style="font-family:Arial, Helvetica, sans-serif; color:##000000; font-size:12px; text-align:left;">
<!---    <tr>
    	<td colspan="#fieldcount#" id="header">#get.eventName# <cfif parameterexists(form.count)><span >Count: #get.recordcount#</span></cfif><!--- (#fieldcount#)---></td>
    
    </tr>--->
    
    <tr>
<!---      <th align="left"><cfoutput>#get.eventName# <cfif parameterexists(form.count)> <span style="float:right">Count: #get.recordcount#</span></cfif></cfoutput></th>--->

	   <cfif form.format EQ "pdf">
      <th>Name</th>        

      
      <th>Possition</th> 
      <cfelse>
      	<th>id</th>
        <th>title</th>
       <th>Name</th>
        <th>Surname</th> 
        <th>Possition</th> 
        <th>Company</th> 
      </cfif>
    
   
    
    
    
      
     
        <th>address</th>

        <th>city</th>

        <th>country</th>

        
    <th>zip</th>

    </tr>
    
    
      
<cfloop query="get">
    <tr>
      
      <cfif form.format EQ "pdf">
      <td><strong>#Ucase(get.company)#</strong><br><span class="words">#Ucase(get.name)#</span> <span class="words">#Ucase(get.surname)#</span></td>         

      
      <td><span class="words">#ucase(ReplaceNoCase(get.possition, '&AMP;', '&'))# </span> </td> 
      <cfelse>
      <td>#get.userid#</td>
      <td><span class="words">#Ucase(get.Title)#</span> </td>
      <td><span class="words">#Ucase(get.name)#</span> </td>
      <td><span class="words">#Ucase(get.surname)#</span></td>
      <td><span class="words">#ucase(ReplaceNoCase(get.possition, '&AMP;', '&'))# </span> </td>    
      <td <!---colspan="#(fieldcount - 2)#"---> >#Ucase(get.company)#</td>
      </cfif>
   
    

        <td>#get.address# &nbsp;</td>
	
        <td>#get.city#&nbsp;</td>


        <td>#get.country#&nbsp;</td>
        <td>#get.zip#&nbsp;</td>

        

    </tr>
    </cfloop>
  </table>
  
  </cfoutput>