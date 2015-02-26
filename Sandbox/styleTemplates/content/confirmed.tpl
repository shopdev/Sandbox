<!-- BEGIN: confirmation -->
<h1 class="txtContentTitle">{LANG_CONFIRMATION_SCREEN}</h1>
<div class="boxContent">
	<div class="cartProgress">
        <span><img src="skins/Sandbox/styleImages/steps/stepShoppingCart.gif" alt="Shopping Cart" width="350" height="26" /></span>
        <span><img src="skins/Sandbox/styleImages/steps/stepAddress.gif" alt="Address" width="350" height="26" /></span>
        <span><img src="skins/Sandbox/styleImages/steps/stepPayment.gif" alt="Payment" width="350" height="26" /></span>
        <span class="txtcartProgressCurrent"><img src="skins/Sandbox/styleImages/steps/stepComplete.gif" alt="Complete" width="350" height="26" /></span>
    </div>
    <!-- BEGIN: order_success -->
    <div class="typConfirm">{LANG_ORDER_SUCCESSFUL}</div>
    <!-- END: order_success -->
    <!-- BEGIN: order_processing -->
    <div class="typInfo">{LANG_ORDER_PROCESSING}</div>
    <!-- END: order_processing -->
    <!-- BEGIN: order_failed -->
    <div class="typError">{LANG_ORDER_FAILED}</div>
    <div class="typInfo">{LANG_ORDER_RETRY}</div>
    <br />
    <a href="index.php?_g=co&amp;_a=step3&amp;cart_order_id={VAL_CART_ORDER_ID}"  class="txtCheckout">{LANG_RETRY_BUTTON}</a>
    <!-- END: order_failed -->
</div>
<!-- END: confirmation -->