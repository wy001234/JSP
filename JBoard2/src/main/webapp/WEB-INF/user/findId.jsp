<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="./_header.jsp"/>


<script src="/JBoard2/js/emailAuth.js"></script>
<script>
	$(function(){
		
		$('.btnNext').click(function(){
			
			if(isEmailAuthOk){
				console.log('here2');
				
				let name = $('input[name=name]').val();
				let email = $('input[name=email]').val();
				
				let jsonData = {
					"name" : name,
					"email" : email
				}
				
				$.ajax({
					url:'/JBoard2/user/findId.do',
					type:'post',
					data:jsonData,
					dataType:'json',
					success:function(data){
						
						if(data.result ==1){
							location.href="/JBoard2/user/findIdResult.do";
						}else{
							alert('해당하는 사용자가 존재하지 않습니다.\n 이름과 이메일을 다시 확인해주세요');
						}
					}
				});
				
				return false;
				
			}else{
				alert('이메일 인증을 하셔야 합니다');
				console.log('here3');
				return false;
			}
			
		})
		
	})
	
	// 비밀번호 일치여부 확인
	$('input[name=pass2]').focusout(function(){			
		let pass1 = $('input[name=pass1]').val();
		let pass2 = $(this).val();
		
		if(pass1 == pass2){
							
			if(pass2.match(regPass)){
				isPassOk = true;
				$('.resultPass').css('color', 'green').text('비밀번호가 일치합니다.');	
			}else{
				isPassOk = false;
				$('.resultPass').css('color', 'red').text('영문, 숫자, 특수문자 조합 최소 5자 이상 이어야 합니다.');
			}				
			
		}else{
			isPassOk = false;
			isPassMatch = true;
			$('.resultPass').css('color', 'red').text('비밀번호가 일치하지 않습니다.');
		}			
	});
	
	
</script>
        <main id="user">
            <section class="find findId">
                <form action="#">
                    <table border="0">
                        <caption>아이디 찾기</caption>
                        <tr>
                            <td>이름</td>
                            <td><input type="text" name="name" placeholder="이름 입력"/></td>
                        </tr>
                        <tr>
                            <td>이메일</td>
                            <td>
                                <div>
                                    <input type="email" name="email" placeholder="이메일 입력"/>
                                    <span class="resultEmail"></span>
                                    <button type="button" class="btnAuth" id="btnEmail">인증번호 받기</button>
                                </div>
                                <div class="auth">
                                    <input type="text" name="auth" placeholder="인증번호 입력"/>
                                    <button type="button" class="btnConfirm" id="btnEmailConfirm">확인</button>
                                </div>
                            </td>
                        </tr>                        
                    </table>                                        
                </form>
                
                <p>
                    회원가입시 이메일 주소와 입력한 이메일 주소가 같아야, 인증번호를 받을 수 있습니다.<br>
                    인증번호를 입력 후 확인 버튼을 누르세요.
                </p>

                <div>
                    <a href="/JBoard2/user/login.do" class="btn btnCancel">취소</a>
                    <a href="/JBoard2/user/findIdResult.do" class="btn btnNext">다음</a>
                </div>
            </section>
        </main>
        <jsp:include page="./_footer.jsp"/>