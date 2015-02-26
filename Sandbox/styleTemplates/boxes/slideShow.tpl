<!-- BEGIN: slide_show -->
	<ul class="showCase clearfix" style="position:relative;">
		<!-- BEGIN: li -->
			<li class="showCaseProduct">
				<div class="showCaseSaleImage span-6">
					<table cellspacing="0" cellpadding="0" border="0" style="height:100%;">
						<tr>
							<td height="100%" align="center" valign="middle">
								<a href="index.php?_a=viewProd&amp;productId={DATA.productId}" title="{DATA.name}">
									<img src="skins/{SKIN}/php/getImg.php?src={DATA.image}&amp;width=120&amp;height=120" alt="{DATA.name}" style="border:none;" />
								</a>
							</td>
						</tr>
					</table>
				</div>
				<div class="showCaseDetails span-15">
					<div class="showCaseTitle">
						<a href="index.php?_a=viewProd&amp;productId={DATA.productId}" class="prodLink">
							{DATA.name}
						</a>
					</div>
					<div class="saleDesc">
						<p>{DATA.description}</p>
					</div>
					<div class="saleTag">
						<span>Save: {DATA.saving}</span>
					</div>
				</div>
			</li>
		<!-- END: li -->
	</ul>
<!-- END: slide_show -->