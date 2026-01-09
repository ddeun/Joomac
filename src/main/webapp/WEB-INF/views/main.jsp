<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JOOMAC</title>
<style>
:root{
  --bg: #f6f7fb;
  --text: #222;
  --muted: #6b7280;

  --card: #ffffff;
  --line: #e8e8e8;

  --primary: #111827;         /* 기존 버튼 색 유지 */
  --primaryHover: #0b1220;

  --radius: 14px;
  --radius2: 16px;

  --shadow: 0 8px 22px rgba(17, 24, 39, 0.06);
  --shadow2: 0 12px 30px rgba(17, 24, 39, 0.10);
}

*{ box-sizing:border-box; }

body{
  margin:0;
  font-family: Arial, sans-serif;
  color: var(--text);
  /* 은은한 배경 개선 (너무 티 안 나게) */
  background:
    radial-gradient(900px 420px at 15% -10%, rgba(17,24,39,0.06), transparent 60%),
    radial-gradient(900px 420px at 95% 10%, rgba(99,102,241,0.06), transparent 60%),
    var(--bg);
}

.wrap{
  max-width: 1100px;
  margin: 0 auto;
  padding: 20px;
}

/* Header */
header{
  background: rgba(255,255,255,0.92);
  backdrop-filter: blur(6px);
  border-bottom: 1px solid var(--line);
}

.topbar{
  display:flex;
  align-items:center;
  justify-content:space-between;
  gap:16px;
  padding:16px 20px;
}

.brand{
  display:flex;
  align-items:center;
  gap:12px;
}
.brand h1{
  margin:0;
  font-size:22px;
  letter-spacing:.6px;
  font-weight:800;
}
.brand img{
  width:120px;
  height:auto;
  /* 로고도 살짝 정리 */
  border-radius: 10px;
}

.auth{
  display:flex;
  align-items:center;
  gap:10px;
  flex-wrap:wrap;
}
.welcome{
  font-weight:800;
}
.auth a{
  text-decoration:none;
  padding:9px 12px;
  border-radius: 10px;
  background:#f1f3f8;
  color:#111827;
  border: 1px solid rgba(17,24,39,0.06);
  transition: .18s ease;
}
.auth a:hover{
  background:#e9ecf5;
  transform: translateY(-1px);
}

/* Nav */
nav{
  background: rgba(255,255,255,0.92);
}
.menu{
  display:flex;
  gap:10px;
  flex-wrap:wrap;
  padding: 0 20px 16px;
}
.menu a{
  text-decoration:none;
  padding:10px 14px;
  border-radius: 12px;
  background:#fff;
  border:1px solid #e6e6e6;
  color:#111827;
  font-weight:700;
  transition: .18s ease;
}
.menu a:hover{
  border-color: rgba(99,102,241,0.25);
  box-shadow: 0 8px 18px rgba(17,24,39,0.06);
  transform: translateY(-1px);
}

