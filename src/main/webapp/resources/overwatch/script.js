
    /* [2. 공통: 탭 메뉴 전환 (메인보드 & 영웅상세)] */
    // .tab-item(메인)과 .d-tab(영웅상세) 모두 처리
    $('.tab-item, .d-tab').on('click', function () {
        // 1. 모든 .d-tab에서 active 클래스 제거 (가장 확실함)
        $('.d-tab').removeClass('active');
        // 2. 클릭한 요소에만 active 클래스 추가
        $(this).addClass('active');
    });