
 //图片滚动展示 Start
 var counts = 4;
 //大图//
 img1 = new Image();
 img1.src = '03.gif';
 img2 = new Image();
 img2.src = '08.gif';
 img4 = new Image();
 img4.src = '09.gif';
 img3 = new Image();
 img3.src = '11.gif';

 var smallImg = new Array();
 //小图
 smallImg[0] = '03.gif';
 smallImg[1] = '09.gif';
 smallImg[2] = '11.gif';
 smallImg[3] = '13.gif';

 //链接地址
 url1 = new Image();
 url1.src = 'http://www.cobberge.com';
 url2 = new Image();
 url2.src = 'http://www.cobberge.com';
 url3 = new Image();
 url3.src = 'http://www.cobberge.com';
  url4 = new Image();
 url4.src = 'http://www.cobberge.com';
 //alt值
 alt1 = new Image();
 alt1.alt = '';
 alt2 = new Image();
 alt2.alt = '';
 alt3 = new Image();
 alt3.alt = '';
  alt4 = new Image();
 alt4.alt = '';
 
 var nn = 1;
 var key = 0;
 function change_img() { 
  if (key == 0) {
   key = 1;
  } else if (document.all) {
   document.getElementById("pic").filters[0].Apply();
   document.getElementById("pic").filters[0].Play(duration = 2);
  }
  eval('document.getElementById("pic").src=img' + nn + '.src');
  eval('document.getElementById("url").href=url' + nn + '.src');
  eval('document.getElementById("pic").alt=alt' + nn + '.alt');
  if (nn == 1) {
   document.getElementById("url").target = "_blank";
   document.getElementById("url").style.cursor = "pointer";
  } else {
   document.getElementById("url").target = "_blank"
   document.getElementById("url").style.cursor = "pointer"
  }
  
  for ( var i = 1; i <= counts; i++) {
   document.getElementById("xxjdjj" + i).className = 'axx';
  }
  document.getElementById("xxjdjj" + nn).className = 'bxx';
  nn++;
  if (nn > counts) {
   nn = 1;
  }
  tt = setTimeout('change_img()', 7000);
 }
 function changeimg(n) {
  nn = n;
  window.clearInterval(tt);
  change_img();
 }
 function ImageShow() {
  document.write('<div class="picshow_main">');
  document.write('<div><a id="url"><img id="pic" class="imgbig" /></a></div>');
  document.write('<div class="picshow_change">');
  for ( var i = 0; i < counts; i++) {
   document.write('<a href="javascript:changeimg(' + (i + 1)
     + ');" id="xxjdjj' + (i + 1)
     + '" class="axx" target="_self"><img src="' + smallImg[i]
     + '"></a>');
  }
  document.write('</div></div>');
  change_img();
 } 
