<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>
<%@include file="/WEB-INF/jsp/sbg/common/include/sbgHeader.jsp"%>
<%@include file="/WEB-INF/jsp/sbg/CIB/common/CIBAccoladePublicationYear.jsp"%>

<%-- initialize component & results --%>
<templating:initComponent/>
<templating:initRequestContext var="rc" />
<sbg-templating:getAccoladeData var="results" />

<templating:contentItem result="content"/>

	<div class="std_bank_comp_search_results clearfix">
		<div class="comp_body clearfix">
							
				
				<div class="pdfContent">
					<c:set var="oldPublication" value="" />
					<c:set var="oldLetter" value="" />
				
					<c:set var="numOfItems" value="${fn:length(results)}"/>
					<c:set var="itemsPerPage"  value="10" />
					<c:set var="numOfItemsProcessed"  value="0" />		
					<c:forEach items="${results}" var="entry" varStatus="status">
						<c:set var="modulus"  value="${numOfItemsProcessed % itemsPerPage}" />
						<c:if test="${numOfItemsProcessed == 0 || modulus == 0}"> 
							<div class="comp_row slide clearfix">
						</c:if>
						<div class="bit-100">
							<h6>${entry.key}</h6>
							
							
								<div class="comp_box clearfix">
									<c:set var="values" value="${entry.value}" />
									
									<c:forEach items="${values}" var="content">
										<c:set var="itemId" value="${content.system.id}" />
										<%
											AccoladePublicationYear accoladeYear = new AccoladePublicationYear();
											accoladeYear.setOid(pageContext.getAttribute("itemId").toString());
											accoladeYear.setSeparator(";");
											accoladeYear.setLimitYear(2012);
											String years = accoladeYear.getYear();
											pageContext.setAttribute("pubYears",years);
										%>
										<%if(years.length() > 0){%>
											<templating:textInlineEdit oid="${content.system.id}" attributexmlname="TITLE">
												<p class="clearfix"><span>${content.title}(${pubYears})</span></p>
											</templating:textInlineEdit>
										<%}%>
									</c:forEach>					
								</div>
							
						</div>
						<c:set var="numOfItemsProcessed" value="${numOfItemsProcessed+1}"/>
						<c:set var="modulus"  value="${numOfItemsProcessed % itemsPerPage}" />
						<c:if test="${numOfItemsProcessed == numOfItems || modulus == 0}"> 
							</div>
						</c:if>
					</c:forEach>
				</div>
				
			
		</div>	
		<div class="comp_footer clearfix">
			<ul class="std_bank_comp_pagination clearfix">
			</ul>
			<a href="" class="pageination_next">Next <i class="std_bank_icon_arrow_forward_grey"></i></a>
		</div>
	</div>
			
	
