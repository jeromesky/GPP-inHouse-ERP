<HTML>
<HEAD>
<SCRIPT LANGUAGE="JavaScript"><!--
var splitIndex = 0;
var splitArray = new Array();

function splits(string,text) {
    var strLength = string.length, txtLength = text.length;
    if ((strLength == 0) || (txtLength == 0)) return;

    var i = string.indexOf(text);
    if ((!i) && (text != string.substring(0,txtLength))) return;
    if (i == -1) {
        splitArray[splitIndex++] = string;
        return;
    }

    splitArray[splitIndex++] = string.substring(0,i);
     
    if (i+txtLength < strLength)
        splits(string.substring(i+txtLength,strLength),text);

    return;
}

function split(string,text) {
    splitIndex = 0;
    splits(string,text);
}

function validate() {
    split(document.myform.mytext.value,'\n');
    if (splitIndex > 50) {
        alert('Only 50 rows')
        return false;
    }
    for (var i=0;i<splitIndex;i++) {
        if (splitArray[i].length > 60) {
            alert('Only 60 cols');
            return false;
        }
    }
    return true;
}
//--></SCRIPT>

<SCRIPT LANGUAGE="JavaScript1.1"><!--
function split(string,text) {
    splitArray = string.split(text);
    splitIndex = splitArray.length;
}
//--></SCRIPT>
</HEAD>

<BODY>

<FORM NAME="emailsX50" onSubmit="return validate()" action="act_process_emails.cfm" method="post" >
<TEXTAREA NAME="linesX50" ROWS="50" COLS="30">
jason@glopac.com
nobody@glopac.com
</TEXTAREA>
<INPUT TYPE="SUBMIT">
</FORM>

</BODY>
</HTML>