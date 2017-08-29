<%@include file="getBannerImagePath.jsp"%>
<c:if test="${imagePath!='/vgn-ext-templating/sbg/cib/noImage.jpg'}">
				<c:set var="item" value="${bannerContetItem}"/>
				<%@include file="/WEB-INF/jsp/sbg/common/include/sbgWebLinkManagement.jsp"%>
				 <a href="${itemURL}"><img class="headerImg" alt="${altText}" src="${imagePath}" /></a>
</c:if>