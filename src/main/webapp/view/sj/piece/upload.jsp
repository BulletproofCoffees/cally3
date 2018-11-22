<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class=" col-md-12"  style="margin-top: 15px;">
<div class=" col-md-6">
	<div class="showback"  style="
    height: 180px;
">
		<input type="file" id="input-file-now" class="dropify"
			data-height="100" data-default-file="" />
		<button type="button" class="btn btn-primary col-md-2 col-md-offset-10" style="margin-top: 10px;">up</button>
	</div>
	</div>
	<div class=" col-md-6">
	<!-- <div class=" showback">
		<img style="max-width: 100%; height: auto"
			src="https://www.eatwell101.com/wp-content/uploads/2018/09/shrimp-recipes-for-dinner.jpg">
	</div> -->
	</div>
</div>





<!-- 이미지 업로드 스크립트 -->  
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,300,700,900|Roboto+Condensed:400,300,700' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/sj/lib/dist/css/dropify.min.css">
    <link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
 
<script src="${pageContext.request.contextPath}/sj/lib/dist/js/dropify.min.js"></script>
        <script>
            $(document).ready(function(){
                // Basic
                $('.dropify').dropify();


                // Used events
                var drEvent = $('.dropify-event').dropify();

                drEvent.on('dropify.beforeClear', function(event, element){
                    return confirm("Do you really want to delete \"" + element.filename + "\" ?");
                });

                drEvent.on('dropify.afterClear', function(event, element){
                    alert('File deleted');
                });
            });
        </script><script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-36251023-1']);
  _gaq.push(['_setDomainName', 'jqueryscript.net']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>


