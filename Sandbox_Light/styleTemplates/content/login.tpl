<!-- BEGIN: login -->
<div class="topTitle"></div>
<h1 class="txtContentTitle">{LANG_LOGIN_TITLE}</h1>
<div class="boxContent">
	
	<div class="typInfo">{LOGIN_STATUS}</div>
	
	<!-- BEGIN: form -->
	<form action="index.php?_a=login&amp;redir={VAL_SELF}" target="_self" method="post">
    <div class="frmContainer">
    <p>
    <label for="username">{LANG_USERNAME}</label>
    <input type="text" name="username" class="textbox" value="{VAL_USERNAME}" />
    </p>
    <p>
	<label for="password">{LANG_PASSWORD}</label>
    <input type="password" name="password" class="textbox" />
    </p>
    <p>
    <label for="remember">{LANG_REMEMBER}</label>
    <input name="remember" type="checkbox" style="margin-left:0px; margin-top:6px;" value="1" {CHECKBOX_STATUS} />
    </p>
    <p>
	<input name="submit" type="submit" value="{TXT_LOGIN}" class="button frmBtnAlign" />
    </p>
	</form>
    <div class="typPass"><a href="index.php?_a=forgotPass" class="txtDefault">{LANG_FORGOT_PASS}</a></div>
	<div class="typUser"><a href="index.php?_g=co&amp;_a=reg" class="txtDefault">New Customer?</a></div>
    </div>
	<!-- END: form -->
</div>
<!-- END: login -->