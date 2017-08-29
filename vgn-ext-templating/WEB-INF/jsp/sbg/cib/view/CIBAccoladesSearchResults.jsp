<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<%@include file="/WEB-INF/jsp/sbg/common/include/sbgHeader.jsp"%>
<%@ page import="com.vignette.ext.templating.util.PageUtil" %>
<%@ page import="com.vignette.ext.templating.util.RequestContext" %>
<templating:initComponent/>
<templating:initRequestContext var="rc"/>

<!--<sbg-templating:getNewsSearch var="searchList" />-->

<%@include file="/WEB-INF/jsp/sbg/CIB/common/CIBAccoladesSearchEngine.jsp"%>
<%
	RequestContext rc = PageUtil.getCurrentRequestContext(pageContext);
	String siteName = rc.getCurrentSite().getData().getName();
	List ciList = searchForItems(request, siteName, false,"SBG-ACCOLADES","PUBLICATION-REL-PARENT-ID");
	
	pageContext.setAttribute("sector",request.getParameter("sectorValue"));
	pageContext.setAttribute("segment",request.getParameter("segment"));
	pageContext.setAttribute("numOfResults",ciList.size());
	pageContext.setAttribute("searchList",ciList);
	pageContext.setAttribute("keyWord",request.getParameter("Keyword"));
	pageContext.setAttribute("year",request.getParameter("yearValue"));
	pageContext.setAttribute("country",request.getParameter("countryValue"));
%>

<div class="std_bank_comp_static_content">
	<div class="comp_header clearfix"><h5>Accolades Search results</h5></div>
</div>
 
	<p><strong>${numOfResults} results 
	<c:if test="${fn:length(keyWord) > 0}"> 
		for "${keyWord}"
	</c:if>
	<c:if test="${fn:length(year) > 0}"> 
		in ${year}
	</c:if>
	<c:if test="${fn:length(country) > 0}"> 
		in ${country}
	</c:if>
	<c:if test="${fn:length(sector) > 0}"> 
		in ${sector}
	</c:if>
	<c:if test="${fn:length(segment) > 0}"> 
		in ${segment}
	</c:if>
	</strong></p>


<c:if test="${numOfResults > 0}"> 				
	<div class="std_bank_comp_search_results clearfix">
		<div class="comp_body clearfix">
			<c:set var="numOfItems" value="${numOfResults}"/>
			<c:set var="itemsPerPage"  value="5" />
			<c:set var="numOfItemsProcessed"  value="0" />
			<c:forEach items="${searchList}" var="content" varStatus="status">
				<c:set var="modulus"  value="${numOfItemsProcessed % itemsPerPage}" />
				<c:choose>
					<c:when test="${fn:length(content.title) > 0}">					
						<c:if test="${numOfItemsProcessed == 0 || modulus == 0}"> 
							<div class="comp_row slide clearfix">
						</c:if>
						<templating:contentLink var="linkUrl" oid="${content.system.id}"/>
						<sbg-templating:getAccoladePublicationYears var="pubYears" oid="${content.system.id}" order="ascending" separator=";" />
						<div class="bit-100">
							<div class="pdfContent">
								<h6>${content.publication}</h6>
								<span>${pubYears} </span>
								<p>
									${content.title}
								</p>
								</div>
						</div>
						<c:set var="numOfItemsProcessed" value="${numOfItemsProcessed+1}"/>
						<c:set var="modulus"  value="${numOfItemsProcessed % itemsPerPage}" />
						<c:if test="${numOfItemsProcessed == numOfItems || modulus == 0}"> 
							</div>
						</c:if>
					</c:when>
					<c:otherwise>
						<c:set var="numOfItems" value="${numOfItems-1}"/>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
		<div class="comp_footer clearfix">
			<ul class="std_bank_comp_pagination clearfix">
			</ul>
			<a href="" class="pageination_next">Next <i class="std_bank_icon_arrow_forward_grey"></i></a>
		</div>
	</div>
</c:if>

<c:set var="searchTerm" value="" />
<c:if test="${fn:length(keyWord) > 0}"> 
		<c:set var="searchTerm" value="Accolades:${keyWord}" />
</c:if>


<script>
//****PLEASE DO NOT REMOVE****
//DTM insert search values into DL
	dataLayer.numSearchResults = ${numOfResults};
	dataLayer.formStatus = "complete";
	dataLayer.searchTerm = "${searchTerm}";	
	dataLayer.formName = "accolades search form";
</script>
