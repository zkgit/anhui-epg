<%@page import="com.vstartek.epg.utils.RequestUtil"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String programType=RequestUtil.getString("programType", request);
	response.sendRedirect("list.jsp?programType="+programType);
%>