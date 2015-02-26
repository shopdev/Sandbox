<!-- BEGIN: session_page -->
<!-- BEGIN: cart_false -->
	<div class="typError">{LANG_CART_EMPTY}</div>
<!-- END: cart_false -->
<!-- BEGIN: cart_true -->
<div class="topTitle"></div>
<span class="txtContentTitle">{LANG_LOGIN_TITLE}</span>
<div class="boxContent">
        <div class="typInfo">{LANG_LOGIN_BELOW}</div>
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
                    <input name="remember" type="checkbox" class="checkbox" value="1" {CHECKBOX_STATUS} />
                </p>
                <p>
                    <input name="submit" type="submit" value="{TXT_LOGIN}" class="button frmBtnAlign" />
                </p>
            </div>
            <div class="typPass">
                <a href="index.php?_a=forgotPass" class="txtDefault">{LANG_FORGOT_PASS}</a>
            </div>
        </form>
    </div>
    
    <div class="topTitle"></div>
    <span class="txtContentTitle">{LANG_EXPRESS_REGISTER}</span>
    <div class="boxContent">
        <div class="typInfo">{LANG_CONT_REGISTER}</div>
        <a href="index.php?_g=co&amp;_a=reg&amp;co=1" class="button">{LANG_REGISTER_BUTN}</a>
    </div>
    
    <div class="topTitle"></div>
    <span class="txtContentTitle">{LANG_CONT_SHOPPING}</span> 
    <div class="boxContent">
        <div class="typInfo">{LANG_CONT_SHOPPING_DESC}</div>
        <a href="index.php" class="button">{LANG_CONT_SHOPPING_BTN}</a>
    </div>
    <!-- END: cart_true -->
</div>
<!-- END: session_page -->