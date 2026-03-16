<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LOG.GG</title>
    <style>
        @import url('https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css');

        :root {
            --primary-navy: #334155; /* 이미지 헤더 색상 반영 */
            --accent-blue: #3b82f6;
            --bg-soft: #f1f5f9;      /* 이미지 배경색 반영 */
            --card-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05);
            --container-width: 1440px; 
            --container-height: 1024px;
            --sidebar-width: 260px;  /* 이미지 비율 기반 조정 */
        }

        body {
            margin: 0; padding: 0;
            font-family: 'Pretendard', sans-serif;
            background-color: var(--bg-soft);
            color: #1e293b;
            /* 1440x1024 고정 및 중앙 정렬 */
            width: var(--container-width);
            min-height: var(--container-height);
            margin: 0 auto;
            overflow-x: hidden;
        }

        /* 공통 헤더 */
        header {
            background: var(--primary-navy);
            padding: 0 40px;
            display: flex; justify-content: space-between; align-items: center;
            height: 55px;
            color: white;
        }

        .header-left { display: flex; align-items: center; gap: 8px; font-size: 13px; cursor: pointer; }
        .user-nav { display: flex; gap: 20px; align-items: center; font-size: 13px; }
        .user-nav span { cursor: pointer; color: #cbd5e1; }
        .user-nav b { color: white; font-weight: 600; }
        .user-nav span:hover { color: white; }

        .btn-logout {
            padding: 5px 12px;
            background: white;
            color: #1e293b;
            border: none;
            border-radius: 4px;
            font-weight: 700;
            font-size: 12px;
            cursor: pointer;
        }

        /* 메인 레이아웃 */
        .main-layout {
            display: grid;
            grid-template-columns: var(--sidebar-width) 1fr var(--sidebar-width);
            gap: 25px;
            padding: 40px; /* 여백 조정 */
            box-sizing: border-box;
        }

        /* 사이드바 공통 */
        .side-card {
            background: white;
            padding: 24px;
            border-radius: 20px; /* 더 둥글게 */
            box-shadow: var(--card-shadow);
        }

        .side-card h3 {
            font-size: 16px;
            font-weight: 700;
            margin: 0 0 20px 0;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .admin-tool-btn {
            font-size: 11px;
            background: #f1f5f9;
            padding: 3px 8px;
            border-radius: 6px;
            font-weight: 500;
            color: #64748b;
            border: 1px solid #e2e8f0;
        }

        .side-left h3 { border-left: 4px solid var(--accent-blue); padding-left: 12px; }

        .list-item {
            font-size: 14px;
            padding: 10px 0;
            color: #475569;
            cursor: pointer;
        }
        .list-item b { color: #1e293b; display: block; margin-bottom: 2px; }
        .list-item span.date { font-size: 12px; color: var(--accent-blue); }

        /* 중앙 컨텐츠 영역 */
        .content-area { display: flex; flex-direction: column; gap: 30px; }

        .top-row { display: flex; justify-content: space-between; align-items: flex-end; margin-bottom: 5px; }
        .logo { font-size: 32px; font-weight: 900; color: var(--primary-navy); letter-spacing: -0.5px; }

        .search-bar {
            background: white;
            border-radius: 12px;
            padding: 10px 20px;
            width: 320px;
            display: flex;
            align-items: center;
            border: 1px solid #e2e8f0;
            box-shadow: 0 2px 4px rgba(0,0,0,0.02);
        }
        .search-bar input { border: none; outline: none; width: 100%; font-size: 14px; color: #1e293b; }
        .search-bar input::placeholder { color: #94a3b8; }
        .search-bar span { color: var(--accent-blue); font-size: 16px; }

        /* 게시판 섹션 */
        .board-card {
            background: white;
            border-radius: 20px;
            box-shadow: var(--card-shadow);
            min-height: 400px;
            overflow: hidden;
        }

        .tab-menu { display: flex; background: #f8fafc; padding: 0 10px; border-bottom: 1px solid #f1f5f9; }
        .tab-item {
            padding: 16px 20px;
            cursor: pointer;
            font-size: 14px;
            font-weight: 600;
            color: #64748b;
            transition: var(--transition);
        }
        .tab-item.active { color: var(--accent-blue); position: relative; }
        .tab-item.active::after {
            content: ''; position: absolute; bottom: 0; left: 0; width: 100%; height: 2px; background: var(--accent-blue);
        }

        .tab-content { padding: 0; }
        .board-row {
            display: flex;
            padding: 18px 25px;
            border-bottom: 1px solid #f8fafc;
            font-size: 14px;
            align-items: center;
        }
        .board-row.header-row { background: transparent; color: #94a3b8; font-size: 12px; font-weight: 600; border-bottom: 1px solid #f1f5f9; }

        .col-likes { width: 60px; text-align: left; color: var(--accent-blue); font-weight: 700; }
        .col-title { flex: 1; padding-right: 20px; font-weight: 500; color: #334155; }
        .col-author { width: 100px; text-align: center; color: #64748b; }
        .col-date { width: 80px; text-align: right; color: #94a3b8; }

        /* 하단 그리드 */
        .bottom-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 30px; }
        .grid-section h4 { font-size: 16px; font-weight: 800; margin: 0 0 15px 0; color: #1e293b; }
        .grid-items { display: flex; gap: 20px; }
        .placeholder-box { flex: 1; height: 180px; background: #e2e8f0; border-radius: 15px; transition: var(--transition); }
        .placeholder-box:hover { background: #cbd5e1; }

        /* 우측 공지사항 */
        .side-right .side-card { background: #cbd5e1; border: none; } /* 이미지의 그레이시 블루 톤 */
        .side-right h3 { color: #334155; }
        .btn-notice-reg { font-size: 11px; border: none; padding: 4px 10px; border-radius: 6px; background: white; color: #475569; font-weight: 600; cursor: pointer; }

        footer { margin-top: auto; padding: 40px; text-align: center; font-size: 13px; color: #94a3b8; }
    </style>
</head>
<body>

<header>
    <div class="header-left">☰ 메인페이지 ▾</div>
    <div class="user-nav">
        <span>게시글 추가</span>
        <span>마이페이지</span>
        <span>개인정보 수정</span>
        <span>⚙️ <b>ADMIN01</b> 님</span>
        <button class="btn-logout">로그아웃</button>
    </div>
</header>

<div class="main-layout">
    <aside class="side-left">
        <div class="side-card">
            <h3>게임별 패치노트 <span class="admin-tool-btn">관리자 도구</span></h3>
            <div class="list-item"><b>오버워치</b> <span class="date">2026.03.05</span></div>
            <div class="list-item"><b>배틀그라운드</b> <span class="date">2026.02.05</span></div>
            <div class="list-item"><b>리그 오브 레전드</b> <span class="date">2026.01.15</span></div>
        </div>
    </aside>

    <main class="content-area">
        <div class="top-row">
            <div class="logo">LOG.GG</div>
            <div class="search-bar">
                <input type="text" placeholder="관심 있는 글을 검색해보세요.">
                <span>🔍</span>
            </div>
        </div>

        <div class="board-card">
            <div class="tab-menu">
                <div class="tab-item active">인기 게시글</div>
                <div class="tab-item">리그 오브 레전드</div>
                <div class="tab-item">오버워치</div>
                <div class="tab-item">배틀그라운드</div>
            </div>
            <div class="tab-content">
                <div class="board-row header-row">
                    <div class="col-likes">공감수</div>
                    <div class="col-title">제목</div>
                    <div class="col-author">작성자</div>
                    <div class="col-date">작성일</div>
                </div>
                <div class="board-row">
                    <div class="col-likes">150</div>
                    <div class="col-title">LOG.GG 커뮤니티 이용 규칙 필독 가이드</div>
                    <div class="col-author">관리자</div>
                    <div class="col-date">03.01</div>
                </div>
            </div>
        </div>

        <div class="bottom-grid">
            <div class="grid-section">
                <h4>갤러리</h4>
                <div class="grid-items">
                    <div class="placeholder-box"></div>
                    <div class="placeholder-box"></div>
                </div>
            </div>
            <div class="grid-section">
                <h4>인게임 소식</h4>
                <div class="grid-items">
                    <div class="placeholder-box"></div>
                    <div class="placeholder-box"></div>
                </div>
            </div>
        </div>
    </main>

    <aside class="side-right">
        <div class="side-card">
            <h3>공지사항 <button class="btn-notice-reg">공지 등록</button></h3>
            <div class="list-item" style="color: #334155;">• 공개 테스트 서버 안내</div>
            <div class="list-item" style="color: #334155;">• 웹사이트 업데이트 내역</div>
        </div>
    </aside>
</div>

<footer>© 2026 LOG.GG 커뮤니티 플랫폼. 모든 권리 보유.</footer>

<script>
    const tabs = document.querySelectorAll('.tab-item');
    tabs.forEach(tab => {
        tab.addEventListener('click', () => {
            tabs.forEach(t => t.classList.remove('active'));
            tab.classList.add('active');
        });
    });
</script>
</body>
</html>