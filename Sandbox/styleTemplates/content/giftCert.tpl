<!-- BEGIN: gift_cert -->
<div class="topTitle"></div>
<h1 class="txtContentTitle">{LANG_TITLE}</h1>
<div class="boxContent">
	<!-- BEGIN: error -->
	<div class="typError">{VAL_ERROR}</div>
	<!-- END: error -->
	<div class="typInfo">{LANG_DESC}</div>
	<form action="index.php?_a=giftCert" method="post">
    <div class="frmContainer">
    <p>
	<label for="gc[amount]">{LANG_AMOUNT}</label>
	<input name="gc[amount]" class="regbox" type="text" id="amount" size="6" maxlength="10" value="{VALUE_AMOUNT}" /><span class="mandatory"></span>&nbsp;&nbsp;{LANG_MIN_MAX}
    </p>
    <p>
	<label for="gc[recipName]">{LANG_RECIP_NAME}</label>
	<input name="gc[recipName]" class="regbox" type="text" id="name" value="{VALUE_RECIPNAME}" /><span class="mandatory"></span>
    </p>
    <p>
    <label for="gc[recipEmail]">{LANG_RECIP_EMAIL}</label>
	<input name="gc[recipEmail]" class="regbox" type="text" id="email" value="{VALUE_EMAIL}" /><span class="mandatory"></span>
    </p>
    <p>
    <label for="gc[message]">{LANG_MESSAGE}</label>
    <textarea name="gc[message]" class="textarea" style="width:203px;" cols="35" rows="5">{VALUE_MESSAGE}</textarea>
    </p>
    <p>
    <label for="gc[delivery]">{LANG_METHOD}</label>
    <select name="gc[delivery]" class="dropDownBox" style="width: 213px;">
		<!-- BEGIN: email_opts -->
		<option value='e' {VAL_DELIVERY_E}>{LANG_EMAIL}</option>
		<!-- END: email_opts -->
		<!-- BEGIN: mail_opts -->
		<option value='m' {VAL_DELIVERY_M}>{LANG_MAIL}</option>
		<!-- END: mail_opts -->
	</select>
    </p>
	<p>
    <input type="hidden" name="gc[cert]" value="1" />
	<input type="submit" class="button frmBtnAlign" name="Submit" value="{LANG_ADD_TO_BASKET}" />
    </p>
    </div>
	</form>
</div>
<!-- END: gift_cert -->