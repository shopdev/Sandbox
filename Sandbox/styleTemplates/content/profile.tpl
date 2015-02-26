<!-- BEGIN: profile -->
{JS_COUNTY_OPTIONS}
<div class="topTitle"></div>
<h1 class="txtContentTitle">{LANG_PERSONAL_INFO_TITLE}</h1>
<div class="boxContent">
	<div class="cartProgress">
        <span><img src="skins/Sandbox/styleImages/steps/stepShoppingCart.gif" alt="Shopping Cart" width="350" height="26" /></span>
        <span class="txtcartProgressCurrent"><img src="skins/Sandbox/styleImages/steps/stepAddress.gif" alt="Address" width="350" height="26" /></span>
        <span><img src="skins/Sandbox/styleImages/steps/stepPayment.gif" alt="Payment" width="350" height="26" /></span>
        <span><img src="skins/Sandbox/styleImages/steps/stepComplete.gif" alt="Complete" width="350" height="26" /></span>
    </div>
	<!-- BEGIN: session_true -->
	<!-- BEGIN: no_error -->
	<div class="typInfo">{LANG_PROFILE_DESC}</div>
	<!-- END: no_error -->
	<!-- BEGIN: error -->
	<div class="typError">{VAL_ERROR}</div>
	<!-- END: error -->
	<form action="index.php?_a=profile{VAL_EXTRA_GET}" target="_self" method="post">
    <div class="frmContainer">
        <p>
		<label for="">{TXT_TITLE}</label>
		<input name="title" type="text" class="textbox" id="title" value="{VAL_TITLE}" size="7" maxlength="30" tabindex="1" /><span class="mandatory"></span>
		</p>
        <p>
		<label for="">{TXT_FIRST_NAME}</label>
		<input name="firstName" type="text" class="textbox" id="firstName" value="{VAL_FIRST_NAME}" maxlength="100" tabindex="2" /><span class="mandatory"></span>
		</p>
        <p>
		<label for="">{TXT_LAST_NAME}</label>
		<input name="lastName" type="text" class="textbox" id="lastName" value="{VAL_LAST_NAME}" maxlength="100" tabindex="3" /><span class="mandatory"></span>
		</p>
        <p>
		<label for="">{TXT_EMAIL}</label>
		<input name="email" type="text" class="textbox" id="email" value="{VAL_EMAIL}" maxlength="100" tabindex="4" /><span class="mandatory"></span>
		</p>
        <p>
		<label for="">{TXT_COMPANY_NAME}</label>
		<input name="companyName" type="text" class="textbox" id="companyName" value="{VAL_COMPANY_NAME}" maxlength="150" />
		</p>
        <p style="border-bottom:none;">
		<label for="">{TXT_ADD_1}</label>
		<input name="add_1" type="text" class="textbox" id="add_1" value="{VAL_ADD_1}" maxlength="100" tabindex="5" /><span class="mandatory"></span>
		</p>
        <p>
		<input id="addr2" name="add_2" type="text" class="textbox frmAlign" value="{VAL_ADD_2}" maxlength="100" tabindex="6" />
		</p>
        <p>
		<label for="">{TXT_TOWN}</label>
		<input name="town" type="text" class="textbox" id="town" value="{VAL_TOWN}" maxlength="100" tabindex="7" /><span class="mandatory"></span>
		</p>
        <p>
		<label for="">{TXT_COUNTY}</label>
        <span id="divCountyText" {VAL_COUNTY_TXT_STYLE}>
        <input name="county" type="text" class="textbox" id="county" value="{VAL_DEL_COUNTY}" maxlength="50" tabindex="8" /><span class="mandatory"></span>
        </span>
        <span id="divCountySelect" {VAL_COUNTY_SEL_STYLE}>
        <select name="county_sel" style="width:170px;" id="county_sel" class="dropDownBox" tabindex="8">
          <!-- BEGIN: county_opts -->
          <option value="{VAL_DEL_COUNTY_ID}" {COUNTY_SELECTED}>{VAL_DEL_COUNTY_NAME}</option>
          <!-- END: county_opts -->
        </select>
        </span>
		</p>
        <input name="which_field" type="hidden" id="which_field" value="{VAL_COUNTY_WHICH_FIELD}" />
        <p>
        <label for="">{TXT_POSTCODE}</label>
		<input name="postcode" type="text" class="textbox" id="postcode" value="{VAL_POSTCODE}" maxlength="100" tabindex="9" /><span class="mandatory"></span>
		</p>
        <p>
		<label for="">{TXT_COUNTRY}</label>
		<select name="country" id="country" class="dropDownBox" style="width:170px;" onchange="updateCounty(this.form);" tabindex="10">
            <!-- BEGIN: country_opts -->
            <option value="{VAL_COUNTRY_ID}" {COUNTRY_SELECTED}>{VAL_COUNTRY_NAME}</option>
            <!-- END: country_opts -->
        </select>
		</p>
        <p>
		<label for="">{TXT_PHONE}</label>
		<input name="phone" type="text" class="textbox" id="phone" value="{VAL_PHONE}" maxlength="100" tabindex="11" /><span class="mandatory"></span>
		</p>
        <p>
		<label for="">{TXT_MOBILE}</label>
		<input name="mobile" type="text" class="textbox" id="mobile" value="{VAL_MOBILE}" maxlength="100" tabindex="12" />
		</p>
        <p>
		<input name="submit" type="submit" value="{TXT_SUBMIT}" class="button frmBtnAlign" tabindex="13" />
		</p>
     </div>
	</form>
	<!-- END: session_true -->
	
	<!-- BEGIN: session_false -->
	<div class="typError">{LANG_LOGIN_REQUIRED}</div>
	<!-- END: session_false -->
</div>
<!-- END: profile -->