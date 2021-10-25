<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/link.jsp" %>

    <link rel="stylesheet" href="/css/modal.css" > 
    <link rel="stylesheet" href="/css/store/detail.css" >
    
    
<%@ include file="/WEB-INF/view/include/header.jsp" %>


 	<!-- 메인 -->
	<%@ include file="/WEB-INF/view/store/storeDetail.jsp" %>
 	<!-- 메인 -->
 	
    <!-- 푸터 -->
    <%@ include file="../include/footer.jsp" %>
    <!-- 푸터 -->
    
	<!-- 메뉴 모달 -->
	<%@ include file="/WEB-INF/view/include/foodModal.jsp" %>
    <!-- 메뉴 모달 -->
	
	
	
 	<script type="text/javascript" src="/js/store/storeDetail.js" ></script>
    <script type="text/javascript" src="/js/modal/modal.js" ></script> 
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3fe0c2eaecb263f09df91a81c2ec64a0&libraries=services,clusterer,drawing"></script>
</body>
</html>