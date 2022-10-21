<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./_header.jsp" %>

        <main id="board" class="view">
            <table>
                <caption>글보기</caption>
                <tr>
                    <th>제목</th>
                    <td><input type="text" name="title" value="제목입니다." readonly></td>
                </tr>
                <tr>
                    <th>파일</th>
                    <td><a href="#">2020년 상반기 매출자료.xls</a><span>7</span>회 다운로드</td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td><textarea name="content" readonly></textarea>내용 샘플입니다.</td>
                </tr>
            </table>
            <div>
                <a href="#" class="btn btnRemove">삭제</a>
                <a href="/JBoard1/user/modify.jsp" class="btn btnModify">수정</a>
                <a href="/JBoard1/user/list.jsp" class="btn btnList">목록</a>
            </div>

            <!-- 글목록 -->
            <section class="commentList">
                <h3>댓글 목록</h3>
                <article>
                    <span class="nick">길동이</span>
                    <span class="date">20-05-13</span>
                    <p>댓글 샘플입니다.</p>
                    <div>
                        <a href="#" class="btnRemove">삭제</a>
                        <a href="#" class="btnModify">수정</a>
                    </div>
                </article>

                <p class="empty">등록된 댓글이 없습니다.</p>
            </section>

            <!-- 댓글쓰기 -->
            <section class="commentFrom">
                <h3>댓글 쓰기</h3>
                <form action="#">
                    <textarea name="content" placeholder="댓글 내용 입력"></textarea>
                    <div>
                        <a href="#" class="btn btnCancel">취소</a>
                        <input type="submit" class="btn btnComplete" value="작성완료">
                    </div>
                </form>
            </section>
        </main>
<%@ include file="./_footer.jsp" %>