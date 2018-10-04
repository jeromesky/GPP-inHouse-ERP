<cfinclude template="../Application.cfm" >
<html>
<head>
  <meta HTTP-EQUIV="Content-Type" CONTENT="text/html;charset=UTF-8" />



</head>
<body >
<!---
<cfset rockbands=ArrayNew(2)>



<cfset rockbands[1][1]="Afghanistan">
<cfset rockbands[1][2]="0093">
<cfset rockbands[2][1]="Albania">
<cfset rockbands[2][2]="00355">
<cfset rockbands[3][1]="Algeria">
<cfset rockbands[3][2]="00213">
<cfset rockbands[4][1]="American Samoa">
<cfset rockbands[4][2]="001684"> 
<cfset rockbands[5][1]="Andorra">
<cfset rockbands[5][2]="00376"> 
<cfset rockbands[6][1]="Angola">
<cfset rockbands[6][2]="00244"> 
<cfset rockbands[7][1]="Anguilla">
<cfset rockbands[7][2]="001264"> 
<cfset rockbands[8][1]="Antarctica">
<cfset rockbands[8][2]="00672"> 
<cfset rockbands[9][1]="Antigua">
<cfset rockbands[9][2]="001268"> 
<cfset rockbands[10][1]="Argentina">
<cfset rockbands[10][2]="0054"> 
<cfset rockbands[11][1]="Armenia">
<cfset rockbands[11][2]="00374"> 
<cfset rockbands[12][1]="Aruba">
<cfset rockbands[12][2]="00297"> 
<cfset rockbands[13][1]="Ascension">
<cfset rockbands[13][2]="00247"> 
<cfset rockbands[14][1]="Australia">
<cfset rockbands[14][2]="0061"> 
<cfset rockbands[15][1]="Australian External Territories">
<cfset rockbands[15][2]="00672"> 
<cfset rockbands[16][1]="Austria">
<cfset rockbands[16][2]="0043"> 
<cfset rockbands[17][1]="Azerbaijan">
<cfset rockbands[17][2]="00994"> 
<cfset rockbands[18][1]="Bahamas">
<cfset rockbands[18][2]="001242"> 
<cfset rockbands[19][1]="Bahrain">
<cfset rockbands[19][2]="00973"> 
<cfset rockbands[20][1]="Bangladesh">
<cfset rockbands[20][2]="00880"> 
<cfset rockbands[21][1]="Barbados">
<cfset rockbands[21][2]="001246"> 
<cfset rockbands[22][1]="Barbuda">
<cfset rockbands[22][2]="001268"> 
<cfset rockbands[23][1]="Belarus">
<cfset rockbands[23][2]="00375"> 
<cfset rockbands[24][1]="Belgium">
<cfset rockbands[24][2]="0032"> 
<cfset rockbands[25][1]="Belize">
<cfset rockbands[25][2]="00501"> 
<cfset rockbands[26][1]="Benin">
<cfset rockbands[26][2]="00229"> 
<cfset rockbands[27][1]="Bermuda">
<cfset rockbands[27][2]="001441"> 
<cfset rockbands[28][1]="Bhutan">
<cfset rockbands[28][2]="00975"> 
<cfset rockbands[29][1]="Bolivia">
<cfset rockbands[29][2]="00591"> 
<cfset rockbands[30][1]="Bosnia & Herzegovina">
<cfset rockbands[30][2]="00387"> 
<cfset rockbands[31][1]="Botswana">
<cfset rockbands[31][2]="00267"> 
<cfset rockbands[32][1]="Brazil">
<cfset rockbands[32][2]="0055"> 
<cfset rockbands[33][1]="Brunei Darussalam">
<cfset rockbands[33][2]="00673"> 
<cfset rockbands[34][1]="Bulgaria">
<cfset rockbands[34][2]="00359"> 
<cfset rockbands[35][1]="Burkina Faso">
<cfset rockbands[35][2]="00226"> 
<cfset rockbands[36][1]="Burundi">
<cfset rockbands[36][2]="00257"> 
<cfset rockbands[37][1]="Cambodia">
<cfset rockbands[37][2]="00855"> 
<cfset rockbands[38][1]="Cameroon">
<cfset rockbands[38][2]="00237"> 
<cfset rockbands[39][1]="Canada">
<cfset rockbands[39][2]="001"> 
<cfset rockbands[40][1]="Cape Verde Islands">
<cfset rockbands[40][2]="00238"> 
<cfset rockbands[41][1]="Cayman Islands">
<cfset rockbands[41][2]="001345"> 
<cfset rockbands[42][1]="Central African Republic">
<cfset rockbands[42][2]="00236"> 
<cfset rockbands[43][1]="Chad">
<cfset rockbands[43][2]="00235"> 
<cfset rockbands[44][1]="Chatham Island">
<cfset rockbands[44][2]="0064"> 
<cfset rockbands[45][1]="Chile">
<cfset rockbands[45][2]="0056"> 
<cfset rockbands[46][1]="China">
<cfset rockbands[46][2]="0086"> 
<cfset rockbands[47][1]="Christmas Island">
<cfset rockbands[47][2]="0053"> 
<cfset rockbands[48][1]="Colombia">
<cfset rockbands[48][2]="0057"> 
<cfset rockbands[49][1]="Comoros">
<cfset rockbands[49][2]="00269"> 
<cfset rockbands[50][1]="Congo">
<cfset rockbands[50][2]="00242"> 
<cfset rockbands[51][1]="Congo, Dem. Rep. of former Zaire">
<cfset rockbands[51][2]="00243"> 
<cfset rockbands[52][1]="Cook Islands">
<cfset rockbands[52][2]="00682"> 
<cfset rockbands[53][1]="Costa Rica">
<cfset rockbands[53][2]="00506"> 
<cfset rockbands[54][1]="Cote d'Ivoire">
<cfset rockbands[54][2]="00225"> 
<cfset rockbands[55][1]="Croatia">
<cfset rockbands[55][2]="00385"> 
<cfset rockbands[56][1]="Cuba">
<cfset rockbands[56][2]="0053"> 
<cfset rockbands[57][1]="Curacao">
<cfset rockbands[57][2]="00599"> 
<cfset rockbands[58][1]="Cyprus">
<cfset rockbands[58][2]="00357"> 
<cfset rockbands[59][1]="Czech Republic">
<cfset rockbands[59][2]="00420"> 
<cfset rockbands[60][1]="Denmark">
<cfset rockbands[60][2]="0045"> 
<cfset rockbands[61][1]="Diego Garcia">
<cfset rockbands[61][2]="00246"> 
<cfset rockbands[62][1]="Djibouti">
<cfset rockbands[62][2]="00253"> 
<cfset rockbands[63][1]="Dominica">
<cfset rockbands[63][2]="001767"> 
<cfset rockbands[64][1]="Dominican Republic">
<cfset rockbands[64][2]="001809"> 
<cfset rockbands[65][1]="Dominican Republic">
<cfset rockbands[65][2]="001829"> 
<cfset rockbands[66][1]="East Timor">
<cfset rockbands[66][2]="00670"> 
<cfset rockbands[67][1]="Easter Island">
<cfset rockbands[67][2]="0056"> 
<cfset rockbands[68][1]="Ecuador">
<cfset rockbands[68][2]="00593"> 
<cfset rockbands[69][1]="Egypt">
<cfset rockbands[69][2]="0020"> 
<cfset rockbands[70][1]="El Salvador">
<cfset rockbands[70][2]="00503"> 
<cfset rockbands[71][1]="Equatorial Guinea">
<cfset rockbands[71][2]="00240"> 
<cfset rockbands[72][1]="Eritrea">
<cfset rockbands[72][2]="00291"> 
<cfset rockbands[73][1]="Estonia">
<cfset rockbands[73][2]="00372"> 
<cfset rockbands[74][1]="Ethiopia">
<cfset rockbands[74][2]="00251"> 
<cfset rockbands[75][1]="Falkland Islands Malvinas">
<cfset rockbands[75][2]="00500"> 
<cfset rockbands[76][1]="Faroe Islands">
<cfset rockbands[76][2]="00298"> 
<cfset rockbands[77][1]="Fiji Islands">
<cfset rockbands[77][2]="00679"> 
<cfset rockbands[78][1]="Finland">
<cfset rockbands[78][2]="00358"> 
<cfset rockbands[79][1]="France">
<cfset rockbands[79][2]="0033"> 
<cfset rockbands[80][1]="French Antilles">
<cfset rockbands[80][2]="00596"> 
<cfset rockbands[81][1]="French Guiana">
<cfset rockbands[81][2]="00594"> 
<cfset rockbands[82][1]="French Polynesia">
<cfset rockbands[82][2]="00689"> 
<cfset rockbands[83][1]="Gabonese Republic">
<cfset rockbands[83][2]="00241"> 
<cfset rockbands[84][1]="Gambia">
<cfset rockbands[84][2]="00220"> 
<cfset rockbands[85][1]="Georgia">
<cfset rockbands[85][2]="00995"> 
<cfset rockbands[86][1]="Germany">
<cfset rockbands[86][2]="0049"> 
<cfset rockbands[87][1]="Ghana">
<cfset rockbands[87][2]="00233"> 
<cfset rockbands[88][1]="Gibraltar">
<cfset rockbands[88][2]="00350"> 
<cfset rockbands[89][1]="Greece">
<cfset rockbands[89][2]="0030"> 
<cfset rockbands[90][1]="Greenland">
<cfset rockbands[90][2]="00299"> 
<cfset rockbands[91][1]="Grenada">
<cfset rockbands[91][2]="001473"> 
<cfset rockbands[92][1]="Guadeloupe">
<cfset rockbands[92][2]="00590"> 
<cfset rockbands[93][1]="Guam">
<cfset rockbands[93][2]="001671"> 
<cfset rockbands[94][1]="Guatemala">
<cfset rockbands[94][2]="00502"> 
<cfset rockbands[95][1]="Guinea">
<cfset rockbands[95][2]="00224"> 
<cfset rockbands[96][1]="Guinea-Bissau">
<cfset rockbands[96][2]="00245"> 
<cfset rockbands[97][1]="Guyana">
<cfset rockbands[97][2]="00592"> 
<cfset rockbands[98][1]="Haiti">
<cfset rockbands[98][2]="00509"> 
<cfset rockbands[99][1]="Honduras">
<cfset rockbands[99][2]="00504"> 
<cfset rockbands[100][1]="Hong Kong">
<cfset rockbands[100][2]="00852"> 
<cfset rockbands[101][1]="Hungary">
<cfset rockbands[101][2]="0036"> 
<cfset rockbands[102][1]="Iceland">
<cfset rockbands[102][2]="00354"> 
<cfset rockbands[103][1]="India">
<cfset rockbands[103][2]="0091"> 
<cfset rockbands[104][1]="Indonesia">
<cfset rockbands[104][2]="0062"> 
<cfset rockbands[105][1]="Iran">
<cfset rockbands[105][2]="0098"> 
<cfset rockbands[106][1]="Ireland">
<cfset rockbands[106][2]="00353"> 
<cfset rockbands[107][1]="Iraq">
<cfset rockbands[107][2]="00964"> 
<cfset rockbands[108][1]="Israel">
<cfset rockbands[108][2]="00972"> 
<cfset rockbands[109][1]="Italy">
<cfset rockbands[109][2]="0039"> 
<cfset rockbands[110][1]="Jamaica">
<cfset rockbands[110][2]="001876"> 
<cfset rockbands[111][1]="Japan">
<cfset rockbands[111][2]="0081"> 
<cfset rockbands[112][1]="Jordan">
<cfset rockbands[112][2]="00962"> 
<cfset rockbands[113][1]="Kazakhstan">
<cfset rockbands[113][2]="007"> 
<cfset rockbands[114][1]="Kenya">
<cfset rockbands[114][2]="00254"> 
<cfset rockbands[115][1]="Kiribati">
<cfset rockbands[115][2]="00686"> 
<cfset rockbands[116][1]="Korea North">
<cfset rockbands[116][2]="00850"> 
<cfset rockbands[117][1]="Korea South">
<cfset rockbands[117][2]="0082">
<cfset rockbands[118][1]="emty">
<cfset rockbands[118][2]="00">  
<cfset rockbands[119][1]="Kuwait">
<cfset rockbands[119][2]="00965"> 
<cfset rockbands[120][1]="Kyrgyz Republic">
<cfset rockbands[120][2]="00996"> 
<cfset rockbands[121][1]="Laos">
<cfset rockbands[121][2]="00856"> 
<cfset rockbands[122][1]="Latvia">
<cfset rockbands[122][2]="00371"> 
<cfset rockbands[123][1]="Lebanon">
<cfset rockbands[123][2]="00961"> 
<cfset rockbands[124][1]="Lesotho">
<cfset rockbands[124][2]="00266"> 
<cfset rockbands[125][1]="Liberia">
<cfset rockbands[125][2]="00231"> 
<cfset rockbands[126][1]="Libya">
<cfset rockbands[126][2]="00218"> 
<cfset rockbands[127][1]="Liechtenstein">
<cfset rockbands[127][2]="00423"> 
<cfset rockbands[128][1]="Lithuania">
<cfset rockbands[128][2]="00370"> 
<cfset rockbands[129][1]="Luxembourg">
<cfset rockbands[129][2]="00352"> 
<cfset rockbands[130][1]="Macao">
<cfset rockbands[130][2]="00853"> 
<cfset rockbands[131][1]="Macedonia">
<cfset rockbands[131][2]="00389"> 
<cfset rockbands[132][1]="Madagascar">
<cfset rockbands[132][2]="00261"> 
<cfset rockbands[133][1]="Malawi">
<cfset rockbands[133][2]="00265"> 
<cfset rockbands[134][1]="Malaysia">
<cfset rockbands[134][2]="0060"> 
<cfset rockbands[135][1]="Maldives">
<cfset rockbands[135][2]="00960"> 
<cfset rockbands[136][1]="Mali Republic">
<cfset rockbands[136][2]="00223"> 
<cfset rockbands[137][1]="Malta">
<cfset rockbands[137][2]="00356"> 
<cfset rockbands[138][1]="Marshall Islands">
<cfset rockbands[138][2]="00692"> 
<cfset rockbands[139][1]="Martinique">
<cfset rockbands[139][2]="00596"> 
<cfset rockbands[140][1]="Mauritania">
<cfset rockbands[140][2]="00222"> 
<cfset rockbands[141][1]="Mauritius">
<cfset rockbands[141][2]="00230"> 
<cfset rockbands[142][1]="Mayotte Island">
<cfset rockbands[142][2]="00269"> 
<cfset rockbands[143][1]="Mexico">
<cfset rockbands[143][2]="0052"> 
<cfset rockbands[144][1]="Micronesia Federal States of">
<cfset rockbands[144][2]="00691"> 
<cfset rockbands[145][1]="Midway Island">
<cfset rockbands[145][2]="001808"> 
<cfset rockbands[146][1]="Moldova">
<cfset rockbands[146][2]="00373"> 
<cfset rockbands[147][1]="Monaco">
<cfset rockbands[147][2]="00377"> 
<cfset rockbands[148][1]="Mongolia">
<cfset rockbands[148][2]="00976"> 
<cfset rockbands[149][1]="Montenegro">
<cfset rockbands[149][2]="00382"> 
<cfset rockbands[150][1]="Montserrat">
<cfset rockbands[150][2]="001664"> 
<cfset rockbands[151][1]="Morocco">
<cfset rockbands[151][2]="00212"> 
<cfset rockbands[152][1]="Mozambique">
<cfset rockbands[152][2]="00258"> 
<cfset rockbands[153][1]="Myanmar">
<cfset rockbands[153][2]="0095"> 
<cfset rockbands[154][1]="Namibia">
<cfset rockbands[154][2]="00264"> 
<cfset rockbands[155][1]="Nauru">
<cfset rockbands[155][2]="00674"> 
<cfset rockbands[156][1]="Nepal">
<cfset rockbands[156][2]="00977"> 
<cfset rockbands[157][1]="Netherlands">
<cfset rockbands[157][2]="0031"> 
<cfset rockbands[158][1]="Netherlands Antilles">
<cfset rockbands[158][2]="00599"> 
<cfset rockbands[159][1]="Nevis">
<cfset rockbands[159][2]="001869"> 
<cfset rockbands[160][1]="New Caledonia">
<cfset rockbands[160][2]="00687"> 
<cfset rockbands[161][1]="new Zealand">
<cfset rockbands[161][2]="0064"> 
<cfset rockbands[162][1]="Nicaragua">
<cfset rockbands[162][2]="00505"> 
<cfset rockbands[163][1]="Niger">
<cfset rockbands[163][2]="00227"> 
<cfset rockbands[164][1]="Nigeria">
<cfset rockbands[164][2]="00234"> 
<cfset rockbands[165][1]="Niue">
<cfset rockbands[165][2]="00683"> 
<cfset rockbands[166][1]="Norfolk Island">
<cfset rockbands[166][2]="00672"> 
<cfset rockbands[167][1]="Northern Marianas Islands">
<cfset rockbands[167][2]="00670"> 
<cfset rockbands[168][1]="Norway">
<cfset rockbands[168][2]="0047"> 
<cfset rockbands[169][1]="empty">
<cfset rockbands[169][2]="00"> 
<cfset rockbands[170][1]="Oman">
<cfset rockbands[170][2]="00968"> 
<cfset rockbands[171][1]="Pakistan">
<cfset rockbands[171][2]="0092"> 
<cfset rockbands[172][1]="Palau">
<cfset rockbands[172][2]="00680"> 
<cfset rockbands[173][1]="Palestinian Settlements">
<cfset rockbands[173][2]="00970"> 
<cfset rockbands[174][1]="Panama">
<cfset rockbands[174][2]="00507"> 
<cfset rockbands[175][1]="Papua New Guinea">
<cfset rockbands[175][2]="00675"> 
<cfset rockbands[176][1]="Paraguay">
<cfset rockbands[176][2]="00595"> 
<cfset rockbands[177][1]="Peru">
<cfset rockbands[177][2]="0051"> 
<cfset rockbands[178][1]="Philippines">
<cfset rockbands[178][2]="0063"> 
<cfset rockbands[179][1]="Poland">
<cfset rockbands[179][2]="0048"> 
<cfset rockbands[180][1]="Portugal">
<cfset rockbands[180][2]="00351"> 
<cfset rockbands[181][1]="Puerto Rico">
<cfset rockbands[181][2]="001787"> 
<cfset rockbands[182][1]="Puerto Rico">
<cfset rockbands[182][2]="001939"> 
<cfset rockbands[183][1]="Qatar">
<cfset rockbands[183][2]="00974"> 
<cfset rockbands[184][1]="Réunion">
<cfset rockbands[184][2]="00262"> 
<cfset rockbands[185][1]="Romania">
<cfset rockbands[185][2]="0040"> 
<cfset rockbands[186][1]="Russia">
<cfset rockbands[186][2]="007"> 
<cfset rockbands[187][1]="Rwandese Republic">
<cfset rockbands[187][2]="00250"> 
<cfset rockbands[188][1]="Samoa">
<cfset rockbands[188][2]="00685"> 
<cfset rockbands[189][1]="San Marino">
<cfset rockbands[189][2]="00378"> 
<cfset rockbands[190][1]="São Tomé & Príncipe">
<cfset rockbands[190][2]="00239"> 
<cfset rockbands[191][1]="Saudi Arabia">
<cfset rockbands[191][2]="00966"> 
<cfset rockbands[192][1]="Senegal">
<cfset rockbands[192][2]="00221"> 
<cfset rockbands[193][1]="Serbia">
<cfset rockbands[193][2]="00381"> 
<cfset rockbands[194][1]="Seychelles Republic">
<cfset rockbands[194][2]="00248"> 
<cfset rockbands[195][1]="Sierra Leone">
<cfset rockbands[195][2]="00232"> 
<cfset rockbands[196][1]="Singapore">
<cfset rockbands[196][2]="0065"> 
<cfset rockbands[197][1]="Slovak Republic">
<cfset rockbands[197][2]="00421"> 
<cfset rockbands[198][1]="Slovenia">
<cfset rockbands[198][2]="00386"> 
<cfset rockbands[199][1]="Solomon Islands">
<cfset rockbands[199][2]="00677"> 
<cfset rockbands[200][1]="Somali Democratic Republic">
<cfset rockbands[200][2]="00252"> 
<cfset rockbands[201][1]="South Africa">
<cfset rockbands[201][2]="0027"> 
<cfset rockbands[202][1]="Spain">
<cfset rockbands[202][2]="0034"> 
<cfset rockbands[203][1]="Sri Lanka">
<cfset rockbands[203][2]="0094"> 
<cfset rockbands[204][1]="St. Helena">
<cfset rockbands[204][2]="00290"> 
<cfset rockbands[205][1]="St. Kitts">
<cfset rockbands[205][2]="001869"> 
<cfset rockbands[206][1]="St. Lucia">
<cfset rockbands[206][2]="001758"> 
<cfset rockbands[207][1]="St. Pierre & Miquelon">
<cfset rockbands[207][2]="00508"> 
<cfset rockbands[208][1]="St. Vincent & Grenadines">
<cfset rockbands[208][2]="00784"> 
<cfset rockbands[209][1]="Sudan">
<cfset rockbands[209][2]="00249"> 
<cfset rockbands[210][1]="Suriname">
<cfset rockbands[210][2]="00597"> 
<cfset rockbands[211][1]="Swaziland">
<cfset rockbands[211][2]="00268"> 
<cfset rockbands[212][1]="Sweden">
<cfset rockbands[212][2]="0046"> 
<cfset rockbands[213][1]="Switzerland">
<cfset rockbands[213][2]="0041"> 
<cfset rockbands[214][1]="Syria">
<cfset rockbands[214][2]="00963"> 
<cfset rockbands[215][1]="Taiwan">
<cfset rockbands[215][2]="00886"> 
<cfset rockbands[216][1]="Tajikistan">
<cfset rockbands[216][2]="00992"> 
<cfset rockbands[217][1]="Tanzania">
<cfset rockbands[217][2]="00255"> 
<cfset rockbands[218][1]="Thailand">
<cfset rockbands[218][2]="0066"> 
<cfset rockbands[219][1]="Togolese Republic">
<cfset rockbands[219][2]="00228"> 
<cfset rockbands[220][1]="Tokelau">
<cfset rockbands[220][2]="00690"> 
<cfset rockbands[221][1]="Tonga Islands">
<cfset rockbands[221][2]="00676"> 
<cfset rockbands[222][1]="Trinidad & Tobago">
<cfset rockbands[222][2]="001868"> 
<cfset rockbands[223][1]="Tunisia">
<cfset rockbands[223][2]="00216"> 
<cfset rockbands[224][1]="Turkey">
<cfset rockbands[224][2]="0090"> 
<cfset rockbands[225][1]="Turkmenistan">
<cfset rockbands[225][2]="00993"> 
<cfset rockbands[226][1]="Turks & Caicos Islands">
<cfset rockbands[226][2]="001649"> 
<cfset rockbands[227][1]="Tuvalu">
<cfset rockbands[227][2]="00688"> 
<cfset rockbands[228][1]="Uganda">
<cfset rockbands[228][2]="00256"> 
<cfset rockbands[229][1]="Ukraine">
<cfset rockbands[229][2]="00380"> 
<cfset rockbands[230][1]="United Arab Emirates">
<cfset rockbands[230][2]="00971"> 
<cfset rockbands[231][1]="United Kingdom">
<cfset rockbands[231][2]="0044"> 
<cfset rockbands[232][1]="United States of America">
<cfset rockbands[232][2]="001"> 
<cfset rockbands[233][1]="Uruguay">
<cfset rockbands[233][2]="00598"> 
<cfset rockbands[234][1]="Uzbekistan">
<cfset rockbands[234][2]="00998"> 
<cfset rockbands[235][1]="Vanuatu">
<cfset rockbands[235][2]="00678"> 
<cfset rockbands[236][1]="Vatican City">
<cfset rockbands[236][2]="00379"> 
<cfset rockbands[237][1]="Venezuela">
<cfset rockbands[237][2]="0058"> 
<cfset rockbands[238][1]="Vietnam">
<cfset rockbands[238][2]="0084"> 
<cfset rockbands[239][1]="Virgin Islands - British">
<cfset rockbands[239][2]="001284"> 
<cfset rockbands[240][1]="Virgin Islands - US">
<cfset rockbands[240][2]="001340"> 
<cfset rockbands[241][1]="Wake Island">
<cfset rockbands[241][2]="00808"> 
<cfset rockbands[242][1]="Wallis & Futuna">
<cfset rockbands[242][2]="00681"> 
<cfset rockbands[243][1]="Yemen North">
<cfset rockbands[243][2]="00969"> 
<cfset rockbands[244][1]="Yemen South">
<cfset rockbands[244][2]="00967"> 
<cfset rockbands[245][1]="Yugoslavia">
<cfset rockbands[245][2]="00381"> 
<cfset rockbands[246][1]="Zambia">
<cfset rockbands[246][2]="00260"> 
<cfset rockbands[247][1]="Zanzibar">
<cfset rockbands[247][2]="00255"> 
<cfset rockbands[248][1]="Zimbabwe">
<cfset rockbands[248][2]="00263"> --->



