<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%--  <link href='http://fonts.googleapis.com/css?family=Roboto:400,300,700,900|Roboto+Condensed:400,300,700' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/sj/lib/dist/css/demo.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/sj/lib/dist/css/dropify.min.css">
        <link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css"> --%>
        
<script type="text/javascript"
src="http://pagead2.googlesyndication.com/pagead/show_ads.js"></script>

     
<!-- -------------------------------------------------------------------------- -->
  
                    <input type="file" id="input-file-now" class="dropify" data-default-file="" />
                    
                    
    
  
<!-- -------------------------------------------------------------------------- -->
    
<!--   <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
 -->        <script src="${pageContext.request.contextPath}/sj/lib/dist/js/dropify.min.js"></script>
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