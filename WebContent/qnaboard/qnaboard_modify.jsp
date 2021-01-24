<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title> 게시판 </title> 
</head> 
<body>  
<div id="contentsArea">  
<section id="titlename">  
<h1> 게시판 수정 </h1>  
<p class="formSign">  <strong class="require">필수</strong> 는 반드시 입력하여야 하는 항목입니다.  </p> 
<form action="./BoardModifyService.qa" method="post" id="joinForm" name="modifyform" enctype="multipart/form-data">    
<fieldset>    
<legend> 게시판 수정 </legend>      
<input type="hidden" name="num" value="<c:out value='${boardDTO.num}'/>"/>      
<p>      <label for="m_id">이름 </label> ${boardDTO.m_id} </p>
<input type="hidden" name="m_id" value="${m_id}"/>  
  
 
<p> <label for="subject">제목 </label> 
<input type="text" id="subject" name="subject" value="<c:out value='${boardDTO.subject}'/>"/>      </p>      
<p>      <label for="content">내용</label> 
<textarea name="content" cols="74" rows="15"> <c:out value="${boardDTO.content}"/> </textarea>      </p>
<%--게시판의 첨부 파일에 관해 확인한다.--%>        
<c:if test="${!empty boardDTO.attached_file}">       
<p>      <label for="attached_file">파일 첨부</label><br/>      
<c:out value="${boardDTO.attached_file}"/> &nbsp;&nbsp;&nbsp; 
<a href="./boardUpload/<c:out value='${boardDTO.attached_file}'/>">  파일 다운 </a> 
<input type="hidden" name="old_file" value="<c:out value='${boardDTO.attached_file}'/>"/>      </p>        
</c:if>      
<p>      <label for="old_file">파일 수정</label>       
<input type="file" id="old_file" name="old_file">      </p>     
 
 <div class="btnJoinArea">        
 <button type="submit" class="btnOk">수정</button>        
 <button type="reset" class="btnCancel">취소</button> 
 <button type="button" value="button" onclick="location.href='./BoardList.qa'" class="btnOk">          목록        </button>     
 </div>    
 </fieldset>  
 </form>  
 </section>  
 </div> 
 </body> 
 </html>