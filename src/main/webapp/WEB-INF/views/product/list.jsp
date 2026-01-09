<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주류 상품 목록</title>

<style>
/* ====== Base ====== */
:root{
  --bg: #f7f3ef;
  --card: #fff8f2;
  --brown: #4a3420;
  --brown2:#7d5430;
  --accent:#b6895c;
  --accent2:#a86932;
  --header:#e6c9a1;
  --border:#d7b894;
  --shadow: 0 2px 10px rgba(125, 60, 34, 0.12);
}

*{ box-sizing:border-box; }

body{
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  background: var(--bg);
  color: var(--brown);
  margin: 0;
  padding: 18px 16px 60px;
}

.container{
  max-width: 1200px;
  margin: 0 auto;
}

h2{
  text-align:center;
  color:#6b4b28;
  margin: 10px 0 18px;
  font-weight: 800;
  letter-spacing: 1px;
  text-shadow: 1px 1px 1px #e5c8a1;
}

/* ====== Category Tabs (사진 느낌: 가로 스크롤) ====== */
.category-menu{
  display:flex;
  gap:10px;
  overflow-x:auto;
  padding: 10px 4px 14px;
  margin-bottom: 10px;
  scroll-snap-type: x mandatory;
}
.category-menu::-webkit-scrollbar{ height: 8px; }
.category-menu::-webkit-scrollbar-thumb{
  background: rgba(182,137,92,0.35);
  border-radius: 20px;
}
.category-menu a{
  flex: 0 0 auto;
  scroll-snap-align: start;
  display:inline-flex;
  align-items:center;
  justify-content:center;
  padding: 9px 16px;
  border-radius: 999px;
  border: 2px solid var(--accent);
  color: var(--brown2);
  font-weight: 700;
  background: var(--card);
  text-decoration:none;
  box-shadow: 0 2px 6px rgba(125, 60, 34, 0.10);
  transition: .2s ease;
  white-space: nowrap;
}
.category-menu a:hover{
  transform: translateY(-2px);
  background: var(--accent);
  color:#fff;
}
.category-menu a.active{
  background: var(--accent);
  color:#fff;
  box-shadow: 0 6px 14px rgba(125, 60, 34, 0.18);
  transform: translateY(-2px);
}

/* ====== Grid ====== */
.grid{
  display:grid;
  grid-template-columns: repeat(4, minmax(0, 1fr));
  gap: 16px;
  margin-top: 6px;
}

@media (max-width: 1024px){
  .grid{ grid-template-columns: repeat(3, 1fr); }
}
@media (max-width: 768px){
  .grid{ grid-template-columns: repeat(2, 1fr); gap: 12px; }
}
@media (max-width: 420px){
  .grid{ grid-template-columns: 1fr; }
}

/* ====== Product Card ====== */
.card{
  background: var(--card);
  border: 1px solid rgba(215,184,148,0.7);
  border-radius: 16px;
  overflow: hidden;
  box-shadow: var(--shadow);
  transition: transform .18s ease, box-shadow .18s ease;
}
.card:hover{
  transform: translateY(-3px);
  box-shadow: 0 10px 22px rgba(125, 60, 34, 0.18);
}

.thumb{
  position: relative;
  background: #fff;
  padding: 12px;
  height: 200px;
  display:flex;
  align-items:center;
  justify-content:center;
}
.thumb img{
  max-height: 100%;
  max-width: 100%;
  border-radius: 12px;
  box-shadow: 0 2px 8px rgba(125,60,34,0.15);
  transition: transform .2s ease;
}
.card:hover .thumb img{
  transform: scale(1.03);
}

