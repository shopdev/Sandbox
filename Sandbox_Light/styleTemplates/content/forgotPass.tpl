<!-- BEGIN: forgot_pass -->
<div class="topTitle"></div>
<h1 class="txtContentTitle">{LANG_FORGOT_PASS_TITLE}</h1>
<div class="boxContent">
	<div class="typInfo">{FORGOT_PASS_STATUS}</div>
    <!-- BEGIN: error -->
    <div class="typError">{VAL_ERROR}</div>
    <!-- END: error -->
	<!-- BEGIN: form -->
	<form action="index.php?_a=forgotPass" target="_self" method="post">
    <div class="frmContainer">
    <p>
	<label for="email">{LANG_EMAIL}</label>
    <input type="text" name="email" class="textbox" />
    </p>
    <!-- BEGIN: spambot -->
    <p>
	<label for="spamcode">{TXT_SPAMBOT}</label>
    {IMG_SPAMBOT}
    <br clear="all" />
	<style type="text/css">
	  form img { margin:0px; }
	</style>
    <input name="spamcode" type="text" class="textbox" style="margin-left:200px; margin-top:10px; width: 118px;" value="" size="5" maxlength="5" />
    </p>
    <!-- END: spambot -->
    <!-- BEGIN: recaptcha -->
    <div style="padding-top:15px;">
	<label for="spamcode">{TXT_SPAMBOT}</label>
    {FILE "content/recaptcha.tpl"}
    </div>
    <p></p>
    <!-- END: recaptcha -->
    <input name="ESC" type="hidden" value="{VAL_ESC}" />
    <p>
    <input name="submit" type="submit" value="{TXT_SUBMIT}" class="button frmBtnAlign" />
    </p>
    </div>
	</form>
	<!-- END: form -->
</div>
<!-- END: forgot_pass -->