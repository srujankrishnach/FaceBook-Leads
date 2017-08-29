<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<%@include file="/WEB-INF/jsp/sbg/common/include/sbgHeader.jsp"%>

<%--adding test initialize component & results --%>

<templating:initComponent var="content"/>

<c:if test="${not empty content}">

	<iframe src="${content.url}" width="100%" scrolling="no" style="border:none; height: 308px; overflow:hidden;"></iframe>

</c:if>