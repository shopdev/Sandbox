<!-- BEGIN: session -->
  <!-- BEGIN: session_false -->
	<a href="index.php?_a=login&amp;redir={VAL_SELF}" class="txtSiteDocs">{LANG_LOGIN}</a>
    <a href="index.php?_g=co&amp;_a=reg&amp;redir={VAL_SELF}" class="txtSiteDocs">{LANG_REGISTER}</a>
    <span class="lastDoc"></span>
  <!-- END: session_false -->
  <!-- BEGIN: session_true -->
	<a href="index.php?_a=logout" class="txtSiteDocs">{LANG_LOGOUT}</a>
    <a href="index.php?_a=account" class="txtSiteDocs">{LANG_YOUR_ACCOUNT}</a>
    <span class="lastDoc"></span>
  <!-- END: session_true -->
<!-- END: session -->