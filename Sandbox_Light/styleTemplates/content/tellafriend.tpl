<!-- BEGIN: tellafriend -->
<div class="topTitle"></div>
<h1 class="txtContentTitle">{TAF_TITLE}</h1>
<div class="boxContent">
	<!-- BEGIN: error -->
	<div class="typError">{VAL_ERROR}</div>
	<!-- END: error -->
	<div class="typInfo">{TAF_DESC}</div>
	
	<form action="index.php?_a=tellafriend&amp;productId={PRODUCT_ID}" target="_self" method="post">
        <div class="frmContainer">
            <p>
            <label for="recipName">{TXT_RECIP_NAME}</label>
            <input type="text" name="recipName" class="textbox" />
            </p>
            <p>
            <label for="recipEmail">{TXT_RECIP_EMAIL}</label>
            <input type="text" name="recipEmail" class="textbox" />
            </p>
            <p>
            <label for="senderName">{TXT_SENDER_NAME}</label>
            <input type="text" name="senderName" class="textbox" value="{VAL_SENDER_NAME}" />
            </p>
            <p>
            <label for="senderEmail">{TXT_SENDER_EMAIL}</label>
            <input type="text" name="senderEmail" class="textbox" value="{VAL_SENDER_EMAIL}" />
            </p>
            <!-- BEGIN: spambot -->
            <p>
            <label for="spamcode">{TXT_SPAMBOT}</label>
            {IMG_SPAMBOT}<br />
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
            <p>
            <label for="message">{TXT_MESSAGE}</label>
            <textarea name="message" class="textarea" style="width:389px;" rows="10" cols="70">{VAL_MESSAGE}</textarea>
            </p>
            <p>
            <input name="submit" type="submit" value="{TXT_SUBMIT}" class="button frmBtnAlign" />
            </p>
            <input name="ESC" type="hidden" value="{VAL_ESC}" />
        </div>
	</form>
</div>
<!-- END: tellafriend -->