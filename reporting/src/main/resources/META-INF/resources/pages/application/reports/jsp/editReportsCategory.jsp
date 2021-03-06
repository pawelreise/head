<%-- 
Copyright (c) 2005-2011 Grameen Foundation USA
All rights reserved.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
implied. See the License for the specific language governing
permissions and limitations under the License.

See also http://www.apache.org/licenses/LICENSE-2.0.html for an
explanation of the license and how it is applied.
--%>

<%@ taglib uri="/tags/struts-tiles" prefix="tiles"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="/tags/mifos-html" prefix="mifos"%>
<%@ taglib uri="/tags/struts-html-el" prefix="html-el"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<tiles:insert definition=".view">
  <tiles:put name="body" type="string">
  <span id="page.id" title="editReportsCategory"></span>  
  
  	<script type="text/javascript">
	function goToCancelPage(form){
		form.action = "reportsCategoryAction.do?method=viewReportsCategory";
		form.submit();
  	}
    </script>
		<html-el:form method="post"
			action="/reportsCategoryAction.do?method=editPreview"
			 enctype="multipart/form-data">
			<table width="95%" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td class="bluetablehead05"><span class="fontnormal8pt">
					<html-el:link href="AdminAction.do?method=load">
						<mifos:mifoslabel name="product.admin" bundle="ProductDefUIResources" />
					</html-el:link> / </span> 
					<span class="fontnormal8pt"><html-el:link href="reportsCategoryAction.do?method=viewReportsCategory">
						<mifos:mifoslabel name="reportsCategory.linkViewReportCategory"	bundle="reportsCategoryUIResources" />
					</html-el:link> / </span> 
					 
					<span class="fontnormal8ptbold">${reportsCategoryActionForm.categoryName}</span></td>
				</tr>
			</table>
			<table width="95%" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td align="left" valign="top" class="paddingL15T15">
					<table width="95%" border="0" cellpadding="3" cellspacing="0">
						<tr>
						  <td class="headingorange"><span class="heading">${reportsCategoryActionForm.categoryName} - </span><span class="headingorange">
							<mifos:mifoslabel name="reportsCategory.editInformation" bundle="reportsCategoryUIResources" /></span>
						  </td>
                        </tr>
                        <tr>
                          <td class="fontnormal"><mifos:mifoslabel name="reportsCategory.editReportCategoryTips" bundle="reportsCategoryUIResources" /><span class="mandatorytext">
                          <font color="#FF0000"><br> *</font></span><mifos:mifoslabel name="reportsCategory.editReportCategoryTipsWithAsterisk" bundle="reportsCategoryUIResources" /></td>
                        </tr>
					</table>
					</td>
				</tr>
			</table>

           <table width="95%" border="0" cellpadding="0"
						cellspacing="0" class="">
						<tr>
							<td width="90%" height="24" align="left" valign="top"
								class="paddingleftCreates">
							<table width="98%" border="0" cellspacing="0" cellpadding="3">
								<tr>
								    <td class="fontnormalbold"> 
								       <mifos:mifoslabel name="reportsCategory.detail" />
								    </td>
								</tr>
								<tr>
									<td>
										<font class="fontnormalRedBold">
											<html-el:errors	bundle="reportsCategoryUIResources" />	
										</font>
									</td>
								</tr>
							</table>
							<br>
							<table width="90%" border="0" cellspacing="0" cellpadding="3">
								<tr class="fontnormal">
									<td align="right">
									    <font color="#ff0000">*</font>
									    <mifos:mifoslabel
										name="reportsCategory.name" />:</td>
									<td>
										<html-el:text styleId="111" property="categoryName" maxlength="200"/>
									</td>
								</tr>
						  </table><br>	
						 <table width="95%" border="0" cellpadding="0" cellspacing="0">
										<tr>
											<td align="center" class="blueline">
												&nbsp;
											</td>
										</tr>
						  </table><br>	
						<table width="90%" border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td align="center"><html-el:submit styleClass="buttn">
										<mifos:mifoslabel name="reportsCategory.preview"/>
									</html-el:submit> &nbsp; <html-el:button
										onclick="goToCancelPage(this.form);" property="cancelButton" styleClass="cancelbuttn">
										<mifos:mifoslabel name="reportsCategory.cancel"/>
									</html-el:button></td>
								</tr>
						</table><br>
							</td>
						</tr>
					</table><br>

					</td>
				</tr>
			</table>
			<html:hidden property="method" value="search" />
			<html-el:hidden property="categoryId"/>
			<html-el:hidden property="currentFlowKey" value="${requestScope.currentFlowKey}" />
		</html-el:form>
	</tiles:put>
</tiles:insert>











