<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>
<%@include file="/WEB-INF/jsp/sbg/common/include/sbgHeader.jsp"%>

<%-- initialize component & results --%>
<templating:initComponent/>
<templating:initRequestContext var="rc" />
<c:set var="currentSite" value="${rc.currentSiteBean}" />
<templating:contentLink var="homeURL" oid="${currentSite.homeChannel.system.id}" />


<c:if test="${not empty component.results}">

<div class="std_bank_comp_banner">
	<div class="comp_body">
		<c:forEach items="${component.results}" var="bannerContetItem">
			<c:set var="item" value="${bannerContetItem}"/>
			<div class="banner_slider">
				<%@include file="/WEB-INF/jsp/sbg/common/include/sbgWebLinkManagement.jsp"%>
				<c:set var="bannerPath" value="/standimg/${bannerContetItem.mediaItem.SOURCEPATH.placementPath}"/>	
				<a href="${itemURL}" data-id="link_banner" data-text="Hero Banner | ${bannerContetItem.title}"><img src="${bannerPath}" alt="" style="display: block;"></a>
			</div>
		</c:forEach>
	</div>
	<div class="comp_footer">
		<ul class="std_bank_comp_dot_navigation"></ul>
	</div>
</div>
	
</c:if>
