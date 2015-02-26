<!-- BEGIN: reg -->

{JS_COUNTY_OPTIONS}
<script type="text/javascript" language="javascript">
function toggleReg() {
	$("#securityDetails").slideToggle('slow');
	$("#password").attr("value","");
	$("#passwordConf").attr("value","");
	$('#confirmPWD').css("background-image","url('http://www.shopdev.co.uk/img/asterisk_orange.gif')");
}
</script>
<div class="topTitle"></div>
<span class="txtContentTitle">{LANG_REGISTER}</span>
<div class="boxContent">
  <!-- BEGIN: no_error -->
  <div class="typInfo">{LANG_REGISTER_DESC}</div>
  <!-- END: no_error -->
  <!-- BEGIN: error -->
  <div class="typError">{VAL_ERROR}</div>
  <!-- END: error -->
  <form name="registerForm" method="post" action="{VAL_ACTION}">
    <fieldset>
    <legend>{LANG_PERSONAL_DETAILS}</legend>
    <div class="frmContainer">
      <p>
        <label for="title">{LANG_TITLE}</label>
        <input name="title" type="text" class="textbox" id="title" size="5" value="{VAL_TITLE}" tabindex="1" style="width:60px;" />
        <span class="mandatory"></span> </p>
      <p>
        <label for="firstName">{LANG_FIRST_NAME}</label>
        <input name="firstName" type="text" class="textbox" id="firstName" size="16" value="{VAL_FIRST_NAME}" tabindex="2" />
        <span class="mandatory"></span> </p>
      <p>
        <label for="lastName">{LANG_LAST_NAME}</label>
        <input name="lastName" type="text" class="textbox" id="lastName" size="16" value="{VAL_LAST_NAME}" tabindex="3" />
        <span class="mandatory"></span> </p>
      <p>
        <label for="email">{LANG_EMAIL_ADDRESS}</label>
        <input name="email" type="text" class="textbox" id="email" size="16" value="{VAL_EMAIL}" tabindex="4" />
        <span class="mandatory"></span> </p>
      <p>
        <label for="telephone">{LANG_TELEPHONE}</label>
        <input name="phone" type="text" class="textbox" id="phone" size="16" value="{VAL_PHONE}" tabindex="5" />
        <span class="mandatory"></span> </p>
      <p>
        <label for="mobile">{LANG_MOBILE}</label>
        <input name="mobile" type="text" class="textbox" id="mobile" size="16" value="{VAL_MOBILE}" tabindex="6" />
      </p>
    </div>
    </fieldset>
    <fieldset>
    <legend>{LANG_ADDRESS}</legend>
    <div class="frmContainer">
      <p>
        <label for="companyName">{LANG_COMPANY_NAME}</label>
        <input name="companyName" type="text" class="textbox" id="companyName" size="16" value="{VAL_COMPANY_NAME}" tabindex="7" />
      </p>
      <p style="border-bottom:none;">
        <label for="add_1">{LANG_ADDRESS_FORM}</label>
        <input name="add_1" type="text" class="textbox" id="add_1" size="16" value="{VAL_ADD_1}" tabindex="8" />
        <span class="mandatory"></span>
      <p>
        <input name="add_2" type="text" class="textbox frmAlign" id="add_2" size="16" value="{VAL_ADD_2}" tabindex="9" style="float:none;" />
      </p>
      <p>
        <label for="town">{LANG_TOWN}</label>
        <input name="town" type="text" class="textbox" id="town" size="16" value="{VAL_TOWN}" tabindex="10" />
        <span class="mandatory"></span> </p>
      <p>
        <label for="county">{LANG_COUNTY}</label>
        <span id="divCountyText" {VAL_COUNTY_TXT_STYLE}>
        <input name="county" type="text" class="textbox" id="county" value="{VAL_DEL_COUNTY}" maxlength="50" tabindex="11" style="float:left;" />
        <span class="mandatory" style="float:left;"></span><br clear="all" />
        </span> <span id="divCountySelect" {VAL_COUNTY_SEL_STYLE}>
        <select name="county_sel" id="county_sel" class="dropDownBox" style="float:none;" tabindex="11">
          <!-- BEGIN: county_opts -->
          <option value="{VAL_DEL_COUNTY_ID}" {COUNTY_SELECTED}>{VAL_DEL_COUNTY_NAME}</option>
          <!-- END: county_opts -->
        </select>
        </span>
        <input name="which_field" type="hidden" id="which_field" value="{VAL_COUNTY_WHICH_FIELD}" />
      </p>
      <p>
        <label for="country">{LANG_COUNTRY}</label>
        <select name="country" class="dropDownBox" tabindex="12" onchange="updateCounty(this.form);" style="float:none;">
          <!-- BEGIN: repeat_countries -->
          <option value="{VAL_COUNTRY_ID}" {VAL_COUNTRY_SELECTED}>{VAL_COUNTRY_NAME}</option>
          <!-- END: repeat_countries -->
        </select>
      </p>
      <p>
        <label for="postcode">{LANG_POSTCODE}</label>
        <input name="postcode" type="text" class="textbox" id="postcode" size="16" value="{VAL_POSTCODE}" tabindex="13" />
        <span class="mandatory"></span> </p>
    </div>
    </fieldset>
    <fieldset>
    <legend>Security Details</legend>
    <div class="frmContainer">
      <!-- BEGIN: account_opt -->
      <p>
        <label for="skipReg">{LANG_NO_ACCOUNT_WANTED}</label>
        <input name="skipReg" type="checkbox" style="margin-top:13px; margin-left:0px;" tabindex="14" onclick="toggleReg();" value="1" {VAL_SKIP_REG_CHECKED} />
        <br clear="all" />
      </p>
      <!-- END: account_opt -->
      <!-- BEGIN: spambot -->
      <p>
        <label for="spamcode">{TXT_SPAMBOT}</label>
        {IMG_SPAMBOT}<br clear="all" />
		<style type="text/css">
		  form img { margin:0px; }
		</style>
        <input name="spamcode" type="text" class="textbox" style="margin-left:200px; margin-top:10px; width: 118px;" value="" size="5" maxlength="5" />
        <span class="mandatory" style="margin-top:13px;"></span> </p>
      <!-- END: spambot -->
      <!-- BEGIN: recaptcha -->
      <br clear="all" />
      <label for="spamcode">{TXT_SPAMBOT}</label>
      {FILE "content/recaptcha.tpl"}
      <p></p>
      <!-- END: recaptcha -->
      <div id="securityDetails">
        <p>
          <label for="password">{LANG_CHOOSE_PASSWORD}</label>
          <input name="password" type="password" class="textbox" id="password" size="16" value="{VAL_PASSWORD}" tabindex="16" />
          <span class="mandatory"></span> </p>
        <p>
          <label for="passwordConf">{LANG_CONFIRM_PASSWORD}</label>
          <input name="passwordConf" type="password" class="textbox" id="passwordConf" size="16" value="{VAL_PASSWORD_CONF}" tabindex="17" />
          <span class="mandatory" id="confirmPWD"></span> </p>
      </div>
    </div>
    </fieldset>
    <fieldset>
    <legend>{LANG_PRIVACY_SETTINGS}</legend>
    <div class="frmContainer">
    <p style="height:40px; padding-right:10px;">
      <label for="optIn1st">{LANG_RECIEVE_EMAILS}</label>
      <input type="checkbox" name="optIn1st" value="1" style="margin:0; margin-top:13px;" tabindex="18" {VAL_OPTIN1ST_CHECKED}/>
    </p>
    <p>
      <label for="optIn1st">{LANG_EMAIL_FORMAT}</label>
      <select name="htmlEmail" class="dropDownBox" tabindex="19" style="float:none;">
        <option value="1">{LANG_HTML_FORMAT}</option>
        <option value="0" {VAL_HTMLEMAIL_SELECTED}>{LANG_PLAIN_TEXT}</option>
      </select>
    </p>
    </div>
    </fieldset>
    {LANG_PLEASE_READ} <a href="{LINK_TANDCS}" target="_blank" class="txtDefault" style="color:#666666; text-decoration:underline;">{LANG_TANDCS}</a> <input type="checkbox" name="tandc" value="checkbox" tabindex="20" />
    <br />
    <br />
    <input name="register" type="button" onclick="submitDoc('registerForm');" tabindex="21"  value="{LANG_REGISTER_SUBMIT}" class="button" />
    <input name="ESC" type="hidden" value="{VAL_ESC}" />
  </form>
</div>
</div>
<!-- END: reg -->
