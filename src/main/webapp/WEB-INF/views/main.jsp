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
  body { margin:0; font-family: Arial, sans-serif; background:#f6f7fb; color:#222; }
  .wrap { max-width: 1100px; margin: 0 auto; padding: 20px; }

  /* Header */
  header { background:#fff; border-bottom:1px solid #e8e8e8; }
  .topbar { display:flex; align-items:center; justify-content:space-between; gap:16px; padding:16px 20px; }
  .brand { display:flex; align-items:center; gap:12px; }
  .brand h1 { margin:0; font-size:22px; letter-spacing:1px; }
  .brand img { width:120px; height:auto; }

  .auth { display:flex; align-items:center; gap:10px; flex-wrap:wrap; }
  .auth a { text-decoration:none; padding:8px 12px; border-radius:8px; background:#f1f3f8; color:#222; }
  .auth a:hover { background:#e9ecf5; }
  .welcome { font-weight:700; }

  /* Nav */
  nav { background:#fff; }
  .menu { display:flex; gap:10px; flex-wrap:wrap; padding: 0 20px 16px; }
  .menu a { text-decoration:none; padding:10px 14px; border-radius:10px; background:#fff; border:1px solid #e6e6e6; color:#222; }
  .menu a:hover { border-color:#cfd6ff; box-shadow:0 2px 10px rgba(0,0,0,0.05); }

  .badge { display:inline-block; margin-left:6px; padding:2px 8px; border-radius:999px; background:#ff3b30; color:#fff; font-size:12px; font-weight:700; }
  .badge.gray { background:#6b7280; }

  /* Main cards */
  .grid { display:grid; grid-template-columns: 2fr 1fr; gap:16px; margin-top:18px; }
  .card { background:#fff; border:1px solid #e8e8e8; border-radius:14px; padding:16px; }
  .card h2 { margin:0 0 10px; font-size:18px; }
  .card h3 { margin:0 0 10px; font-size:16px; }

  .hero { display:flex; justify-content:space-between; align-items:flex-start; gap:16px; }
  .hero .desc { line-height:1.6; color:#444; }
  .btnrow { display:flex; gap:10px; flex-wrap:wrap; margin-top:12px; }
  .btn { text-decoration:none; padding:10px 14px; border-radius:10px; border:1px solid #e6e6e6; background:#111827; color:#fff; }
  .btn.secondary { background:#fff; color:#111827; }
  .btn:hover { opacity:0.92; }

  /* Lists */
  .list { margin:0; padding-left:18px; }
  .list li { margin:8px 0; }
  .muted { color:#6b7280; font-size:13px; }
  .row { display:flex; justify-content:space-between; align-items:center; gap:12px; }

  /* Footer-ish */
  .foot { margin-top:16px; text-align:center; color:#8b8b8b; font-size:12px; }
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

          <!-- 관리자만 관리자페이지 -->
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

      <!-- 고객문의: 관리자면 답변대기 뱃지, 회원이면 내 문의 뱃지 -->
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

    <!-- 왼쪽 큰 카드 -->
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
        <c:when test="${empty recentQuestions}">
          <p class="muted">최근 문의가 없습니다.</p>
        </c:when>
        <c:otherwise>
          <ul class="list">
            <c:forEach var="q" items="${recentQuestions}">
              <li>
                <a href="/question/detail?qno=${q.qno}" style="text-decoration:none;">
                  ${q.qtitle}
                </a>
                <span class="muted">
                  · <fmt:formatDate value="${q.qdate}" pattern="MM-dd"/>
                  · ${q.qstatus}
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
          <c:when test="${empty recentNotices}">
            <p class="muted">공지사항이 없습니다.</p>
          </c:when>
          <c:otherwise>
            <ul class="list">
              <c:forEach var="n" items="${recentNotices}">
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
          <a class="btn secondary" href="/board/list">자게</a>
        </div>
      </section>

    </aside>
  </div>

  <div class="foot">© JOOMAC Project</div>
</div>

</body>
</html>
