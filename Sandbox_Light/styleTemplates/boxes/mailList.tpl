<!-- BEGIN: mail_list -->
<div class="boxTitleLeft">{LANG_MAIL_LIST_TITLE}<img src="skins/Sandbox_Light/styleImages/blank.gif" alt="" class="collapsed" /></div>
<div class="boxContentLeft">
  <div class="innerBox">
    <div style="margin-bottom:5px"> {LANG_MAIL_LIST_DESC} </div>
    <!-- BEGIN: form -->
    <form action="{FORM_METHOD}" method="post">
      <input name="email" type="text" size="24" maxlength="255" class="textbox" value="{LANG_EMAIL_ADDRESS}" onclick="this.value='';" style="width:151px;" /><input type="hidden" name="act" value="mailList" /><input name="submit" type="submit" value="JOIN" class="button" />
    </form>
    <!-- END: form -->
  </div>
</div>
<!-- END: mail_list -->