.badge{
  display:inline-flex;
  align-items:center;
  justify-content:center;
  margin-left:6px;
  padding:2px 8px;
  border-radius:999px;
  background:#ff3b30;
  color:#fff;
  font-size:12px;
  font-weight:800;
}
.badge.gray{ background:#6b7280; }

/* Main cards */
.grid{
  display:grid;
  grid-template-columns: 2fr 1fr;
  gap:16px;
  margin-top:18px;
}
@media (max-width: 900px){
  .grid{ grid-template-columns: 1fr; }
}

.card{
  background: var(--card);
  border: 1px solid rgba(17,24,39,0.08);
  border-radius: var(--radius2);
  padding: 16px;
  box-shadow: var(--shadow);
  transition: transform .18s ease, box-shadow .18s ease;
}
.card:hover{
  transform: translateY(-2px);
  box-shadow: var(--shadow2);
}

.card h2{
  margin:0 0 10px;
  font-size:18px;
  letter-spacing:.2px;
}
.card h3{
  margin:0 0 10px;
  font-size:16px;
  letter-spacing:.1px;
}

.hero{
  display:flex;
  justify-content:space-between;
  align-items:flex-start;
  gap:16px;
}
.hero .desc{
  line-height:1.7;
  color:#374151;
  font-weight: 500;
}

.btnrow{
  display:flex;
  gap:10px;
  flex-wrap:wrap;
  margin-top:12px;
}
.btn{
  text-decoration:none;
  padding:10px 14px;
  border-radius: 12px;
  border:1px solid rgba(17,24,39,0.10);
  background: var(--primary);
  color:#fff;
  font-weight:800;
  transition: .18s ease;
}
.btn:hover{
  background: var(--primaryHover);
  transform: translateY(-1px);
}
.btn.secondary{
  background:#fff;
  color:#111827;
}
.btn.secondary:hover{
  background:#f4f6fb;
}

/* Lists: 심플하지만 더 “정돈된” 느낌 */
.list{
  margin: 10px 0 0;
  padding: 0;
  list-style: none;
}
.list li{
  display:flex;
  align-items:center;
  justify-content:space-between;
  gap: 10px;
  padding: 10px 10px;
  border-radius: 12px;
  border: 1px solid rgba(17,24,39,0.06);
  background: #fff;
  transition: .16s ease;
}
.list li + li{ margin-top: 8px; }
.list li:hover{
  border-color: rgba(99,102,241,0.18);
  box-shadow: 0 8px 18px rgba(17,24,39,0.06);
  transform: translateY(-1px);
}
.list li a{
  text-decoration:none;
  color:#111827;
  font-weight:800;
  white-space:nowrap;
  overflow:hidden;
  text-overflow:ellipsis;
  max-width: 70%;
}

.muted{
  color: var(--muted);
  font-size: 13px;
}
.row{
  display:flex;
  justify-content:space-between;
  align-items:center;
  gap:12px;
}
.row a.muted{
  text-decoration:none;
}
.row a.muted:hover{
  color:#111827;
}

/* Footer */
.foot{
  margin-top:16px;
  text-align:center;
  color:#8b8b8b;
  font-size:12px;
}
</style>
</head>

<body>

<header>
  <div class="topbar">
    <div class="brand">
      <img src="/images/joomaclogo.png" alt="JOOMAC 로고">
      <h1>JOOMAC</h1>
    </div>

    <div class="auth">
      <c:choose>
        <c:when test="${empty sessionScope.loginUser}">
          <a href="/member/login">로그인</a>
          <a href="/member/join">회원가입</a>
        </c:when>
        <c:otherwise>
          <span class="welcome">${sessionScope.loginUser.mname}님 환영합니다</span>
          <a href="/member/mypage">내정보</a>
          <a href="/member/logout">로그아웃</a>

          <c:if test="${sessionScope.loginUser.mauth != null && fn:contains(fn:toUpperCase(sessionScope.loginUser.mauth), 'ADMIN')}">
            <a href="/admin/main">관리자페이지</a>
          </c:if>
        </c:otherwise>
      </c:choose>
    </div>
  </div>

  <nav>
    <div class="menu">
      <a href="/board/list">자유게시판</a>
      <a href="/product/list">상품보기</a>

      <a href="/question/list">
        고객문의
        <c:if test="${sessionScope.loginUser != null}">
          <c:choose>
            <c:when test="${sessionScope.loginUser.mauth != null && fn:contains(fn:toUpperCase(sessionScope.loginUser.mauth), 'ADMIN')}">
              <c:if test="${pendingCount != null && pendingCount > 0}">
                <span class="badge">NEW ${pendingCount}</span>
              </c:if>
            </c:when>
            <c:otherwise>
              <c:if test="${myPendingCount != null && myPendingCount > 0}">
                <span class="badge gray">대기 ${myPendingCount}</span>
              </c:if>
            </c:otherwise>
          </c:choose>
        </c:if>
      </a>

      <a href="/notice/list">공지사항</a>
    </div>
  </nav>
</header>

<div class="wrap">

  <div class="grid">

    <section class="card">
      <h2>오늘의 추천 주류</h2>

      <div class="hero">
        <div class="desc">
          <strong>전통주의 매력을 한 잔에.</strong><br>
          JOOMAC에서 오늘의 추천 상품과 최신 소식을 빠르게 확인하세요.
          <div class="btnrow">
            <a class="btn" href="/product/list">추천 상품 보러가기</a>
            <a class="btn secondary" href="/question/write">1:1 문의하기</a>
          </div>
          <p class="muted" style="margin-top:12px;">
            ※ 추천 상품/최신 글은 메인 컨트롤러에서 데이터만 넘겨주면 자동으로 보여요.
          </p>
        </div>
      </div>

      <hr style="border:none;border-top:1px solid #eee; margin:16px 0;">

      <div class="row">
        <h3 style="margin:0;">자유게시판</h3>
        <a class="muted" href="/board/list" style="text-decoration:none;">더보기</a>
      </div>

      <c:choose>
		  <c:when test="${empty freeList}">
		    <p class="muted">최근 글이 없습니다.</p>
		  </c:when>
		  <c:otherwise>
		    <ul class="list">
		      <c:forEach var="b" items="${freeList}">
		        <li>
		          <a href="/board/detail?bno=${b.bno}" style="text-decoration:none;">
		            ${b.btitle}
		          </a>
		          <span class="muted">
		            · <fmt:formatDate value="${b.bdate}" pattern="MM-dd"/>
		          </span>
		        </li>
		      </c:forEach>
		    </ul>
		  </c:otherwise>
	  </c:choose>
    </section>

    <!-- 오른쪽 사이드 카드들 -->
    <aside style="display:flex; flex-direction:column; gap:16px;">

      <section class="card">
        <div class="row">
          <h3 style="margin:0;">공지사항</h3>
          <a class="muted" href="/notice/list" style="text-decoration:none;">더보기</a>
        </div>

        <c:choose>
		  <c:when test="${empty noticeList}">
		    <p class="muted">공지사항이 없습니다.</p>
		  </c:when>
		  <c:otherwise>
		    <ul class="list">
		      <c:forEach var="n" items="${noticeList}">
		        <li>
		          <a href="/notice/detail?nno=${n.nno}" style="text-decoration:none;">
		            ${n.ntitle}
		          </a>
		          <span class="muted">
		            · <fmt:formatDate value="${n.ndate}" pattern="MM-dd"/>
		          </span>
		        </li>
		      </c:forEach>
		    </ul>
		  </c:otherwise>
		</c:choose>
      </section>

      <section class="card">
        <h3>빠른 메뉴</h3>
        <div class="btnrow">
          <a class="btn secondary" href="/cart/list">장바구니</a>
          <a class="btn secondary" href="/orderpay/list">주문내역</a>
          <a class="btn secondary" href="/board/list">자유게시판</a>
        </div>
      </section>

    </aside>
  </div>

  <div class="foot">© JOOMAC Project</div>
</div>

</body>
</html>
