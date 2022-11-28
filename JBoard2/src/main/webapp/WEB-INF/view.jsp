<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="./_header.jsp" />
	<main id="board">
		<section class="view">
		<script>
	$(document).ready(function(){
		
		//삭제하기
		$(document).on('click', '.remove', function(e){
			e.preventDefault();
			
			let tag = $(this);
			let result = confirm('정말 삭제 하시겠습니까?');
			
			if(result){
				
				let no = $(this).attr('data-no');
				
				$.ajax({
					url: '/JBoard1/proc/commentDeleteProc.jsp?no='+no,
					type: 'GET',
					dataType: 'json',
					success: function(data){
						
						if(data.result > 0){
							alert('댓글이 삭제 되었습니다.');
							
							// 화면삭제
							tag.parent().parent().hide();
						}
						
					}
				});
			}
		});
		
		//수정하기
		$(document).on('click','.modify', function(e){
			e.preventDefault();
			
			
			let txt = $(this).text();
			let p = $(this).parent().prev();
			
			if(txt == '수정'){
				//수정모드
				
				$(this).text('수정완료');
				p.attr('contentEditable', true);
				p.focus();
				
			}else{
				//수정완료
				$(this).text('수정');
				p.attr('contentEditable', false);
				
				let no = $(this).attr('data-no');
				let content = p.text();
				
				let jsonData ={
						"no":no,
						"content":content
				};
				
				$.ajax({
					url:'/JBoard1/proc/commentModifyProc.jsp',
					type:'POST',
					data:jsonData,
					dataType:'json',
					success: function(data){
						
						if(data.result > 0){
							alert('댓글이 수정되었습니다');
						}
						
					}
					
				});
			}
		
		})
		
			
		//댓글쓰기
		
		$('.commentForm > form').submit(function(){
			
			let pg 		= $(this).children('input[name=pg]').val();
			let parent 	= $(this).children('input[name=parent]').val();
			let uid 	= $(this).children('input[name=uid]').val();
			let textarea = $(this).children('textarea[name=content]');
			let content  = textarea.val();
						
			let jsonData = {
				"pg":pg,
				"parent":parent,
				"uid":uid,
				"content":content
			};
			
			console.log(jsonData);
			
			$.ajax({
				url : '/JBoard1/proc/commentWriteProc.jsp',
				method: 'POST',
				data: jsonData,
				dataType: 'json',
				success: function(data){
					
					console.log(data);
					
					let article = "<article>";
						article += "<span class='nick'>"+data.nick+"</span>";
						article += "<span class='date'>"+data.date+"</span>";
						article += "<p class='content'>"+data.content+"</p>";
						article += "<div>";
						article += "<a href='#' class='remove' data-no='"+data.no+"' >삭제</a>";
						article += "<a href='#' class='modify' data-no='"+data.no+"'>수정</a>";
						article += "</div>";
						article += "</article>";
					
					$('.commentList > .empty').hide();
					$('.commentList').append(article);
					textarea.val('');
				}
			});
			
			return false;
		});
	});
</script>

			<table border="0">
				<caption>글보기</caption>
				<tr>
					<th>제목</th>
					<td><input type="text" name="title" value="${article.title}" readonly /></td>
				</tr>
				<tr>
					<th>파일</th>
					<td><a href="#">2020년 상반기 매출자료.xls</a>&nbsp;<span>7</span>회
						다운로드</td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea name="content" readonly>내용 샘플입니다.</textarea></td>
				</tr>
			</table>

			<div>
				<a href="./delete.do?pg=1&no=10" class="btn btnRemove">삭제</a> 
				<a href="./modify.do"class="btn btnModify">수정</a> 
				<a href="./list.do" class="btn btnList">목록</a>
			</div>

			<!-- 댓글목록 -->
			<section class="commentList">
				<h3>댓글목록</h3>

				<article>
					<span class="nick">길동이</span> <span class="date">20-05-20</span>
					<p class="content">댓글 샘플 입니다.</p>
					<div>
						<a href="#" class="remove">삭제</a> <a href="#" class="modify">수정</a>
					</div>
				</article>

				<p class="empty">등록된 댓글이 없습니다.</p>

			</section>

			<!-- 댓글쓰기 -->
			<section class="commentForm">
				<h3>댓글쓰기</h3>
				<form action="#">
					<textarea name="content">댓글내용 입력</textarea>
					<div>
						<a href="#" class="btn btnCancel">취소</a> <input type="submit"
							value="작성완료" class="btn btnComplete" />
					</div>
				</form>
			</section>
		</section>
</main>
<jsp:include page="./_footer.jsp" />