<!-- BEGIN: session -->
<session>
	<!-- BEGIN: session_false -->
	<language>
		<welcome>{LANG_WELCOME_GUEST}</welcome>
	</language>
	<items status="">
		<item>
			<name>{LANG_LOGIN}</name>
			<link>index.php?_a=login&amp;redir={VAL_SELF}</link>
		</item>
		<item>
			<name>{LANG_REGISTER}</name>
			<link>index.php?_g=co&amp;_a=reg&amp;redir={VAL_SELF}</link>
		</item>
	</items>
  	<!-- END: session_false -->
  	<!-- BEGIN: session_true -->
	<language>
		<welcome>{LANG_WELCOME_BACK}</welcome>
		<user_name>{TXT_USERNAME}</user_name>
	</language>
	<items status="logged_in">
		<item>
			<name>{LANG_LOGOUT}</name>
			<link>index.php?_a=logout</link>
		</item>
		<item>
			<name>{LANG_YOUR_ACCOUNT}</name>
			<link>index.php?_a=account</link>
		</item>
	</items>
  	<!-- END: session_true -->
</session>
<!-- END: session -->