<cfsetting enablecfoutputonly="false" showdebugoutput="false">

<cfparam name="fa" default="home">
<cfparam name="fusebox.fuseAction" default="">
<cfset fusebox.fuseAction = fa>
<cfset mainDSN = "#dsnP21#">

<cfinclude template="fbx_switch.cfm">