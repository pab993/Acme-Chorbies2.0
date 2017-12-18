<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="acme" tagdir="/WEB-INF/tags" %>


<display:table name="eventsFuture" id="row" requestURI="${requestURI}"
	pagesize="5" class="displaytag">
	
	<spring:message code="event.picture" var="pictureH" />
	<display:column title="${pictureH}">
		<img height="65" width="65" src="${row.getPicture()}" />
	</display:column>
	
	<spring:message code="event.title" var="titleH" />
	<display:column title="${titleH}" property="title" />
	
	<spring:message code="event.createMoment" var="createMomentH" />
	<display:column title="${createMomentH}" property="moment" />
	
	<spring:message code="event.description" var="descriptionH" />
	<display:column title="${descriptionH}" property="description" />
	
	<spring:message code="event.seatsNumber.available" var="seatsAH"/>
	<display:column title="${seatsAH}" value="${row.seatsNumber - fn:length(row.chorbies)}" sortable="true" />
	
	</display:table>
