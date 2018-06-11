  <div class="clear"></div>

	<footer>
		<address>All contents copyright YNG Corp, Itd. Contact: webmaster@yngmastergrin.com<br>
		서울특별시 강남구 신사동 123-34 | Tel : +82-2-123-4567 Fax: +82-2123-4568</address>
	</footer>

  </div>
 </BODY>
</HTML>

<script src="http://code.jquery.com/jquery-latest.js">
</script>
<%@ page language="java" contentType="text/html;charset=UTF-8"%>

<script src="scripts/jquery.nivo.slider.js">
</script>
<script>
	$(window).load(function(){
		$('#slider').nivoSlider();
	});

	$(document).ready(function() {

		//Default Action
		$(".tab_content").hide(); //Hide all content
		$("ul.tabs li:first").addClass("active").show(); //Activate first tab
		$(".tab_content:first").show(); //Show first tab content
		
		//On Click Event
		$("ul.tabs li").click(function() {
			$("ul.tabs li").removeClass("active"); //Remove any "active" class
			$(this).addClass("active"); //Add "active" class to selected tab
			$(".tab_content").hide(); //Hide all tab content
			var activeTab = $(this).find("a").attr("href"); //Find the rel attribute value to identify the active tab + content
			$(activeTab).fadeIn(); //Fade in the active content
			return false;
		});

	});
</script>

<script src="scripts/jquery.fancybox.pack.js">
</script>
<script>
	$(document).ready(function() {
		$(".fancybox").fancybox({
			openEffect:'none',
			closeEffect:'none'
		});
	});
</script>

<script>
	var dropbox=document.getElementById('imgBG');
	dropbox.addEventListener('dragenter', stopDefault, false);
	dropbox.addEventListener('dragover', stopDefault, false);
	dropbox.addEventListener('dragleave', stopDefault, false);
	dropbox.addEventListener('drop', onDrop, false);

	function stopDefault(e){
		e.stopPropagation();
		e.preventDefault();
	}
	function onDrop(e){
		e.stopPropagation();
		e.preventDefault();

		var readFileSize=0;
		var files=e.dataTransfer.files;
		file=files[0];
		readFileSize += file.fileSize;
		
		var imageType=/image.*/;
		if (!file.type.match(imageType)){
			return;
		}
		var reader=new FileReader();
		reader.onerror=function(e){
			alert('Error code: ' +e.targer.error);
		};

		reader.onload=(function(aFile){
			return function(evt){
				dropbox.src=evt.target.result;
			}
		})(file);

		reader.readAsDataURL(file);
	}
</script>