<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	
	<title>서울고궁안내 - 관리자>행사관리>목록</title>

	<!-- Icons -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

	<!-- Common CSS -->
	<%@ include file="/WEB-INF/views/managerViews/layout/jspf/commonCss.jspf" %>
	
	<!-- Page level CSS -->
	<c:url value="/resources/vendor/manager/datatables/dataTables.bootstrap4.css" var="dataTablesBootstrap4Css" />
	<link href="${dataTablesBootstrap4Css}" rel="stylesheet">
	
	<!-- jquery -->
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>

<body id="page-top">
	<div id="wrapper">
		
		<!-- Sidebar -->
		<jsp:include page="/WEB-INF/views/managerViews/layout/sidebar.jsp"></jsp:include>
		<!-- Sidebar -->
		
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
				
				<!-- TopBar -->
				<jsp:include page="/WEB-INF/views/managerViews/layout/topbar.jsp"></jsp:include>
				<!-- TopBar -->

				<!-- Container Fluid-->
				<div class="container-fluid" id="container-wrapper">
					<div class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">행사 목록</h1>
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="/royal/manage/main/index">Home</a></li>
							<li class="breadcrumb-item">행사</li>
							<li class="breadcrumb-item active" aria-current="page">추가</li>
						</ol>
					</div>

					<!-- Row -->
					<div class="row">

						<!-- modal -->
						<div class="modal fade" id="detailModal" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalLongTitle"
							aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title modal_details_title" id="exampleModalLongTitle"></h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<img class="modal_details_img" style="width: 450px;">
										<hr>
										<h5 class="font-weight-bold">상세 정보</h5>
										<div id="modal_details_top">
											<div style="font-size: 12px; font-weight: bold">
												행사명
											</div>
											<div style="margin-bottom: 12px"></div>
											
											<div style="font-size: 12px; font-weight: bold">
												장소
											</div>
											<div style="margin-bottom: 12px"></div>
												
											<div style="font-size: 12px; font-weight: bold">
												시작일
											</div>
											<div style="margin-bottom: 12px"></div>
						
											<div style="font-size: 12px; font-weight: bold">
												종료일
											</div>
											<div style="margin-bottom: 12px"></div>
										
											<div style="font-size: 12px; font-weight: bold">
												예약가능 여부
											</div>
											<div style="margin-bottom: 12px"></div>
											
											<div style="font-size: 12px; font-weight: bold">
												홈페이지
											</div>
											<div style="margin-bottom: 12px"></div>
											
											<div style="font-size: 12px; font-weight: bold">
												이미지 경로
											</div>
											<div style="margin-bottom: 12px"></div>
										</div>
											
										<br>
										
										<h5 class="font-weight-bold">회차 정보</h5>
										<div id="modal_details_bottom">
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-outline-primary"
											data-dismiss="modal">Close</button>
									</div>
								</div>
							</div>
						</div>

						<!-- DataTable with Hover -->
						<div class="col-lg-12">
							<div class="card mb-4">
								<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">행사 목록</h6>
									<span style="font-size: 15px; font-weight: bold; ">※ 아래 각 행사를 클릭하시면 회차정보 등 상세정보를 보실 수 있습니다.</span>
								</div>
								<div class="table-responsive p-3">
									<table class="table align-items-center table-flush table-hover" id="dataTableHover">
										<thead class="thead-light">
											<tr>
												<th>ID</th>
												<th>행사유형</th>
												<th>행사이름</th>
												<th>행사장소</th>
												<th>시작일</th>
												<th>종료일</th>
												<th>예약가능</th>
											</tr>
										</thead>
										<tfoot>
											<tr>
												<th>ID</th>
												<th>행사유형</th>
												<th>행사이름</th>
												<th>행사장소</th>
												<th>시작일</th>
												<th>종료일</th>
												<th>예약가능</th>
											</tr>
										</tfoot>
										<tbody>
											<c:forEach items="${eventList}" var="event">
												<tr id="${event.event_id}" class="tableRowData" data-toggle="modal" data-target="#detailModal">
													<td style="word-break:break-all">${event.event_id}</td>
													<td style="word-break:break-all">${event.event_type}</td>
													<td style="word-break:break-all">${event.event_name}</td>
													<td style="word-break:break-all">${event.event_location}</td>
													
													<fmt:formatDate var="formatStartDate" value="${event.start_date}" pattern="yyyy/MM/dd"/>
                                      				<td>${formatStartDate}</td>
                                       				<fmt:formatDate var="formatEndDate" value="${event.end_date}" pattern="yyyy/MM/dd"/>
                                       				<td>${formatEndDate}</td>
				
													<%-- <td width="200px" style="word-break:break-all">${event.event_link}</td> --%>
													<td width="100px" style="word-break:break-all">${event.reservable}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					<!--Row-->
					
				</div>
				<!---Container Fluid-->

			</div>
			
			<!-- Footer -->
			<jsp:include page="/WEB-INF/views/managerViews/layout/footer.jsp"></jsp:include>
			<!-- Footer -->
			
		</div>
	</div>

	<!-- Scroll to top -->
	<a class="scroll-to-top rounded" href="#page-top"> 
		<i class="fas fa-angle-up"></i>
	</a>

	<!-- Common JS -->
	<%@ include file="/WEB-INF/views/managerViews/layout/jspf/commonJs.jspf" %>
	
	<!-- Individual JS -->
	<c:url value="/resources/js/manager/event/list.js" var="listJS" />
	<script src="${listJS}"></script>
	
	<!-- Page level plugins -->
	<c:url value="/resources/vendor/manager/datatables/jquery.dataTables.js" var="dataTablesJs" />
	<c:url value="/resources/vendor/manager/datatables/dataTables.bootstrap4.js" var="dataTablesBootstrap4Js" />
  	<script src="${dataTablesJs}"></script>
  	<script src="${dataTablesBootstrap4Js}"></script>
	
	<!-- Page level custom scripts -->
	<script>
		$(document).ready(function () {
		  $('#dataTable').DataTable(); // ID From dataTable 
		  $('#dataTableHover').DataTable(); // ID From dataTable with Hover
		});
	</script>
</body>

</html>