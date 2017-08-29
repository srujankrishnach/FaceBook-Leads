<%@include file="getBannerImagePath.jsp"%>
<c:if test="${imagePath!='/vgn-ext-templating/sbg/cib/noImage.jpg'}">
				<img class="headerImg" alt="${altText}" src="${imagePath}" />
</c:if>