.badge{
  position:absolute;
  top: 10px;
  left: 10px;
  padding: 6px 10px;
  border-radius: 999px;
  font-size: 12px;
  font-weight: 800;
  letter-spacing: .2px;
  color:#fff;
  box-shadow: 0 6px 12px rgba(0,0,0,0.12);
}
.badge.soldout{ background: #b85c38; }
.badge.stock{ background: var(--accent); }

.body{
  padding: 12px 12px 14px;
}

.name{
  font-size: 15px;
  font-weight: 800;
  color: var(--brown);
  line-height: 1.25;
  margin: 0 0 8px;
  height: 38px;           /* 2줄 정도 고정 */
  overflow:hidden;
}

.meta{
  display:flex;
  align-items:center;
  justify-content: space-between;
  gap: 10px;
  margin-bottom: 10px;
}

.price{
  font-size: 15px;
  font-weight: 900;
  color: var(--brown);
  white-space: nowrap;
}

.cat{
  font-size: 12px;
  font-weight: 800;
  color: var(--brown2);
  background: #fff;
  border: 1px solid var(--border);
  padding: 6px 10px;
  border-radius: 999px;
  text-decoration:none;
  white-space: nowrap;
}
.cat:hover{
  border-color: var(--accent);
  color: var(--accent2);
}

/* ====== Admin actions (수정/삭제) ====== */
.actions{
  display:flex;
  gap: 8px;
  margin-top: 6px;
}
.actions a{
  flex: 1;
  display:inline-flex;
  align-items:center;
  justify-content:center;
  padding: 10px 0;
  border-radius: 999px;
  font-weight: 800;
  text-decoration:none;
  transition: .18s ease;
  box-shadow: 0 4px 10px rgba(125, 60, 34, 0.18);
  border: none;
}

.actions .edit{
  background: #7d5430;
  color:#fff;
}
.actions .edit:hover{
  background:#6b4425;
  transform: translateY(-2px);
}

.actions .del{
  background: #b85c38;
  color:#fff;
}
.actions .del:hover{
  background:#a14e2f;
  transform: translateY(-2px);
}

/* ====== Register Button ====== */
#register-btn{
  display:block;
  width: 180px;
  margin: 26px auto 0;
  padding: 13px 0;
  background: var(--accent);
  color:#fff;
  font-weight: 900;
  border-radius: 999px;
  text-align:center;
  text-decoration:none;
  box-shadow: 0 6px 16px rgba(125, 60, 34, 0.22);
  transition: .2s ease;
}
#register-btn:hover{
  background: var(--accent2);
  transform: translateY(-2px);
}

/* Empty state */
.empty{
  background: var(--card);
  border: 1px dashed rgba(182,137,92,0.6);
  border-radius: 16px;
  padding: 30px;
  text-align:center;
  color: var(--brown2);
}
</style>
</head>

<body>
<div class="container">
  <h2>주류 상품 목록</h2>

  <!-- 상단 카테고리 메뉴 -->
  <div class="category-menu">
      <a href="${pageContext.request.contextPath}/product/list"
         class="${empty category ? 'active' : ''}">전체보기</a>

      <a href="${pageContext.request.contextPath}/product/list?category=소주/증류주"
         class="${category == '소주/증류주' ? 'active' : ''}">소주/증류주</a>

      <a href="${pageContext.request.contextPath}/product/list?category=막걸리/탁주"
         class="${category == '막걸리/탁주' ? 'active' : ''}">막걸리/탁주</a>

      <a href="${pageContext.request.contextPath}/product/list?category=청주/약주"
         class="${category == '청주/약주' ? 'active' : ''}">청주/약주</a>

      <a href="${pageContext.request.contextPath}/product/list?category=과실주"
         class="${category == '과실주' ? 'active' : ''}">과실주</a>

      <a href="${pageContext.request.contextPath}/product/list?category=기타우리술"
         class="${category == '기타우리술' ? 'active' : ''}">기타 우리술</a>
  </div>

  <!-- 카드 그리드 -->
  <c:choose>
    <c:when test="${empty list}">
      <div class="empty">등록된 상품이 없습니다.</div>
    </c:when>

    <c:otherwise>
      <div class="grid">
        <c:forEach var="dto" items="${list}">
          <div class="card">
            <!-- 이미지/뱃지 -->
            <div class="thumb">
              <c:choose>
                <c:when test="${dto.pcount == 0}">
                  <span class="badge soldout">품절</span>
                </c:when>
                <c:otherwise>
                  <span class="badge stock">재고 ${dto.pcount}</span>
                </c:otherwise>
              </c:choose>

              <a href="/product/detail?pno=${dto.pno}" style="display:block; width:100%; height:100%; text-align:center;">
                <c:choose>
                  <c:when test="${not empty dto.pimage}">
                    <img src="/images/${dto.pimage}" alt="상품이미지">
                  </c:when>
                  <c:otherwise>
                    <img src="/images/noimage.png" alt="이미지 없음">
                  </c:otherwise>
                </c:choose>
              </a>
            </div>

            <!-- 내용 -->
            <div class="body">
              <p class="name">${dto.pname}</p>

              <div class="meta">
                <div class="price">${dto.pprice} 원</div>
                <a class="cat" href="${pageContext.request.contextPath}/product/list?category=${dto.pcategory}">
                  ${dto.pcategory}
                </a>
              </div>

              <!-- 관리 -->
              <div class="actions">
                <a class="edit" href="${pageContext.request.contextPath}/product/updateform?pno=${dto.pno}">수정</a>
                <a class="del" href="${pageContext.request.contextPath}/product/delete?pno=${dto.pno}"
                   onclick="return confirm('삭제하시겠습니까?')">삭제</a>
              </div>
            </div>
          </div>
        </c:forEach>
      </div>
    </c:otherwise>
  </c:choose>

  <a href="${pageContext.request.contextPath}/product/write" id="register-btn">상품 등록</a>
</div>
</body>
</html>
