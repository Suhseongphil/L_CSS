<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.disply{
display: none;
}
.pointer {cursor:pointer;}

</style>
<body>
 	    <div class="col-lg-3">
                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
                            <span>목록</span>
                        </div>
                        <ul>
                            
                             
                            <li class="pointer"> <span onclick="productCategory()" >상품</span> 
                            	<ul id="productNone" class ="disply">
                            		<li> <a href="cafeList">원두</a></li>
                            		<li onclick="sauceCategory()">시럽&소스&파우더
                            			<ul id="sauce" class="disply">
                            				<li>시럽&소스</li>
                            				<li>파우더</li>
                            			</ul>
                            			
                            		</li>
                            		<li onclick="tumblerCategoru()" >텀블러&머그잔
                            			<ul id="tumbler" class="disply">
                            				<li>텀블러</li>
                            				<li>머그잔</li>
                            			</ul>
                            		</li>
                            		<li onclick="furnitureCategoru()">가구
                            			<ul id="furniture" class="disply">
                            				<li>의자</li>
                            				<li>테이블</li>
                            				
                            			</ul>
                            		</li>
                            		
                            		<li onclick="machineCategoru()">머신
                            			<ul id="machine" class="disply">
                            				<li>제빙기</li>
                            				<li>커피머신</li>
                            				<li>그라인더</li>
                            			</ul>
                            		</li>
                            		
                            		<li onclick="disposableCategoru()">일회용품
                            			<ul id="disposable" class="disply">
                            				<li>컵홀더</li>
                            				<li>빨대</li>
                            				<li>아이스컵&뚜껑</li>
                            				<li>종이컵&뚜껑</li>
                            				<li>냅킨</li>
                            			</ul>
                            		</li>
                            	
                            	</ul>
                            </li>
                            
                            
                            
                            <li class="pointer"> <span onclick="cafeCategory()" >카페</span> 
                            	<ul id="cafeNone" class ="disply">
                            		<li> <a href="cafeList">카페목록</a></li>
                            		<li>카페메뉴</li>
                            		<li>추천카페</li>
                            	</ul>
                            
                            </li>
                            <li><a onclick="companyCategory()">업체</a>
                            	<ul id="comNone" class="disply">
                           			<li><a href="companyList">업체목록</a></li>
                            		<li>우수업체</li>
                            	</ul>
                            
                            </li>
                            <li><a href="#">공동구매</a></li>
                            
                             <li><a onclick="inquireCategory()">고객문의</a>
                            	<ul id="inquireNone" class="disply">
		                            <li><a href="inquirePage">문의하기</a></li>
                           			<li><a href="">내 문의</a></li>
                            		
                            	</ul>
                            
                            </li>
                            
								<!-- href="cafeList"  -->
                        </ul>
                    </div>
                </div>
              
     
</body>
<script type="text/javascript">
	function sauceCategory(){
		console.log('호출');
		var con = document.getElementById('sauce');
		console.log(con);
		if(con.style.display == 'none'){
			
		con.style.display='block';
		}else{
			con.style.display='none';	
		}
		
	}
</script>
<script type="text/javascript">
	function tumblerCategoru(){
		console.log('호출');
		var con = document.getElementById('tumbler');
		console.log(con);
		if(con.style.display == 'none'){
			
		con.style.display='block';
		}else{
			con.style.display='none';	
		}
		
	}
</script>
<script type="text/javascript">
	function furnitureCategoru(){
		console.log('호출');
		var con = document.getElementById('furniture');
		console.log(con);
		if(con.style.display == 'none'){
			
		con.style.display='block';
		}else{
			con.style.display='none';	
		}
		
	}
</script>

<script type="text/javascript">
	function machineCategoru(){
		console.log('호출');
		var con = document.getElementById('machine');
		console.log(con);
		if(con.style.display == 'none'){
			
		con.style.display='block';
		}else{
			con.style.display='none';	
		}
		
	}
</script>
<script type="text/javascript">
	function disposableCategoru(){
		console.log('호출');
		var con = document.getElementById('disposable');
		console.log(con);
		if(con.style.display == 'none'){
			
		con.style.display='block';
		}else{
			con.style.display='none';	
		}
		
	}
</script>

<script type="text/javascript">
	function productCategory(){
		console.log('호출');
		var con = document.getElementById('productNone');
		console.log(con);
		if(con.style.display == 'none'){
			
		con.style.display='block';
		}else{
			con.style.display='none';	
		}
		
	}
</script>
<script type="text/javascript">
	function cafeCategory(){
		console.log('호출');
		var con = document.getElementById('cafeNone');
		console.log(con);
		if(con.style.display == 'none'){
			
		con.style.display='block';
		}else{
			con.style.display='none';	
		}
		
	}
</script>
<script type="text/javascript">
	function companyCategory(){
		console.log('호출');
		var con = document.getElementById('comNone');
		console.log(con);
		if(con.style.display == 'none'){
			
		con.style.display='block';
		}else{
			con.style.display='none';	
		}
		
	}
</script>
<script type="text/javascript">
	function inquireCategory(){
		console.log('호출');
		var con = document.getElementById('inquireNone');
		console.log(con);
		if(con.style.display == 'none'){
			
		con.style.display='block';
		}else{
			con.style.display='none';	
		}
		
	}
</script>
</html>