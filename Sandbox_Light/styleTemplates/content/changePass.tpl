<!-- BEGIN: change_pass -->
<div class="topTitle"></div>
<h1 class="txtContentTitle">{LANG_CHANGE_PASS_TITLE}</h1>
<div class="boxContent">
	<!-- BEGIN: session_true -->
	
	<!-- BEGIN: no_error -->
	<div class="typInfo">{LANG_PASS_DESC}</div>
	<!-- END: no_error -->
	
	<!-- BEGIN: error -->
	<div class="typError">{VAL_ERROR}</div>
	<!-- END: error -->
		<!-- BEGIN: form -->
		<form action="index.php?_a=changePass" target="_self" method="post">
        <div class="frmContainer">
        <p>
		<label for="oldPass">{TXT_OLD_PASS}</label>
		<input name="oldPass" type="password" class="textbox" id="oldPass" maxlength="30" />
        </p>
        <p>
		<label for="newPass">{TXT_NEW_PASS}</label>
		<input name="newPass" type="password" class="textbox" id="newPass" maxlength="100" />
        </p>
        <p>
		<label for="newPassConf">{TXT_NEW_PASS_CONF}</label>
		<input name="newPassConf" type="password" class="textbox" id="newPassConf" maxlength="100" />
        </p>
        <p>
		<input name="submit" type="submit" value="{TXT_SUBMIT}" class="button frmBtnAlign" />
        </p>
        </div>
		</form>
	<!-- END: form -->
	<!-- END: session_true -->
	
	<!-- BEGIN: session_false -->
	<div class="typError">You must login to change your password.</div>
	<!-- END: session_false -->

</div>
<!-- END: change_pass -->