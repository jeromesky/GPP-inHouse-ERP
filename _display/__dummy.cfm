<html>
<title>Dummy Test Page</title>

<body>

<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>

<input name="txt1" type="text" id="txt167" />
<a href="javascript:void(0);" onclick="createCKE('txt167')">show</a> | <a href="javascript:void(0);" onclick="removalCKE('txt167')">hide</a><hr />

<input name="txt2" type="text" id="txt267" />
<a href="javascript:void(0);" onclick="createCKE('txt267')">show</a> | <a href="javascript:void(0);" onclick="removalCKE('txt267')">hide</a><hr />

<input name="txt3" type="text" id="txt367" />
<a href="javascript:void(0);" onclick="createCKE('txt367')">show</a> | <a href="javascript:void(0);" onclick="removalCKE('txt367')">hide</a><hr />

<a href="javascript:void(0);" onclick="destroyCKE()">kill all</a><hr>

<script type="text/javascript">
<!--

function createCKE(num) {
    var CKfoo = CKEDITOR.instances[num];
    if (CKfoo) {
        CKfoo.destroy(num);   
    }
    CKfoo = CKEDITOR.replace(num);
}

function removalCKE(num){
  var o=CKEDITOR.instances[num];
  if (o) o.destroy();
}

function destroyCKE(){
    // This is the magic line
   KillAllCKE(CKEDITOR.instances);
}

function KillAllCKE(obj) {
// This is the magic function
  for(prop in obj)
  {
    CKEDITOR.instances[prop].destroy();
  }
}

-->
</script>

</body>
</html>