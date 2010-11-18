[#ftl]
[#import "spring.ftl" as spring]
[#import "blueprintmacros.ftl" as mifos]
[#import "macros.ftl" as mifosmacros]
[@mifos.header "title" /]
[@mifos.topNavigationNoSecurity currentTab="Admin" /]

 <script type="text/javascript">
 function addOption(root, text, value)
{
  var newOpt = new Option(text, value);
  var rootLength = root.length;
  root.options[rootLength] = newOpt;
}

function deleteOption(root, index)
{
  var rootLength= root.length;
  if(rootLength>0)
  {
    root.options[index] = null;
  }
}

function moveOptions(root, destination)
{

  var rootLength= root.length;
  var rootText = new Array();
  var rootValues = new Array();
  var rootCount = 0;

  var i;
  for(i=rootLength-1; i>=0; i--)
  {
    if(root.options[i].selected)
    {
      rootText[rootCount] = root.options[i].text;
      rootValues[rootCount] = root.options[i].value;
      deleteOption(root, i);
      rootCount++;
    }
  }
  for(i=rootCount-1; i>=0; i--)
  {
    addOption(destination, rootText[i], rootValues[i]);
  }
}

function selectAllOptions(outSel)
{
	if(null != outSel) {
	 	var selLength =outSel.length;
		outSel.multiple=true;
		for(i=selLength-1; i>=0; i--)
		{
			outSel.options[i].selected=true;
		}
	}
}
</script>

  <div class="container">&nbsp;
  <!--  Main Content Begins-->
  <span id="page.id" title="createProductsMix" />
  <div class="content definePageMargin">
    <div class="borders margin20lefttop width90prc">
      <div class="borderbtm width100prc height25px">
        <p class="span-17 timelineboldorange arrowIMG  padding20left" style="width:50%">[@spring.message "manageProducts.defineProductmix.productmixinformation"/]</p>
        <p class="span-3 timelineboldorange arrowIMG1 last padding20left10right" style="float:right">[@spring.message "reviewAndSubmit"/]</p>
      </div>
      <div class="subcontent padding10topbottom">
          <p class="font11pt"><span class="fontBold">[@spring.message "manageProducts.defineProductmix.addanewproductmix"/]</span>&nbsp;-&nbsp;<span class="orangeheading">[@spring.message "manageProducts.defineProductmix.enterproductmixinformation"/]</span></p>
          <div class="font9pt">[@spring.message "manageProducts.defineProductmix.completethefieldsbelow.ThenclickPreview.ClickCanceltoreturntoAdminwithoutsubmittinginformation"/] </div>
          <div class="font9pt"><span class="red">* </span>[@spring.message "manageProducts.defineProductmix.fieldsmarkedwithanasteriskarerequired"/] </div>
          [@mifos.showAllErrors "formBean.*"/]
          <p class="fontBold margin20topbottom">[@spring.message "manageProducts.defineProductmix.productmixdetails"/] </p>
        <form name="productsmixform" id="productsmixform" method="post" action="defineProductMix.ftl">
        	<div class="prepend-3  span-21 last">
        		<div class="span-20 ">
	        		<span class="span-5 rightAlign">
	        			<span class="red">* </span>[@spring.message "manageProducts.defineProductmix.producttype"/]&nbsp;:&nbsp;
	        		</span>
        			<span class="span-5">
	   					[@spring.bind "formBean.productTypeId" /]
					    <select id="${spring.status.expression}" name="${spring.status.expression}" onchange="return productsmixform.submit();">
					        <option value="" [@spring.checkSelected ""/]>${springMacroRequestContext.getMessage("--Select--")}</option>
					        [#if formBean.productTypeOptions?is_hash]
					            [#list formBean.productTypeOptions?keys as value]
					            <option value="${value?html}"[@spring.checkSelected value/]>${springMacroRequestContext.getMessage(formBean.productTypeOptions[value]?html)}</option>
					            [/#list]
					        [#else]
					            [#list formBean.productTypeOptions as value]
					            <option value="${value?html}"[@spring.checkSelected value/]>${springMacroRequestContext.getMessage(value?html)}</option>
					            [/#list]
					        [/#if]
					    </select>
				    </span>
				</div>

				<div class="span-20 ">
					<span class="span-5 rightAlign">
						<span class="red">* </span>[@spring.message "manageProducts.defineProductmix.productinstancename"/]&nbsp;:&nbsp;
					</span>
					<span class="span-7">
						[@spring.bind "formBean.productId" /]
					    <select id="${spring.status.expression}" name="${spring.status.expression}" onchange="return productsmixform.submit();">
					        <option value="" [@spring.checkSelected ""/]>${springMacroRequestContext.getMessage("--Select--")}</option>
					        [#if formBean.productNameOptions?is_hash]
					            [#list formBean.productNameOptions?keys as value]
					            <option value="${value?html}"[@spring.checkSelected value/]>${formBean.productNameOptions[value]?html}</option>
					            [/#list]
					        [#else]
					            [#list formBean.productNameOptions as value]
					            <option value="${value?html}"[@spring.checkSelected value/]>${value?html}</option>
					            [/#list]
					        [/#if]
					    </select>
				    </span>
				</div>

				<div class="span-20 last margin20topbottom">
	          		<div class="span-20">
	          			<span class="pull-3 span-8 rightAlign">[@spring.message "manageProducts.defineProductmix.removenotallowedproducts"/]&nbsp;:&nbsp;</span>
	            		<span class="span-12 ">
	                		<span class="span-9">[@spring.message "manageProducts.defineProductmix.clickonaproductintherightboxtoselect.ThenclickRemove"/]</span>
	                    	<div class="margin10topbottomrgin">
                                <span class="span-4">
                                    [@spring.formMultiSelect "formBean.notAllowed", formBean.notAllowedProductOptions, "class=listSize" /]
                                </span>
                                <span class="span-3 width80px">
                                    <br />
                                    <input class="buttn2 width70px" name="add" type="button" value="[@spring.message "add"/] >>" onclick="moveOptions(this.form.notAllowed, this.form.allowed);"/>
                                    <br /><br />
                                    <input class="buttn2 width70px" name="remove" type="button" value="<< [@spring.message "remove"/]" onclick="moveOptions(this.form.allowed, this.form.notAllowed);"/>
                                </span>
                                <span class="span-4">
                                    [@spring.formMultiSelect "formBean.allowed", formBean.allowedProductOptions, "class=listSize" /]
                                </span>
                            </div>
	               		</span>
	            	</div>
	          	</div>
				<div class="clear">&nbsp;</div>
        	</div>
        	<div class="clear">&nbsp;</div>
	        <div class="buttonsSubmitCancel" style="margin-right:20px;">
	            <input class="buttn" type="submit" id="holiday.button.preview" name="preview"  value="[@spring.message "preview"/]" onclick="selectAllOptions(this.form.notAllowed);selectAllOptions(this.form.allowed);" />
	            <input class="buttn2" type="submit" id="CANCEL" name="CANCEL" value="[@spring.message "cancel"/]"/>
	        </div>
            <!--Subcontent Ends-->
        </form>
    </div>
  </div>
  <!--Main Content Ends-->
  <div class="footer">&nbsp;</div>
</div>
<!--Container Ends-->
[@mifos.footer/]