<!-- BEGIN: newsletter -->

<div class="topTitle"></div>
<h1 class="txtContentTitle">{LANG_NEWSLETTER_TITLE}</h1>
<div class="boxContent">
  <!-- BEGIN: session_true -->
  <div class="typInfo">{LANG_NEWSLETTER_DESC}</div>
  <form action="index.php?_a=newsletter" target="_self" method="post">
    <div class="frmContainer">
      <p>
        <label for="optIn1st">{TXT_SUBSCRIBED}</label>
        {LANG_YES}
        <input type="radio" name="optIn1st" value="1" {STATE_SUBSCRIBED_YES}  />
        {LANG_NO}
        <input type="radio" name="optIn1st" value="0" {STATE_SUBSCRIBED_NO} />
      </p>
      <p>
        <label for="htmlEmail">{TXT_EMAIL_FORMAT}</label>
        {LANG_TEXT}
        <input type="radio" name="htmlEmail" value="0" {STATE_HTML_TEXT} />
        {LANG_HTML}
        <input type="radio" name="htmlEmail" value="1" {STATE_HTML_HTML} />
      </p>
      <p>
        <input name="submit" type="submit" value="{TXT_SUBMIT}" class="button frmBtnAlign" />
      </p>
    </div>
  </form>
  <!-- END: session_true -->
  <!-- BEGIN: session_false -->
  <div class="typError">{LANG_LOGIN_REQUIRED}</div>
  <!-- END: session_false -->
</div>
<!-- END: newsletter -->
