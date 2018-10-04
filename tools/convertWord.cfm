<cfapplication name="comtest" clientmanagement="No" Sessionmanagement="yes">
<!--- Uncomment the following line if you need to delete the object from the
Application scope --->
<!--- <cfset structdelete(Application, "MyWordObj")> --->

<!--- use the GetTickCount function to get a current time indicator, used for
      displaying the total processing time. --->
<cfset start = GetTickCount()>
<!--- If necessary, create the Word.application object and put it in the
      Application scope --->
<cfset WordObj_is_initialized = False>
<cflock scope="application" type="readonly" timeout=120>
   <cfset WordObj_is_initialized = StructKeyExists(application, "MyWordObj")>
</cflock>
<cfif not WordObj_is_initialized >
   <cflock scope="Application" type="exclusive" timeout="120">
      <cfif not StructKeyExists(application, "MyWordObj")>

<!--- 1st try to connect to an existing Word object --->
         <cftry>
            <cfobject type="com"
               action="connect"
               class="Word.application"
               name="Application.MyWordobj"
               context="local"> 
            <cfcatch>
<!--- There is no existing object, create one --->
               <cfobject type="com"
                  action="Create"
                  class="Word.application"
                  name="Application.MyWordobj"
                  context="local"> 
            </cfcatch>
         </cftry>
         
         <cfset Application.mywordobj.visible = False>
      </cfif>
   </cflock>
</cfif>
      <cfscript>
      path  = 'G:\\wesites\\petro21\\htdocs\docs\\Africa-Upstream-2006.doc';
      // Instantiate the COM object
      Myword = createObject('COM','Word.Application','Local');

      // turn off window visibility
      MyWord.Visible = false;

      // init var
      OriginalDoc = MyWord.Documents;
  
      // open the file
      OriginalDoc.Open(path);

      // init var
      ConvertedDoc = MyWord.ActiveDocument;
 
      // save it as UTF-8
      ConvertedDoc.SaveAs('#path#.html',Val(8));
 
      // blow away the object instance
      MyWord.Quit();
      </cfscript>

<cfcontent type="text/html" file='#path#.cfm' deleteFile = "No">

