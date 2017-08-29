<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>
<%@include file="/WEB-INF/jsp/sbg/common/include/sbgHeader.jsp"%>

<%-- initialize component & results --%>
<templating:initComponent/>
<templating:initRequestContext var="rc" />
<c:set var="currentSite" value="${rc.currentSiteBean}" />
<templating:contentLink var="homeURL" oid="${currentSite.homeChannel.system.id}" />


<c:if test="${not empty component.results}">

<section class="banner">

<c:forEach items="${component.results}" var="bannerContetItem">
	<c:set var="item" value="${bannerContetItem}"/>

	<div class="banner_slide">
	<%@include file="/WEB-INF/jsp/sbg/common/include/sbgWebLinkManagement.jsp"%>
		<c:set var="bannerPath" value="/standimg/${bannerContetItem.mediaItem.SOURCEPATH.placementPath}"/>
		<c:set var="emptyURL" value="#"/>			
			<img src="${bannerPath}" alt="">
			<c:if test="${itemURL ne emptyURL}">
				<div class="clearfix container">
					<a href="${itemURL}" class="std_bank_comp_button blue" data-id="link_banner" data-text="Hero Banner | ${bannerContetItem.title}">
					<span>${item.linkText}</span> <i class="std_bank_icon_arrow_forward_white "></i></a>
				</div>
			</c:if>
	</div>
</c:forEach>
	<nav class="dot_navigation">
		<div class="container nav_container">
			<ul>

			</ul>
		</div>
	</nav>

</section>



</c:if>
