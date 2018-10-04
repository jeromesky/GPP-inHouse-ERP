<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>P21</title>
</head>

<body>
<form action="index.cfm" method="post">

<input type="hidden" id="company_companyID" name="companyID" value="#form.companyID#">
<div class="ui-corner-top ui-widget ui-widget-content podForm">
            <fieldset >
                <legend id="legend_company">ssss</legend>
                    <b>Active</b>
                    <i class="NoFormat">
                        <input type="checkbox" name="active" id="company_active" value="1" >
                    </i>
                    <b> Name</b>
                    <i class="NoFormat" >
                        <input type="text" name="companyName" id="company_companyName" value="" class="ui-corner-all"/> 
                        
                    </i>
                    <b>Industry Type</b>
                    <i class="NoFormat">
                        <select name="industryID" id="company_industryID" class="ui-corner-all">
                        <option value="#qry_industry.industryID#">#qry_industry.industryName#</option>
                        </select>
                    </i>
                    <b>Web link</b>
                    <i class="NoFormat">
                        <input type="text" name="companyURL" id="company_companyURL" value="" class="ui-corner-all"/>
                    </i>
                    <b>VAT</b>
                    <i class="NoFormat">
                        <input type="text" id="company_VATNumber" value="#qry_company.VATNumber#" name="VATNumber" class="ui-corner-all">
                    </i>
                    <b>Company Bios</b>
                    <i class="NoFormat">
                        <textarea name="companyBios" id="companyBios" class="ui-corner-all ckeditor" style="height:100px; width:200px;">#qry_company.companyBios#</textarea>
                    </i>      
                    <button>go</button>
            </fieldset>
</div>

</form>
</body>
</html>