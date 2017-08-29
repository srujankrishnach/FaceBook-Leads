<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<%@include file="/WEB-INF/jsp/sbg/common/include/sbgHeader.jsp"%>
<%@ page import="za.co.standardbank.sbg.cda.templating.web.util.DisplayUtil"%>
<%@ page import="za.co.standardbank.sbg.cda.templating.web.util.DPMConstants"%>
<%@ page import="java.util.*"%>
<%@ page import="com.vignette.ext.templating.util.*"%>
<%@ page import="za.co.standardbank.sbg.cda.templating.web.util.ReferenceDataLoder"%>

<%-- initialize component & results --%>
<templating:initComponent/>
<templating:initRequestContext var="rc"/>
<c:set var="currentChannel" value="${rc.requestedChannelBean}"/>
<c:if test="${not empty component.channelPath}">
<templating:contentLink var="linkUrl" oid="${component.channelPath.system.id}"/>
</c:if>
<%
    try{
        RequestContext rc = PageUtil.getCurrentRequestContext(pageContext);
        String siteName = rc.getCurrentSite().getData().getName();
        List<String> years = DisplayUtil.getYearsForSearch(siteName.toUpperCase()+ DPMConstants.MEDIA_START_YEAR);

		HashMap<String, String> countries = ReferenceDataLoder.loadReferenceDataListByTitle("Standard Bank Websites");//DisplayUtil.getSBCountries();
        List<Map.Entry> countrieAsc = (countries != null)?new ArrayList<Map.Entry>(countries.entrySet()):new ArrayList<Map.Entry>();
        Collections.sort(countrieAsc, DisplayUtil.getHashMapEntrySetComparator());

		HashMap<String, String> sectors = ReferenceDataLoder.loadReferenceDataListByTitle("Sectors");
        List<Map.Entry> sectorsAsc = (sectors != null)?new ArrayList<Map.Entry>(sectors.entrySet()):new ArrayList<Map.Entry>();
        Collections.sort(sectorsAsc, DisplayUtil.getHashMapEntrySetComparator());
		
		HashMap<String, String> segments = ReferenceDataLoder.loadReferenceDataListByTitle("Segments");
        List<Map.Entry> segmentsAsc = (segments != null)?new ArrayList<Map.Entry>(segments.entrySet()):new ArrayList<Map.Entry>();
        Collections.sort(segmentsAsc, DisplayUtil.getHashMapEntrySetComparator());
		
        pageContext.setAttribute("listYears",years);
        pageContext.setAttribute("listCountries",countrieAsc);
		pageContext.setAttribute("listSectors",sectorsAsc);
		pageContext.setAttribute("listSegments",segmentsAsc);

    }catch(Exception ex){
        ex.printStackTrace();
    }

%>

<div class="std_bank_comp_search">

	<div class="comp_header"><h5>${empty component.title?'Search accolades':component.title}</h5></div>
	<div class="comp_body clearfix">
		<form action="${linkUrl}" method="POST" name="accolades_search_form">
			<input type="hidden" placeholder="Select Year" id="yearValue" name="yearValue" value="">
			<div class="std_bank_comp_dropdown">
				<label for="">Year Specific</label>
				<div class="comp_header clearfix">
					<input type="text" placeholder="Select Year" id="yearV" name="yearV"> <a href=""><i class="std_bank_icon_dropdown_arrow"></i></a>
				</div>
				<div class="comp_body">
					<ul>
						<c:forEach items="${listYears}" var="year">
							<li><a href="" onclick="$('#yearValue').val('${year}')" value="${year}">${year}</a></li>
						 </c:forEach>
					</ul>
				</div>
			</div>
			
			<input type="hidden" placeholder="Select Country" id="segmentValue" name="segmentValue" value="">
			<input type="hidden" placeholder="Select Country" id="segment" name="segment" value="">
			<div class="std_bank_comp_dropdown">
				<label for="">Products and Services</label>
				<div class="comp_header clearfix">
					<input type="text" placeholder="Select Product & Services" id="segmentV" name="segmentV"> <a href=""><i class="std_bank_icon_dropdown_arrow"></i></a>
					
				</div>
				<div class="comp_body">
					<ul>
						<c:forEach items="${listSegments}" var="entry">
							<li><a onclick="$('#segmentValue').val('${entry.key}');$('#segment').val('${entry.value}');"  href="" value="${entry.key}">${entry.value}</a></li>
						 </c:forEach>
					</ul>
				</div>
			</div>
			
			<input type="hidden" placeholder="Select Country" id="sectorValue" name="sectorValue" value="">
			<div class="std_bank_comp_dropdown">
				<label for="">Sector</label>
				<div class="comp_header clearfix">
					<input type="text" placeholder="Select Sector" id="sector" name="sector"> <a href=""><i class="std_bank_icon_dropdown_arrow"></i></a>
					
				</div>
				<div class="comp_body">
					<ul>
						<c:forEach items="${listSectors}" var="entry">
							<li><a onclick="$('#sectorValue').val('${entry.key}')" href="" value="${entry.key}">${entry.value}</a></li>
						 </c:forEach>
					</ul>
				</div>
			</div>
			
			<input type="hidden" placeholder="Select Country" id="countryCode" name="countryCode" value="">
			<input type="hidden" placeholder="Select Country" id="countryValue" name="countryValue" value="">
			<div class="std_bank_comp_dropdown">
				<label for="">Country</label>
				<div class="comp_header clearfix">
					<input type="text" placeholder="Select Country" id="countryV" name="countryV"> <a href=""><i class="std_bank_icon_dropdown_arrow"></i></a>
					
				</div>
				<div class="comp_body">
					<ul>
						<c:forEach items="${listCountries}" var="entry">
							<li><a href="" onclick="$('#countryCode').val('${entry.key}');$('#countryValue').val('${entry.value}')" value="${entry.key}">${entry.value}</a></li>
						 </c:forEach>
					</ul>
				</div>
			</div>	
			
			<div class="std_bank_comp_input">
				<label for="">Keywords</label>
				<input type="text"  placeholder="Keywords" id="Keyword" name="Keyword" />
			</div>
			
			<p class="textRight">
				<input class="std_bank_comp_button blue" type="submit" onclick="setFormComplete();" value="Search"/>
			</p>
		</form>
	</div>
</div>

<script>
function setFormComplete(){
   //dataLayer.formStatus = "complete";
   //_satellite.track('globalFormComplete');
   dataLayer.formisSubmitted= true;	
}		
</script>
