<!-- BEGIN: view_cart -->
{JS_COUNTY_OPTIONS}
<div class="topTitle"></div>
<h1 class="txtContentTitle">{LANG_VIEW_CART}</h1>
<div class="boxContent">
    <div class="cartProgress">
        <span {CLASS_CART}><img src="skins/Sandbox_Light/styleImages/steps/stepShoppingCart.gif" alt="Shopping Cart" width="350" height="26" /></span>
        <span {CLASS_STEP2}><img src="skins/Sandbox_Light/styleImages/steps/stepAddress.gif" alt="Address" width="350" height="26" /></span>
        <span><img src="skins/Sandbox_Light/styleImages/steps/stepPayment.gif" alt="Payment" width="350" height="26" /></span>
        <span><img src="skins/Sandbox_Light/styleImages/steps/stepComplete.gif" alt="Complete" width="350" height="26" /></span>
    </div>
  <!-- BEGIN: cart_false -->
  <div class="typError">{LANG_CART_EMPTY}</div>
  <!-- END: cart_false -->
  <!-- BEGIN: cart_true -->
  <form name="cart" method="post" id="cart" action="{VAL_FORM_ACTION}">
    <!-- BEGIN: edit_delivery -->
    <table width="100%"  border="0" cellspacing="0" cellpadding="3" class="cartContent" id="addrDetails">
      <tr>
        <td width="50%" align="left" class="tdcartTitle">{LANG_INVOICE_ADDRESS}</td>
        <td colspan="2" align="left" class="tdcartTitle">{LANG_DELIVERY_ADDRESS}</td>
      </tr>
      <tr>
        <td width="50%" align="left" class="tdcartOdd firstRow">{VAL_TITLE} {VAL_FIRST_NAME} {VAL_LAST_NAME}</td>
        <td align="left" class="tdcartOdd firstRow"><strong>{TXT_TITLE}</strong></td>
        <td align="left" class="tdcartOdd firstRow"><input name="delInf[title]" type="text" class="textbox" id="title" value="{VAL_DEL_TITLE}" size="7" maxlength="30" /></td>
      </tr>
      <tr>
        <td align="left" class="tdcartOdd">{VAL_COMPANY_NAME}</td>
        <td align="left" class="tdcartOdd"><strong>{TXT_FIRST_NAME}</strong></td>
        <td align="left" class="tdcartOdd"><input name="delInf[firstName]" type="text" class="textbox" id="firstName" value="{VAL_DEL_FIRST_NAME}" maxlength="100" /></td>
      </tr>
      <tr>
        <td align="left" class="tdcartOdd">{VAL_ADD_1}</td>
        <td align="left" class="tdcartOdd"><strong>{TXT_LAST_NAME}</strong></td>
        <td align="left" class="tdcartOdd"><input name="delInf[lastName]" type="text" class="textbox" id="lastName" value="{VAL_DEL_LAST_NAME}" maxlength="100" /></td>
      </tr>
      <tr>
        <td align="left" class="tdcartOdd">{VAL_ADD_2}</td>
        <td align="left" class="tdcartOdd"><strong>{TXT_COMPANY_NAME}</strong></td>
        <td align="left" class="tdcartOdd"><input name="delInf[companyName]" type="text" class="textbox" id="companyName" value="{VAL_DEL_COMPANY_NAME}" maxlength="100" /></td>
      </tr>
      <tr>
        <td width="50%" align="left" class="tdcartOdd">{VAL_TOWN}</td>
        <td align="left" class="tdcartOdd"><strong>{TXT_ADD_1}</strong></td>
        <td align="left" class="tdcartOdd"><input name="delInf[add_1]" type="text" class="textbox" id="add_1" value="{VAL_DEL_ADD_1}" maxlength="100" /></td>
      </tr>
      <tr>
        <td width="50%" align="left" class="tdcartOdd">{VAL_COUNTY}, {VAL_POSTCODE}</td>
        <td align="left" class="tdcartOdd"><strong>{TXT_ADD_2}</strong></td>
        <td align="left" class="tdcartOdd"><input name="delInf[add_2]" type="text" class="textbox" id="add_2" value="{VAL_DEL_ADD_2}" maxlength="100" /></td>
      </tr>
      <tr>
        <td width="50%" align="left" class="tdcartOdd">{VAL_COUNTRY}</td>
        <td align="left" class="tdcartOdd"><strong>{TXT_TOWN}</strong></td>
        <td align="left" class="tdcartOdd"><input name="delInf[town]" type="text" class="textbox" id="town" value="{VAL_DEL_TOWN}" maxlength="100" /></td>
      </tr>
      <tr>
        <td width="50%" rowspan="3" align="left" valign="bottom" class="tdcartOdd"><a href="index.php?_a=profile&amp;f={VAL_BACK_TO}" class="button">{LANG_CHANGE_INV_ADD}</a></td>
        <td align="left" class="tdcartOdd"><strong>{TXT_POSTCODE}</strong></td>
        <td align="left" class="tdcartOdd"><input name="delInf[postcode]" type="text" class="textbox" id="postcode" value="{VAL_DEL_POSTCODE}" maxlength="100" /></td>
      </tr>
      <tr>
        <td align="left" class="tdcartOdd"><strong>{TXT_COUNTRY}</strong></td>
        <td align="left" class="tdcartOdd"><select name="delInf[country]" id="country" class="dropDown" onchange="updateCounty(this.form);">
            <!-- BEGIN: country_opts -->
            <option value="{VAL_DEL_COUNTRY_ID}" {COUNTRY_SELECTED}>{VAL_DEL_COUNTRY_NAME}</option>
            <!-- END: country_opts -->
        </select>        </td>
      </tr>
      <tr>
        <td align="left" class="tdcartOdd"><strong>{TXT_COUNTY}</strong></td>
        <td align="left" class="tdcartOdd"><div id="divCountyText" {VAL_COUNTY_TXT_STYLE}>
            <input name="delInf[county]" type="text" class="textbox" id="county" value="{VAL_DEL_COUNTY}" maxlength="100" />
          </div>
            <div id="divCountySelect" {VAL_COUNTY_SEL_STYLE}>
              <select name="delInf[county_sel]" id="county_sel" class="dropDown">
                <!-- BEGIN: county_opts -->
                <option value="{VAL_DEL_COUNTY_NAME}" {COUNTY_SELECTED}>{VAL_DEL_COUNTY_NAME}</option>
                <!-- END: county_opts -->
              </select>
            </div>
        <input name="which_field" type="hidden" id="which_field" value="{VAL_COUNTY_WHICH_FIELD}" />        </td>
      </tr>
    </table>
    <!-- END: edit_delivery -->
    <!-- BEGIN: fixed_delivery -->
    <table width="100%"  border="0" cellspacing="0" cellpadding="0" class="cartContent" id="addrDetails">
      <tr>
        <td width="50%" class="tdcartTitle">{LANG_INVOICE_ADDRESS}</td>
        <td class="tdcartTitle">{LANG_DELIVERY_ADDRESS}</td>
      </tr>
      <tr>
        <td width="50%" class="tdcartOdd firstRow">{VAL_TITLE} {VAL_FIRST_NAME} {VAL_LAST_NAME}</td>
        <td class="tdcartOdd firstRow">{VAL_DEL_TITLE} {VAL_DEL_FIRST_NAME} {VAL_DEL_LAST_NAME}</td>
      </tr>
      <tr>
        <td class="tdcartOdd">{VAL_COMPANY_NAME}</td>
        <td class="tdcartOdd">{VAL_DEL_COMPANY_NAME}</td>
      </tr>
      <tr>
        <td class="tdcartOdd">{VAL_ADD_1}</td>
        <td class="tdcartOdd">{VAL_DEL_ADD_1}</td>
      </tr>
      <tr>
        <td class="tdcartOdd">{VAL_ADD_2}</td>
        <td class="tdcartOdd">{VAL_DEL_ADD_2}</td>
      </tr>
      <tr>
        <td width="50%" class="tdcartOdd">{VAL_TOWN}</td>
        <td class="tdcartOdd">{VAL_DEL_TOWN}</td>
      </tr>
      <tr>
        <td width="50%" class="tdcartOdd">{VAL_COUNTY}, {VAL_POSTCODE}</td>
        <td class="tdcartOdd">{VAL_DEL_COUNTY}, {VAL_DEL_POSTCODE}</td>
      </tr>
      <tr>
        <td width="50%" class="tdcartOdd">{VAL_COUNTRY}</td>
        <td class="tdcartOdd">{VAL_DEL_COUNTRY}</td>
      </tr>
      <tr>
        <td width="50%" class="tdcartOdd">
        	<a href="index.php?_a=profile&amp;f={VAL_BACK_TO}" class="button">{LANG_CHANGE_INV_ADD}</a>
        </td>
        <td class="tdcartOdd">
          <!-- BEGIN: edit_btn -->
       	  <a href="index.php?_g=co&amp;_a=step2&amp;editDel=1" class="button">{LANG_CHANGE_DEL_ADD}</a>
          <!-- END: edit_btn -->
        </td>
      </tr>
    </table>
    <!-- END: fixed_delivery -->
    <table width="100%" border="0" cellpadding="3" cellspacing="0" class="cartContent">
      <tr class="cartHeaders">
        <td class="tdcartTitle" width="40%">{LANG_PRODUCT}</td>
        <td align="center" class="tdcartTitle">{LANG_CODE}</td>
        <td align="center" class="tdcartTitle">{LANG_STOCK}</td>
        <td class="tdcartTitle" align="center">{LANG_PRICE}</td>
        <td align="center" class="tdcartTitle">{LANG_QTY}</td>
        <td width="80" align="center" nowrap='nowrap' class="tdcartTitle">{LANG_LINE_PRICE}</td>
        <td class="tdcartTitle">&nbsp;</td>
      </tr>
      <!-- BEGIN: repeat_cart_contents -->
      <tr>
        <td valign="middle" class="{TD_CART_CLASS}"><a href="index.php?_a=viewProd&amp;productId={VAL_PRODUCT_ID}" class="txtDefault">{VAL_PRODUCT_NAME}</a>
          <!-- BEGIN: options -->
          <br />
          <strong>{VAL_OPT_NAME}</strong>: {VAL_OPT_VALUE}
          <!-- END: options -->
        </td>
        <td align="center" valign="middle" class="{TD_CART_CLASS}">{VAL_PRODUCT_CODE}</td>
        <td align="center" valign="middle" class="{TD_CART_CLASS}">{VAL_INSTOCK}</td>
        <td align="center" valign="middle" class="{TD_CART_CLASS}">{VAL_IND_PRICE}</td>
        <td align="center" valign="middle" class="{TD_CART_CLASS}"><!-- BEGIN: quanEnabled -->
          <input name="quan[{VAL_PRODUCT_KEY}]" type="text" value="{VAL_QUANTITY}" size="2" class="textbox" style="text-align:center;" {QUAN_DISABLED} />
          <!-- END: quanEnabled -->
          <!-- BEGIN: quanDisabled -->
          <input name="quan[{VAL_PRODUCT_KEY}]" type="text" value="{VAL_QUANTITY}" size="2" class="textboxDisabled" style="text-align:center;" disabled="disabled" />
          <input name="quan[{VAL_PRODUCT_KEY}]" type="hidden" value="{VAL_QUANTITY}" />
          <!-- END: quanDisabled -->
        </td>
        <td width="80" align="center" valign="middle" class="{TD_CART_CLASS}">{VAL_LINE_PRICE}</td>
        <td align="center" valign="middle" class="{TD_CART_CLASS}"><a href="index.php?_g=co&amp;_a={VAL_CURRENT_STEP}&amp;remove={VAL_PRODUCT_KEY}"><img src="skins/{VAL_SKIN}/styleImages/icons/cart_delete.gif" alt="{LANG_DELETE}" width="16" height="16" border="0" title="{LANG_DELETE}" /></a></td>
      </tr>
      <!-- BEGIN: stock_warn -->
      <tr>
        <td align="center" class="{TD_CART_CLASS}">&nbsp;</td>
        <td colspan="7" align="left" class="{TD_CART_CLASS}"><span class="txtStockWarn">{VAL_STOCK_WARN}</span></td>
      </tr>
      <!-- END: stock_warn -->
      <!-- END: repeat_cart_contents -->
	</table>
	<table width="100%" border="0" cellpadding="3" cellspacing="0" id="cartLower">
      <tr>
        <td rowspan="4" align="left" valign="top">
        <!-- BEGIN: enter_coupon_code -->
        <div class="couponRow">
        	<strong>{LANG_GOT_CODE}</strong>
        </div>
        <div class="couponRow">
        	{LANG_ENTER_CODE}<input name="coupon" type="text" class="textbox noFloat" style="width: 100px; margin-left:10px;" maxlength="25" />
        </div>
        <!-- END: enter_coupon_code -->
        <!-- BEGIN: coupon_code_result -->
        <div class="couponRow">
            {LANG_CODE_RESULT}<!-- BEGIN: remove --><a href="{VAL_CURRENT_PAGE}&amp;remCode={VAL_OLD_CODE}" class="button" style="margin-left:10px;">{LANG_CODE_REMOVE}</a><!-- END: remove -->
        </div>
        <!-- END: coupon_code_result -->
        </td>
        <td colspan="6" align="right" class="cartSummary">{LANG_DISCOUNT}</td>
        <td width="80" align="right" class="cartSummary">{VAL_DISCOUNT}</td>
      </tr>
      <tr>
      	<td colspan="6" align="right" class="cartSummary">{LANG_SUBTOTAL}</td>
        <td width="80" align="right" class="cartSummary">{VAL_SUBTOTAL}</td>
      </tr>
      <tr>
      	<td colspan="6" align="right" class="cartSummary">{LANG_BASKET_WEIGHT}</td>
        <td width="80" align="right" class="cartSummary">{VAL_BASKET_WEIGHT}</td>
      </tr>
      <tr>
        <td colspan="6" align="right" class="cartSummary">{LANG_SHIPPING}</td>
        <td width="80" align="right" class="cartSummary">{VAL_SHIPPING}</td>
      </tr>
      <tr>
        <td colspan="4" align="left" class="cartSummary"> {VAL_TAX_REG} </td>
        <td colspan="3" align="right" class="cartSummary">{LANG_TAX}</td>
        <td width="80" align="right" class="cartSummary">{VAL_TAX}</td>
      </tr>
      <!-- BEGIN: repeat_more_taxes -->
      <tr>
        <td colspan="7" align="right" class="cartSummary">{LANG_TAX}</td>
        <td width="80" align="right" class="cartSummary">{VAL_TAX}</td>
      </tr>
      <!-- END: repeat_more_taxes -->
      <tr>
        <td colspan="7" align="right" class="cartSummary"><strong>{LANG_CART_TOTAL}</strong></td>
        <td width="80" align="right" class="cartSummary"><strong>{VAL_CART_TOTAL}</strong></td>
      </tr>
    </table>
    <div class="clearfix" style="margin-top:25px;">
      <div style="float: left; text-align:left;"><a href="javascript:submitDoc('cart');" class="button">{LANG_UPDATE_CART}</a> {LANG_UPDATE_CART_DESC}</div>
        <div style="float:right; text-align: right;"><a href="{CONT_VAL}" class="button">{LANG_CHECKOUT_BTN}</a></div>
    </div>
  </form>
</div>
  <!-- BEGIN: alt_checkout -->
  <div class="topTitle"></div>
  <h1 class="txtContentTitle">Alternatively, you can checkout using...</h1>
  <div class="boxContent">
  <!-- BEGIN: custom_warn -->
  <div class="typError">{LANG_CUSTOM_WARN}</div>
  <!-- END: custom_warn -->
  <div style="text-align:right">
  <!-- BEGIN: loop_button -->
  {IMG_CHECKOUT_ALT}<br />
  <!-- END: loop_button -->
  </div>
  <!-- END: alt_checkout -->
  <!-- END: cart_true -->
  </div>
<!-- END: view_cart -->
