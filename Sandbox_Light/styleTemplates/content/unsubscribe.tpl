<!-- BEGIN: unsubscribe -->
<div class="topTitle"></div>
<h1 class="txtContentTitle">{UNSUBSCRIBE_TITLE}</h1>
<div class="boxContent">
	<!-- BEGIN: no_error -->
	<div class="typInfo">{LANG_UNSUBSCRIBE_DESC}</div>
	<!-- END: no_error -->
	<!-- BEGIN: error -->
	<div class="typError">{VAL_ERROR}</div>
	<!-- END: error -->

	<!-- BEGIN: form -->
	<form action="index.php?_a=unsubscribe" target="_self" method="post" style="text-align: center;">
        <div class="frmContainer">
        	<p>
            	<label for="email">{TXT_ENTER_EMAIL}</label><input type="text" name="email" class="textbox" />
            </p>
            <p>
            	<input name="submit" type="submit" value="{TXT_SUBMIT}" class="button frmBtnAlign" />
            </p>
        </div>
	</form>
	<!-- END: form -->
	
</div>
<!-- END: unsubscribe -->