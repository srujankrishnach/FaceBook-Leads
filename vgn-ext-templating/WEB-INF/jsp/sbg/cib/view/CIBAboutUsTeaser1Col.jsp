<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>
<%@include file="/WEB-INF/jsp/sbg/common/include/sbgHeader.jsp"%>
<<<<<<< HEAD
adding test content

<%-- initialize component & results test --%>
=======







<%-- initialize component & results --%>
>>>>>>> refs/remotes/origin/master
<templating:initComponent/>
<templating:initRequestContext var="rc" />
<c:set var="currentSite" value="${rc.currentSiteBean}" />
<templating:contentLink var="homeURL" oid="${currentSite.homeChannel.system.id}" />

<templating:contentItem result="content"/>


<div class="col-md-4">
				<div class="std_bank_comp_static_content"> 
					<div class="comp_header clearfix">
					<templating:textInlineEdit oid="${content.system.id}" attributexmlname="TITLE">
						<h5>${content.title}</h5>
					</templating:textInlineEdit>
					
					</div>
					<div class="comp_body">
					
					<templating:textInlineEdit oid="${content.system.id}" attributexmlname="SUMMARY">
						<h6>${content.summary}</h6>
					</templating:textInlineEdit>
					
					<c:set var="bannerPath" value="${content.mediaItem.SOURCEPATH.placementPath}"/>
					<c:if test="${not empty bannerPath}">
							<div class="image"><img src="/standimg/${bannerPath}" alt=""></div>
						</c:if>
						<c:if test="${not empty content.description}">
							<templating:textInlineEdit oid="${content.system.id}" attributexmlname="DESCRIPTION">
								${content.description}
							</templating:textInlineEdit>
						
						</c:if>
						<c:if test="${not empty content.linkTo}">
							<%@include file="/WEB-INF/jsp/sbg/CIB/view/CIBShowMoreButton.jsp"%>
						</c:if>
					</div>
				</div>
			</div>