<cfinclude template="../Application.cfm" >
<cfset wasrecord = 0 >

        <cfquery datasource="#dsnP21#" name="get">
                SELECT * FROM countrycodes WHERE done is NULL
        </cfquery>
        
        
<cfloop query="get">
		
        	<!---<cfquery name="datas"  datasource="gppdata" >
            	SELECT RecIDX
                FROM tblMiscLists
                WHERE MiscDescription LIKE '%#get.country#%'
            </cfquery>
             <cfquery datasource="#dsnP21#" >UPDATE countrycodes SET done = 1 WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#get.id#"></cfquery><cfif datas.recordcount gt 0 > 	</cfif>--->

				<cfquery datasource="gppdata" >
            	INSERT INTO  tblMiscLists (MiscType, MiscDescription, country_AreaCode)
                VALUES ( 'CNT', '#Ucase(get.country)#',  '00#get.code#' ) 
               
           		 </cfquery>
	        	


</cfloop>
 <cfoutput>#get.recordcount#</cfoutput>   



<!---
<cfoutput></cfoutput>
#ArrayLen(rockbands)#
   <cfoutput>
   #rockbands[OuterLoop][1]# is #rockbands[OuterLoop][2]#<br>
   </cfoutput>

<cfloop index="OuterLoop" from="1" to="#ArrayLen(rockbands)#">
<cfloop index="InnerLoop" from="1" to="#ArrayLen(rockbands[OuterLoop])#">
   <cfoutput>
   #rockbands[OuterLoop][InnerLoop]# is #rockbands[OuterLoop][InnerLoop]#<br>
   </cfoutput>
