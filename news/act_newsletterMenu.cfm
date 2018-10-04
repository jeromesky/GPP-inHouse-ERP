    
    <cfparam name="form.newsletterid" default="#url.id#">
    <cfinclude template="dsp_dropDown.cfm">

    <CFFILE ACTION="WRITE" FILE="G:\websites\my-office\news\newsletterMenu.cfm" OUTPUT="#BuildNewsletterDrop#" NAMECONFLICT="overwrite">