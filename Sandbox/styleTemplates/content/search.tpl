<!-- BEGIN: adv_search -->
<div class="topTitle"></div>
<h1 class="txtContentTitle">{LANG_SEARCH_TITLE}</h1>
<div class="boxContent">
<div class="typInfo">Refine your search by completing the fields below:</div>
  <form method="get" action="index.php" enctype="multipart/form-data">
  <div class="frmContainer">
  <p>
	<label for="searchStr">{LANG_SEARCH_KEYWORD}</label>
	<input type="text" class="textbox" name="searchStr" />
  </p>
  <p>
  	<label for="priceMin">{LANG_SEARCH_PRICE}</label>
	<input type="text" class="textbox noFloat" style="width: 50px;" name="priceMin" /> - 
	<input type="text" class="textbox noFloat" style="width: 50px;" name="priceMax" />
  </p>
  <p>
  	<label for="inStock">{LANG_SEARCH_INSTOCK}?</label>
	<input type="checkbox" name="inStock" value="true" class="checkbox" />
  </p>
  <p>
    <label for="category[]">{LANG_SEARCH_CATEGORY}</label>
    <select name="category[]" class="textbox" multiple="multiple" size="10">
    <!-- BEGIN: adv_search_category -->
    <option value="{OPTION_VALUE}">{OPTION_TITLE}</option>
    <!-- END: adv_search_category -->
    </select>
    <br />
    <br />
    <span class="frmAlign">{LANG_SEARCH_CATEGORY_HELP}</span>
  </p>
  <p>
  	<span class="frmAlign">
      <input type='hidden' name='_a' value='viewCat' />
      <input type="submit" class="submit" name="search" value="{LANG_SEARCH_SUBMIT}" /> <input type="reset" class="submit" value="{LANG_SEARCH_RESET}" /></div>
      </form>
    </span>
  </p>
</div>
</div>
<!-- END: adv_search -->