</cfloop>
</cfloop>



 Afghanistan"> (0093) <br />
     Albania"> (00355) <br />
     Algeria"> (00213) <br />
     American Samoa"> (001684) <br /> 
     Andorra"> (00376) <br /> 
     Angola"> (00244)  <br />
     Anguilla"> (001264)  <br />
     Antarctica"> (00672)  <br />
     Antigua"> (001268)  <br />
     Argentina"> (0054)  <br />
     Armenia"> (00374)  <br />
     Aruba"> (00297)  <br />
     Ascension"> (00247) <br /> 
     Australia"> (0061)  <br />
     Australian External Territories"> (00672)  <br />
     Austria"> (0043)  <br />
     Azerbaijan"> (00994)  <br />
     Bahamas"> (001242)  <br />
     Bahrain"> (00973)  <br />
     Bangladesh"> (00880)  <br />
     Barbados"> (001246)  <br />
     Barbuda"> (001268)  <br />
     Belarus"> (00375)  <br />
     Belgium"> (0032)  <br />
     Belize"> (00501)  <br />
     Benin"> (00229)  <br />
     Bermuda"> (001441)  <br />
     Bhutan"> (00975)  <br />
     Bolivia"> (00591)  <br />
     Bosnia &amp; Herzegovina"> (00387) <br /> 
     Botswana"> (00267)  <br />
     Brazil"> (0055)  <br />
     Brunei Darussalam"> (00673)  <br />
     Bulgaria"> (00359)  <br />
     Burkina Faso"> (00226)  <br />
     Burundi"> (00257)  <br />
     Cambodia"> (00855)  <br />
     Cameroon"> (00237)  <br />
     Canada"> (001)  <br />
     Cape Verde Islands"> (00238)  <br />
     Cayman Islands"> (001345)  <br />
     Central African Republic"> (00236)  <br />
     Chad"> (00235)  <br />
     Chatham Island"> (0064)  <br />
     Chile"> (0056)  <br />
     China"> (PRC)"> (0086)  <br />
     Christmas Island"> (0053)  <br />
     Colombia"> (0057)  <br />
     Comoros"> (00269)  <br />
     Congo"> (00242)  <br />
     Congo, Dem. Rep. of"> (former Zaire)"> (00243)  <br />
     Cook Islands"> (00682)  <br />
     Costa Rica"> (00506)  <br />
     Côte d'Ivoire"> (00225)  <br />
     Croatia"> (00385)  <br />
     Cuba"> (0053)  <br />
     Curaçao"> (00599)  <br />
     Cyprus"> (00357)  <br />
     Czech Republic"> (00420)  <br />
     Denmark"> (0045)  <br />
     Diego Garcia"> (00246)  <br />
     Djibouti"> (00253)  <br />
     Dominica"> (001767)  <br />
     Dominican Republic"> (001809)  <br />
     Dominican Republic"> (001829)  <br />
     East Timor"> (00670)  <br />
     Easter Island"> (0056)  <br />
     Ecuador"> (00593)  <br />
     Egypt"> (0020)  <br />
     El Salvador"> (00503)  <br />
     Equatorial Guinea"> (00240)  <br />
     Eritrea"> (00291)  <br />
     Estonia"> (00372)  <br />
     Ethiopia"> (00251)  <br />
     Falkland Islands"> (Malvinas)"> (00500)  <br />
     Faroe Islands"> (00298)  <br />
     Fiji Islands"> (00679)  <br />
     Finland"> (00358)  <br />
     France"> (0033)  <br />
     French Antilles"> (00596)  <br />
     French Guiana"> (00594)  <br />
     French Polynesia"> (00689)  <br />
     Gabonese Republic"> (00241)  <br />
     Gambia"> (00220)  <br />
     Georgia"> (00995)  <br />
     Germany"> (0049)  <br />
     Ghana"> (00233)  <br />
     Gibraltar"> (00350)  <br />
     Greece"> (0030)  <br />
     Greenland"> (00299)  <br />
     Grenada"> (001473)  <br />
     Guadeloupe"> (00590)  <br />
     Guam"> (001671)  <br />
     Guatemala"> (00502)  <br />
     Guinea"> (00224)  <br />
     Guinea-Bissau"> (00245)  <br />
     Guyana"> (00592)  <br />
     Haiti"> (00509)  <br />
     Honduras"> (00504)  <br />
     Hong Kong"> (00852)  <br />
     Hungary"> (0036)  <br />
     Iceland"> (00354)  <br />
     India"> (0091)  <br />
     Indonesia"> (0062)  <br />
     Iran"> (0098)  <br />
     Ireland"> (00353)  <br />
     Iraq"> (00964)  <br />
     Israel"> (00972)  <br />
     Italy"> (0039)  <br />
     Jamaica"> (001876)  <br />
     Japan"> (0081)  <br />
     Jordan"> (00962)  <br />
     Kazakhstan"> (007)  <br />
     Kenya"> (00254)  <br />
     Kiribati"> (00686)  <br />
     Korea"> (North)"> (00850)  <br />
     Korea"> (South)"> (0082)  <br />
     Kuwait"> (00965)  <br />
     Kyrgyz Republic"> (00996)  <br />
     Laos"> (00856)  <br />
     Latvia"> (00371)  <br />
     Lebanon"> (00961)  <br />
     Lesotho"> (00266)  <br />
     Liberia"> (00231)  <br />
     Libya"> (00218)  <br />
     Liechtenstein"> (00423)  <br />
     Lithuania"> (00370)  <br />
     Luxembourg"> (00352)  <br />
     Macao"> (00853)  <br />
     Macedonia"> (Former Yugoslav Rep. of)"> (00389)  <br />
     Madagascar"> (00261)  <br />
     Malawi"> (00265)  <br />
     Malaysia"> (0060)  <br />
     Maldives"> (00960)  <br />
     Mali Republic"> (00223)  <br />
     Malta"> (00356)  <br />
     Marshall Islands"> (00692) <br /> 
     Martinique"> (00596)  <br />
     Mauritania"> (00222)  <br />
     Mauritius"> (00230)  <br />
     Mayotte Island"> (00269)  <br />
     Mexico"> (0052)  <br />
     Micronesia"> (Federal States of)"> (00691)  <br />
     Midway Island"> (001808)  <br />
     Moldova"> (00373)  <br />
     Monaco"> (00377)  <br />
     Mongolia"> (00976)  <br />
     Montenegro"> (00382)  <br />
     Montserrat"> (001664)  <br />
     Morocco"> (00212)  <br />
     Mozambique"> (00258)  <br />
     Myanmar"> (0095)  <br />
     Namibia"> (00264)  <br />
     Nauru"> (00674)  <br />
     Nepal"> (00977)  <br />
     Netherlands"> (0031)  <br />
     Netherlands Antilles"> (00599)  <br />
     Nevis"> (001869)  <br />
     New Caledonia"> (00687)  <br />
     new Zealand"> (0064)  <br />
     Nicaragua"> (00505)  <br />
     Niger"> (00227)  <br />
     Nigeria"> (00234)  <br />
     Niue"> (00683)  <br />
     Norfolk Island"> (00672) <br /> 
     Northern Marianas Islands"> (00670)  <br />
     Norway"> (0047)  <br />
     Oman"> (00968)  <br />
     Pakistan"> (0092)  <br />
     Palau"> (00680)  <br />
     Palestinian Settlements"> (00970)  <br />
     Panama"> (00507)  <br />
     Papua New Guinea"> (00675)  <br />
     Paraguay"> (00595)  <br />
     Peru"> (0051)  <br />
     Philippines"> (0063)  <br />
     Poland"> (0048)  <br />
     Portugal"> (00351)  <br />
     Puerto Rico"> (001787)  <br />
     Puerto Rico"> (001939)  <br />
     Qatar"> (00974)  <br />
     Réunion"> (00262)  <br />
     Romania"> (0040)  <br />
     Russia"> (007)  <br />
     Rwandese Republic"> (00250)  <br />
     Samoa"> (00685)  <br />
     San Marino"> (00378)  <br />
     São Tomé &amp; Príncipe"> (00239)  <br />
     Saudi Arabia"> (00966)  <br />
     Senegal"> (00221)  <br />
     Serbia"> (00381)  <br />
     Seychelles Republic"> (00248)  <br />
     Sierra Leone"> (00232)  <br />
     Singapore"> (0065)  <br />
     Slovak Republic"> (00421)  <br />
     Slovenia"> (00386)  <br />
     Solomon Islands"> (00677)  <br />
     Somali Democratic Republic"> (00252)  <br />
     South Africa"> (0027)  <br />
     Spain"> (0034)  <br />
     Sri Lanka"> (0094)  <br />
     St. Helena"> (00290)  <br />
     St. Kitts"> (001869)  <br />
     St. Lucia"> (001758)  <br />
     St. Pierre &amp; Miquelon"> (00508)  <br />
     St. Vincent &amp; Grenadines"> (00784)  <br />
     Sudan"> (00249)  <br />
     Suriname"> (00597)  <br />
     Swaziland"> (00268)  <br />
     Sweden"> (0046)  <br />
     Switzerland"> (0041)  <br />
     Syria"> (00963)  <br />
     Taiwan"> (00886)  <br />
     Tajikistan"> (00992)  <br />
     Tanzania"> (00255)  <br />
     Thailand"> (0066)  <br />
     Togolese Republic"> (00228)  <br />
     Tokelau"> (00690)  <br />
     Tonga Islands"> (00676)  <br />
     Trinidad &amp; Tobago"> (001868)  <br />
     Tunisia"> (00216)  <br />
     Turkey"> (0090)  <br />
     Turkmenistan"> (00993)  <br />
     Turks &amp; Caicos Islands"> (001649)  <br />
     Tuvalu"> (00688)  <br />
     Uganda"> (00256)  <br />
     Ukraine"> (00380)  <br />
     United Arab Emirates"> (00971)  <br />
     United Kingdom"> (0044)  <br />
     United States of America"> (001)  <br />
     Uruguay"> (00598)  <br />
     Uzbekistan"> (00998)  <br />
     Vanuatu"> (00678)  <br />
     Vatican City"> (00379)  <br />
     Venezuela"> (0058)  <br />
     Vietnam"> (0084)  <br />
     Virgin Islands - British"> (001284)  <br />
     Virgin Islands - US"> (001340)  <br />
     Wake Island"> (00808)  <br />
     Wallis &amp; Futuna"> (00681)  <br />
     Yemen"> (North)"> (00969)  <br />
     Yemen"> (South)"> (00967)  <br />
     Yugoslavia"> (00381)  <br />
     Zambia"> (00260)  <br />
     Zanzibar"> (00255)  <br />
     263Zimbabwe"> (00263) <br />

--->
</body>
</html>