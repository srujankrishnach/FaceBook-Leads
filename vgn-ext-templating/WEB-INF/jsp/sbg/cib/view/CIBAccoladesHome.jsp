<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>
<%@include file="/WEB-INF/jsp/sbg/common/include/sbgHeader.jsp"%>

<%-- initialize component & results --%>
<templating:initComponent/>
<templating:initRequestContext var="rc" />
<c:set var="currentSite" value="${rc.currentSiteBean}" />
<templating:contentLink var="homeURL" oid="${currentSite.homeChannel.system.id}" />

<c:if test="${not empty component.results}">

<c:set var="friendlyName" value="Accolades"/>
<div class="col-md-3">
	<div class="std_bank_comp_accolades">

		<c:set var="numOfItems" value="${fn:length(component.results)}"/>
		<c:set var="itemsPerPage"  value="2" />
		<c:set var="numOfItemsProcessed"  value="0" />

		<div class="comp_header clearfix">
			<h1>${not empty component.title ? component.title: friendlyName}</h1>
			<ul class="std_bank_comp_dot_navigation"></ul>
		</div>

		<div class="comp_body clearfix">
			<c:forEach items="${component.results}" var="contetItem">
				<%@include file="/WEB-INF/jsp/sbg/common/include/sbgWebLinkManagement.jsp"%>	
				<c:set var="modulus"  value="${numOfItemsProcessed % itemsPerPage}" />
					<c:if test="${numOfItemsProcessed == 0 || modulus == 0}"> 
					
							<div class="comp_row slide clearfix">
							
						</c:if>
						<div class="bit-100 clearfix">
						
							<div class="bit-30">
								<a href="/CIB/Accolades/" data-id="link_content_Accolades" data-text="${contetItem.title}"><img src="/standimg/CIB/Resources/img/accolades.png" alt=""></a>
							</div>
							<div class="bit-70">
								<h6><a href="/CIB/Accolades/" data-id="link_content_Accolades" data-text="${contetItem.title}">${contetItem.title}</a></h6>
								
							</div>
						</div>

					<c:set var="numOfItemsProcessed" value="${numOfItemsProcessed+1}"/>
						<c:set var="modulus"  value="${numOfItemsProcessed % itemsPerPage}" />
						<c:if test="${numOfItemsProcessed == numOfItems || modulus == 0}"> 
							</div>
						</c:if>
			</c:forEach>
		</div>

		<div class="comp_footer">
			<a href="/CIB/Accolades/" data-id="link_content_accolades" data-text="more accolades button click" class="std_bank_comp_button blue"> <span> More </span> <i class="std_bank_icon_arrow_forward_white "></i></a>
		</div>
	</div>
</div>
</c:if>
