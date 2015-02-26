<!-- BEGIN: view_order -->
<div class="topTitle"></div>
<h1 class="txtContentTitle">{LANG_YOUR_VIEW_ORDER}</h1>
<div class="boxContent">
  <!-- BEGIN: session_true -->
  <div>
    <!-- BEGIN: order_true -->
    <div class="typInfo">{LANG_ORDER_LIST}</div>
    <!-- BEGIN: make_payment -->
    <div class="typAlert">{LANG_MAKE_PAYMENT}</div>
    <!-- END: end_payment -->
    <table border="0" width="100%" cellspacing="0" cellpadding="0" class="cartContent" id="viewOrder">
      <tr>
        <td colspan="2" class="tdcartTitle">{LANG_CUSTOMER_INFO}</td>
      </tr>
      <tr>
        <td align="left" valign="top"><strong>{LANG_INVOICE_ADDRESS}</strong>
          <div style="padding: 10px;"> {VAL_INVOICE_NAME}<br/>
            {VAL_INVOICE_ADD_1}<br/>
            {VAL_INVOICE_ADD_2}<br/>
            {VAL_INVOICE_TOWN}, {VAL_INVOICE_COUNTY}<br/>
            {VAL_INVOICE_POSTCODE}<br/>
            {VAL_INVOICE_COUNTRY}</div></td>
        <td align="left" valign="top"><strong>{LANG_DELIVERY_ADDRESS}</strong>
          <div style="padding: 10px;">{VAL_DELIVERY_NAME}<br/>
            {VAL_DELIVERY_ADD_1}<br/>
            {VAL_DELIVERY_ADD_2}<br/>
            {VAL_DELIVERY_TOWN}, {VAL_DELIVERY_COUNTY}<br/>
            {VAL_DELIVERY_POSTCODE}<br/>
            {VAL_DELIVERY_COUNTRY}</div></td>
      </tr>
      <tr>
        <td colspan="2" align="left" valign="top"><strong>{LANG_CUSTOMER_COMMENTS}</strong>
          <div style="padding: 10px;">&quot;{VAL_CUSTOMER_COMMENTS}&quot;</div></td>
      </tr>
    </table>
    <table border="0" width="100%" cellspacing="0" cellpadding="0" class="cartContent" id="viewOrderLower" style="margin-bottom:0px;">
      <tr>
        <td colspan="2" class="tdcartTitle">{LANG_ORDER_SUMMARY}</td>
      </tr>
      <tr>
        <td colspan="2" align="left" valign="bottom" style="padding:0px;"><table width="100%" border="0" cellpadding="0" cellspacing="0" style="margin-bottom:5px;">
            <tr>
              <td colspan="5" style="padding:0px;"><table border="0" cellpadding="0" cellspacing="0" class="cartContent" id="viewOrderInner" style="margin:15px; width:567px;">
                  <tr>
                    <td class="tdcartTitle">{LANG_PRODUCT}</td>
                    <td class="tdcartTitle">{LANG_PRODUCT_CODE}</td>
                    <td class="tdcartTitle">{LANG_QUANTITY}</td>
                    <td align="right" class="tdcartTitle">{LANG_PRICE}</td>
                  </tr>
                  <!-- BEGIN: repeat_products -->
                  <tr>
                    <td class="tdcartOdd"> {VAL_PRODUCT}<br />
                      {VAL_PRODUCT_OPTS}
                      <!-- BEGIN: digital_link -->
                      <br />
                      <br />
                      <a href="{VAL_DOWNLOAD_LINK}" class="button">{LANG_DOWNLOAD_LINK}</a>
                      <!-- END: digital_link -->
                    </td>
                    <td class="tdcartOdd">{VAL_IND_PROD_CODE}</td>
                    <td class="tdcartOdd">{VAL_IND_QUANTITY}</td>
                    <td align="right" class="tdcartOdd">{VAL_IND_PRICE}</td>
                  </tr>
                  <!-- END: repeat_products -->
                </table></td>
            </tr>
            <tr>
              <td rowspan="5" align="left" valign="bottom" class="btmSubNav" style="padding: 0px;"><table border="0" cellspacing="0" cellpadding="3">
                  <tr>
                    <td>{LANG_ORDER_STATUS}</td>
                    <td>{VAL_ORDER_STATUS}</td>
                  </tr>
                  <tr>
                    <td>{LANG_ORDER_TIME}</td>
                    <td>{VAL_ORDER_TIME}</td>
                  </tr>
                  <tr>
                    <td>{LANG_GATEWAY}</td>
                    <td>{VAL_GATEWAY}</td>
                  </tr>
                  <tr>
                    <td>{LANG_SHIP_METHOD}</td>
                    <td>{VAL_SHIP_METHOD}</td>
                  </tr>
                  <tr>
                    <td>&nbsp;</td>
                    <td><a href="{VAL_SHIP_TRACK}" class="txtLink" target="_blank">{LANG_SHIP_TRACK}</a></td>
                  </tr>
                </table></td>
              <td rowspan="5" class="btmSubNav">&nbsp;</td>
              <td class="btmSubNav"><span>{LANG_SUBTOTAL}</span></td>
              <td align="right" class="btmSubNav"><span>{VAL_SUBTOTAL}</span> </td>
            </tr>
            <tr>
              <td>{LANG_DISCOUNT}</td>
              <td align="right">{VAL_DISCOUNT}</td>
            </tr>
            <tr>
              <td><span>{LANG_TOTAL_TAX}</span></td>
              <td align="right"> {VAL_TOTAL_TAX} </td>
            </tr>
            <tr>
              <td><span>{LANG_TOTAL_SHIP}</span></td>
              <td align="right"> {VAL_TOTAL_SHIP} </td>
            </tr>
            <tr>
              <td><strong>{LANG_GRAND_TOTAL}</strong></td>
              <td align="right" class="btmSubNav"><strong>{VAL_GRAND_TOTAL}</strong></td>
            </tr>
          </table></td>
      </tr>
    </table>
    <!-- END: order_true -->
    <!-- BEGIN: order_false -->
    <div class="typError">{LANG_NO_ORDERS}</div>
    <!-- END: order_false -->
  </div>
  <!-- END: session_true -->
  <!-- BEGIN: session_false -->
  <div class="typError">{LANG_LOGIN_REQUIRED}</div>
  <!-- END: session_false -->
</div>
<!-- END: view_order -->
