<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/JBoard1/css/style.css">
</head>
<body>
    <div id="wrapper">
        <header>
            <h3>Board System v1.0</h3>
            <p>
                <span class="nick">길동이</span>님 반갑습니다.
                <a href="#" class="logout">[로그아웃]</a>
            </p>
        </header>

        <main id="board" class="modify">

            <form action="#">
                <table>
                    <caption>글수정</caption>
                    <tr>
                        <th>제목</th>
                        <td><input type="text" name="text" placeholder="제목을 입력하세요"></td>
                    </tr>
                    <tr>
                        <th>내용</th>
                        <td><textarea name="content"></textarea></td>
                    </tr>
                    <tr>
                        <th>파일</th>
                        <td><input type="file" name="file"></td>
                    </tr>
                </table>

                <div>
                    <a href="/JBoard1/user/view.jsp" class="btn btnCancel">취소</a>
                    <input type="submit" value="작성완료" class="btn btnComplete">
                </div>
            </form>
        </main>


        <footer>
            <p>ⓒCopyleft by chhak.or.kr</p>
        </footer>    
    </div>
</body>
</html>