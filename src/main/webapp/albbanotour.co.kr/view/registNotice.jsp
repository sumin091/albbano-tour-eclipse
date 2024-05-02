<%@page import="dao.NoticeDAO"%>
<%@page import="vo.NoticeVO"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="공지사항 작성"%>
<%
request.setCharacterEncoding("UTF-8");

String doc_No= request.getParameter("doc_No");
String title= request.getParameter("title");
String img_Name= request.getParameter("img_Name");
String id= request.getParameter("id");
String doc_cont= request.getParameter("doc_cont");
String del_yn= request.getParameter("del_Yn");

NoticeVO ntVO= new NoticeVO();
NoticeDAO ntDAO= new NoticeDAO();
%>