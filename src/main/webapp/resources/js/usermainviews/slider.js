/* 
  메인 이미지 슬라이드 
*/

const outer = document.querySelector('.outer');
const innerList = document.querySelector('.inner-list');
const inners = document.querySelectorAll('.inner');
let currentIndex = 0; // 현재 슬라이드 화면 인덱스
const IMAGE_WIDTH = 1214; // 한번 이동 시 IMAGE_WIDTH만큼 이동한다.

function adjustSlideSize() {
  inners.forEach((inner) => {
    inner.style.width = `${outer.clientWidth}px`; // inner의 width를 모두 outer의 width로 만들기
  });

  innerList.style.width = `${outer.clientWidth * inners.length}px`; // innerList의 width를 inner의 width * inner의 개수로 만들기

  innerList.style.marginLeft = `-${outer.clientWidth * currentIndex}px`; // 슬라이드 위치도 조절
}

// 창 크기가 변경될 때 슬라이드 크기를 조절하는 이벤트 추가
window.addEventListener('resize', adjustSlideSize);

// 초기화
adjustSlideSize();

/*
  버튼에 이벤트 등록하기
*/
const buttonLeft = document.querySelector('.back');
const buttonRight = document.querySelector('.next');

buttonLeft.addEventListener('click', () => {
  currentIndex--;
  if (currentIndex < 0) {
    currentIndex =  inners.length -1;
  } // index값이 0보다 작아질 경우 마지막 장으로 변경
  innerList.style.marginLeft = `-${outer.clientWidth * currentIndex}px`; // index만큼 margin을 주어 옆으로 밀기
  resetInterval(); // setInterval 재설정
});

buttonRight.addEventListener('click', () => {
  currentIndex++;
  currentIndex = currentIndex >= inners.length ? 0 : currentIndex; // index값이 inner의 총 개수보다 많아질 경우 첫 번째로 초기화
  innerList.style.marginLeft = `-${outer.clientWidth * currentIndex}px`; // index만큼 margin을 주어 옆으로 밀기
  resetInterval(); // setInterval 재설정
});

/*
  주기적으로 화면 넘기기
*/
let interval = getInterval(); // interval 등록

function getInterval() {
  return setInterval(() => {
    currentIndex++;
    currentIndex = currentIndex >= inners.length ? 0 : currentIndex;
    innerList.style.marginLeft = `-${outer.clientWidth * currentIndex}px`;
  }, 4000);
}

function resetInterval() {
  clearInterval(interval); // 기존 동작되던 interval 제거
  interval = getInterval(); // 새로운 interval 등록
}

/*
  알림판 행사 이미지 슬라이드 
*/

const slideIndex = 0;

showSlides();

// 이미지 슬라이드 함수
function showSlides() {
  let i;
  const slides = document.getElementById("imageSlider").getElementsByTagName("images");

  // 모든 이미지를 숨김
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";  
  }

  slideIndex++;
  if (slideIndex > slides.length) {slideIndex = 1}    

  // 현재 이미지를 보여줌
  slides[slideIndex-1].style.display = "block";  

  // 4초마다 다음 이미지를 보여줌
  setTimeout(showSlides, 4000);
}
