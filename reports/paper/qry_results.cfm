
<!--- Full with Comments --->

SELECT 
  tblIndividual.Title, 
  tblIndividual.strFirst_Name, 
  tblIndividual.strSurname, 
  tblIndividual.strDesignation, 
  tblCompany.strCompany_Name, 
  tblIndividual.strEmail, 
  tblIndividual.strPersonal_Info AS PERS_Comments, 
  tblAnnual_Conf.strConference_Code, 
  tblIndividual.lngSource_Code_ID, 
  tblConference_Registration.chkPress, 
  tblInvoiceDetails.InvoicePaid, 
  tblConference_Registration.chkCocktail AS Cocktail, 
  tblConference_Registration.chkDinner, 
  tblConference_Registration.strPersonal_Conf_Info AS CONF_Comments, 
  tblConference_Registration.chkGuest, 
  tblConference_Registration.chkSpeaker, 
  tblConference_Registration.chkDelegate, 
  tblConference_Registration.chkModerator, 
  tblConference_Registration.chkExhibitor, 
  tblAnnual_Conf.chkCocktail, 
  tblInvoiceDetails.InvoiceNo_LNK, 
  tblInvoiceDetails!INVComments AS INV_Comments, 
  tblConference_Registration.ChkCancelled, tblIndividual.strFaxSwitchboard_Code, tblIndividual.strFaxSwitchBoard_No
FROM (((tblIndividual LEFT JOIN tblCompany ON tblIndividual.lngCompany_ID = tblCompany.IngCompany_ID) LEFT JOIN tblConference_Registration ON tblIndividual.IngIndividual_ID = tblConference_Registration.lngIndividual_ID) LEFT JOIN tblAnnual_Conf ON tblConference_Registration.lngConference_ID = tblAnnual_Conf.IngConference_ID) LEFT JOIN tblInvoiceDetails ON tblConference_Registration.IngClient_Conf_ID = tblInvoiceDetails.Conf_Reg_ID
WHERE (((tblAnnual_Conf.strConference_Code)="PIFAK2010") AND ((tblConference_Registration.ChkCancelled)=False) AND ((tblIndividual.STATUS)="C"))
ORDER BY tblCompany.strCompany_Name;
