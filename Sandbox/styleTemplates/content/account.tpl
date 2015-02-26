<!-- BEGIN: account -->
<div class="topTitle"></div>
<h1 class="txtContentTitle">{LANG_YOUR_ACCOUNT}</h1>
<div class="boxContent">
	<!-- BEGIN: session_true -->
	<div class="acctNav acctPersonal">
    	<a href="index.php?_a=profile" class="button">{TXT_PERSONAL_INFO}</a>
    </div>
	<div class="acctNav acctOrders">
		<a href="index.php?_g=co&amp;_a=viewOrders" class="button">{TXT_ORDER_HISTORY}</a>
    </div>
    <div class="acctNav acctPass">
		<a href="index.php?_a=changePass" class="button">{TXT_CHANGE_PASSWORD}</a>
    </div>
    <div class="acctNav acctNewsletter">
		<a href="index.php?_a=newsletter" class="button">{TXT_NEWSLETTER}</a>
    </div>
    <div class="acctNav acctLogout">
		<a href="index.php?_a=logout" class="button">Logout</a>
    </div>
	<!-- END: session_true -->
	
	<!-- BEGIN: session_false -->
	<div class="typError"><a href="index.php?_a=login" title="Login">{LANG_LOGIN_REQUIRED}</a></div>
	<!-- END: session_false -->
</div>
<!-- END: account -->