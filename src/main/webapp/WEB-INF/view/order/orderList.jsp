<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/link.jsp" %>
 
	<link rel="stylesheet" href="/css/modal.css" >
	<link rel="stylesheet" href="/css/layout/nav.css" >
	<link rel="stylesheet" href="/css/order/orderList.css" >
    
<%@ include file="/WEB-INF/view/include/header.jsp" %>
    
	<div class="wrap">
    
		<c:if test="${!empty orderList }">
		    <section class="title">
		        <h1>주문 내역</h1>
		    </section>
		</c:if>    
	
	    <main>
	        <div class="order_list">
	         	<c:if test="${empty orderList }" >
	        		<img alt="이미지" src="/img/temp.png" class="temp_img"> 
	        	</c:if> 
	        	
	        	
	        	<ul id="order_list">
	                <c:forEach items="${orderList }" var="orderList" >
	                    <li>
	                    	
	                    
	                    	<div class="delevery_state">
	                    		<span><fm:formatDate value="${orderList.orderDate }" pattern="M월d일" /> </span>
	                    		
	                    			<span>${orderList.deleveryStatus }</span> 
	                    		<c:if test="${orderList.deleveryStatus == '처리 중' }"> 
	                    		</c:if>
	                    		
	                    		 
	                    	</div>
	                    	
	                        <a href="/store/detail/${orderList.storeId }" class="store_move">
	                        	<span><img src="${orderList.storeImg }" alt="이미지"></span>
	                            <span class="inf">
	                            	<h2> ${orderList.storeName }</h2><br>
	                                <span><fm:formatNumber value="${orderList.totalPrice + orderList.deleveryTip - orderList.usedPoint }" pattern="###,###" /> 원</span>
	                             </span>
	                        </a>
	                        
	                        <div class="review_btn_box">
	                        	<input type="hidden" value="${orderList1.storeNum }" class="detail_store_num">
		                        <button class="order_detail">상세보기</button>
		                        <c:if test="${!empty user }">
		                        
                    			<input type="hidden" class="order_num" value="${orderList.orderNum }">
	                        	<input type="hidden" class="store_id" value="${orderList.storeId }">
	                        	<button class="review regi">리뷰쓰기</button>
	                        	<button class="review modify">리뷰 수정하기</button>
			                        	
			                        	
			                        	
			                        	
			                        	
			                        	
		                    			<input type="hidden" class="store_img" value="${orderList1.storeImg }">
		                        </c:if>
	                        </div>
						</li>
					</c:forEach>
	            </ul>
	
	        </div>
	           
	    </main>
</div>

    <!-- 하단 메뉴 -->
	<%@ include file="/WEB-INF/view/include/nav.jsp" %>
    <!-- 하단 메뉴 -->

    <!-- 푸터 -->
    <%@ include file="/WEB-INF/view/include/footer.jsp" %>
    <!-- 푸터 -->
	
	
		
    <div id="modal_bg"></div>

<!-- --------------------------------- 리뷰 쓰기 모달 --------------------------------- -->    
    <div class="review_modal modal resister">
    	<div id="modal_header">
			<button class="closeA">×</button>
			<h1>리뷰 쓰기</h1>
    	</div>
    	
	    <form action="/store/review" method="post"  enctype="multipart/form-data"> 
    	<div class="modal_box">
    	
	    	<div class="score_box">
				<i class="far fa-star"></i>
				<i class="far fa-star"></i>
				<i class="far fa-star"></i>
				<i class="far fa-star"></i>
				<i class="far fa-star"></i> 
	    	</div>
	    	
	    	<input type="hidden" name="score" class="score" >
	    	
	    	<div class="review_text">
	    		<textarea rows="10" cols="50" name="reviewContent" maxlength="500" ></textarea>
	    	</div>
	    	
	    	<div class="img_box">
	    		<label for="img" /></label>
	    		<input type="file" id="img" class="img" name="file">
	    	
	    		<div>
	    			<img class="preview">
	    			<button type="button" class="img_close"> x</button>
    			</div>
	    	</div>
	    	
	    	
    	</div>
    	
    	<div id="btn_box">
    	
    		<input type="text" class="order_num" name="orderNum">
    		<input type="text" class="store_id" name="storeId">
    	
    	
 			<button type="button" class="closeB">취소</button>
 			<button type="submit" class="review_submit_btn" disabled >리뷰 작성</button>
    		
    	</div>
    	
    	
    	</form>
    </div>
<!-- --------------------------------- 리뷰 쓰기 모달 --------------------------------- -->  
  
<!-- --------------------------------- 리뷰 수정하기 모달 --------------------------------- -->    
    <div class="review_modify_modal modal">
    <form action="/store/reviewModify" method="post"  enctype="multipart/form-data">
    	<div id="modal_header">
	    	<h1>리뷰 수정하기</h1>
		    <span class="closeA">×</span>
    	</div>
    	
    	
    	<div class="modal_box">
    	
	    	<div class="score_box">
				<i class="far fa-star"></i>
				<i class="far fa-star"></i>
				<i class="far fa-star"></i>
				<i class="far fa-star"></i>
				<i class="far fa-star"></i> 
	    	</div>
	    	
	    	
	    	
	    	<input type="hidden" name="score" value="" class="score" >
	    	
	    	<div class="review_text">
	    		<textarea rows="10" cols="50" name="content"></textarea>
	    	</div>
	    	
	    	<div class="img_box">
	    		<input type="file" class="modify_img" name="img" value="" >
	    		<div>
	    			<img class="preview">
	    			<button type="button" class="img_close"> x</button>
    			</div>
    			
	    	</div>
    	</div>
    	
    	<div class="btn_box">
    		<button type="button" class="closeB">취소</button>
    		<input type="submit" value="리뷰 수정하기"  class="submit_btn" disabled >
    		
    		<input class="store_num" type="hidden" value="" name="storeNum">
    		<input class="store_img" type="hidden" value="" name="modifyImg">
    	</div>
    	
    	</form>
    </div>
<!-- --------------------------------- 리뷰 쓰기 모달 --------------------------------- -->    
	
	

	
	
	
	
	<script type="text/javascript" src="/js/orderList.js" ></script>
	<script type="text/javascript" src="/js/modal.js" ></script>
	<script type="text/javascript" src="/js/openModal.js" ></script>
	
	
</body>
</html>