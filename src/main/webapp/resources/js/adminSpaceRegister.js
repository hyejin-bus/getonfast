
// 공간 이미지 영역을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
$(function() {
  $(".spaceImg" ).on("click", function() {
    const index = $(".spaceImg").index(this);
    // .index(this) : 현재 클릭된 요소의 인덱스 반환 
    $("[type=file]").eq(index).click();
    // 타입이 file인 요소 중 
  });

});

// 각각의 영역에 파일을 첨부 했을 경우 미리 보기가 가능하도록 하는 함수
function loadImg(value, num) {
  if (value.files && value.files[0]) {
    var reader = new FileReader();
    // 자바스크립트 FileReader
    // 웹 애플리케이션이 비동기적으로 데이터를 읽기 위하여 읽을 파일을 가리키는 File 혹은 Blob객체를 이용해 파일의 내용을 읽고 사용자의 컴퓨터에 저장하는 것을 가능하게 해주는 객체

    // 파일이 선택된 경우 true 선택된 파일 읽기 
    reader.readAsDataURL(value.files[0]);
    // FileReader.readAsDataURL()
    // 지정된 내용을 읽기 시작합니다. Blob완료되면 result속성 data:에 파일 데이터를 나타내는 URL이 포함 됩니다.

    // FileReader.onload : 파일 로드가 완려 되면 
    // load 이벤트의 핸들러. 이 이벤트는 읽기 동작이 성공적으로 완료 되었을 때마다 발생합니다.
    reader.onload = function(e) {
      //console.log(e.target.result);
      // e.target.result
      // -> 파일 읽기 동작을 성공한 객체에(fileTag) 올라간 결과(이미지 또는 파일)

      $(".spaceImg").eq(num).children("img").attr("src", e.target.result);
      $(".spaceImg").eq(num).children("label").empty()
    }

  }


//addRoomType btn누르면 룸타입 작성 요소 추가 생성
document.getElementById("addRoomType").addEventListener("click", function(){
	
})

}