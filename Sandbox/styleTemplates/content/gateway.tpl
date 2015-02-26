<!-- BEGIN: gateway -->
<div class="topTitle"></div>
<h1 class="txtContentTitle">{LANG_PAYMENT}</h1>
<div class="boxContent">
    <div class="cartProgress">
        <span><img src="skins/Sandbox/styleImages/steps/stepShoppingCart.gif" alt="Shopping Cart" width="350" height="26" /></span>
        <span><img src="skins/Sandbox/styleImages/steps/stepAddress.gif" alt="Address" width="350" height="26" /></span>
        <span class="txtcartProgressCurrent"><img src="skins/Sandbox/styleImages/steps/stepPayment.gif" alt="Payment" width="350" height="26" /></span>
        <span><img src="skins/Sandbox/styleImages/steps/stepComplete.gif" alt="Complete" width="350" height="26" /></span>
    </div>
	<!-- BEGIN: cart_false -->
	<div class="typError">{LANG_CART_EMPTY}</div>
	<!-- END: cart_false -->
	<!-- BEGIN: cart_true -->
	
	<form action="{VAL_FORM_ACTION}" method="{VAL_FORM_METHOD}" name="gateway" target="{VAL_TARGET}">
		
		<!-- BEGIN: choose_gate -->
		
		<div class="typInfo">{LANG_PAYMENT_SUMMARY}</div>
		
		<div class="typInfo">{LANG_CHOOSE_GATEWAY}</div>
		
		<table width="150" border="0" align="center" cellspacing="0" cellpadding="3">
			<!-- BEGIN: gateways_true -->
			<tr>
				<td class="{TD_CART_CLASS}"><strong>{VAL_GATEWAY_DESC}</strong></td>
				<td width="50" align="center" class="{TD_CART_CLASS}">
				<input name="gateway" type="radio" value="{VAL_GATEWAY_FOLDER}" {VAL_CHECKED} />
				</td>
			</tr>
			<!-- END: gateways_true -->
			<tr>
				<td colspan="2" align="center" style="padding-top:15px;">{LANG_COMMENTS}</td>
			</tr>
			<tr align="center">
			  <td colspan="2"><textarea name="customer_comments" cols="65" rows="4" class="textbox noFloat">{VAL_CUSTOMER_COMMENTS}</textarea></td>
			</tr>
			<!-- BEGIN: gateways_false -->
			<tr>
				<td>{LANG_GATEWAYS_FALSE}</td>
			</tr>
			<!-- END: gateways_false -->
		</table>
		<!-- END: choose_gate -->
		
		<!-- BEGIN: transfer -->
			
			{FORM_PARAMETERS}
			<!-- BEGIN: auto_submit-->
			<div style="text-align: center;">
				<p>{LANG_TRANSFERRING}</p>
				<p><img src="skins/{VAL_SKIN}/styleImages/progress.gif"  alt="" title="" onload="submitDoc('gateway')" /></p>
			</div>
			<!-- END: auto_submit-->
			<!-- BEGIN: manual_submit-->
			<p align="left">{LANG_FORM_TITLE}</p>
			{FORM_TEMPLATE}
			<!-- END: manual_submit-->
			
		<!-- END: transfer -->
		<p style="text-align: center; margin-top:15px;">
        	<a href="javascript:submitDoc('gateway');" class="button">{LANG_CHECKOUT_BTN}</a>
        </p>
		
	</form>
	
		<!-- BEGIN: affiliate_code -->
		{VAL_AFFILIATE_TRACK_HTML}
		<!-- END: affiliate_code -->
	
	<!-- END: cart_true -->
</div>
<!-- END: gateway -->