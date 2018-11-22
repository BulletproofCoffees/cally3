<%@ page language="java" contentType="text/jsp; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach items="${list}" var="foodsdb">
<tr>
	<td>
	<div class="col-md-6">
			<span class="check">
			<input type="checkbox" class="checked">
			</span> <a href="${Ingredient}?food=">
				${foodsdb.DESC_KOR}(${foodsdb.MN})
			</a>
		</div>
		<div class="col-md-6 ">
		<b class = "gram">${foodsdb.SERVING_WT}</b>당
			<b class = "cal">${foodsdb.NUTR_CONT1}</b><b>Cal</b></div>
		<div class="col-md-12">
		
		<div class="col-md-6">
				<input type="number" class="form-control content col-md-6" value="1" id="content">
			</div>
			<h4 >							
				<b class="view3 col-md-offset-1">${foodsdb.NUTR_CONT1}</b><b>Cal</b>
			</h4>			
		</div>
		</td>
		<td>
	      <input type="hidden"  value="${foodsdb.DESC_KOR}"id="DESC_KOR" readonly>
	       <input type="hidden"  value="${foodsdb. F_NO}" id="F_NO" readonly>	     
		</td>
</tr>
</c:forEach>


