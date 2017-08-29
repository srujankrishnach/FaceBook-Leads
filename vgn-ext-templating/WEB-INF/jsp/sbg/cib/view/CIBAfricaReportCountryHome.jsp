<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>
<%@include file="/WEB-INF/jsp/sbg/common/include/sbgHeader.jsp"%>
<%@include file="/WEB-INF/jsp/sbg/CIB/common/CIBGenericReferenceDataUtil.jsp"%>
<%@include file="/WEB-INF/jsp/sbg/CIB/common/CIBDateUtil.jsp"%>

<%-- initialize component & results --%>
<templating:initComponent/>
<templating:initRequestContext var="rc" />
<c:set var="currentSite" value="${rc.currentSiteBean}" />
<templating:contentLink var="homeURL" oid="${currentSite.homeChannel.system.id}" />
<templating:contentItem result="content"/>

<%CIBGenericReferenceDataUtil util = new CIBGenericReferenceDataUtil("Insights Africa Countries");%>
<div class="col-md-6">	
	<div class="mdl_select">
		<label>Africa Insights</label>
		<select class="browser-default"onchange="javascript:location.href = this.value;">
		<option selected="selected" disabled="disabled" value="">Choose your option</option>
		<c:forEach items="${component.results}" var="countries">
		<c:set var="countryKey" value="${countries.countryName}"/>
		<templating:contentLink var="linkUrl" oid="${countries.system.id}"/>
			<option value="${linkUrl}"><%=util.getMappedValueForReferenceData((String)pageContext.getAttribute("countryKey"))%></option>
		</c:forEach>
		</select>
	</div>
</div>