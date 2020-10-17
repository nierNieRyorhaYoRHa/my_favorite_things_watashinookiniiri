if (document.URL.match( /new/ ) || document.URL.match( /things/ )) {
  document.addEventListener('DOMContentLoaded', function(){
    const ImageList = document.getElementById('image-list');

        // 選択した画像を表示する関数
        const createImageHTML = (blob) => {
          // 画像を表示するためのdiv要素を生成
        const imageElement = document.createElement('div');
  
        // 表示する画像を生成
        const blobImage = document.createElement('img');
        blobImage.setAttribute('src', blob);
        blobImage.width = 600;
        blobImage.id = 'thingimage';

        // 生成したHTMLの要素をブラウザに表示させる
        imageElement.appendChild(blobImage);
        ImageList.appendChild(imageElement);
      };

    document.getElementById('thing-image').addEventListener('change', function(e){
      const imageContent = document.getElementById('thingimage');
      if (imageContent){
        imageContent.remove();
      }
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);

      createImageHTML(blob);

    });
  });
}
