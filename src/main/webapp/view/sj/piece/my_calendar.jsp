<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/sj/lib/demo/dist/css/pignose.calendar.min.css"/>
  <style>

.pignose-calendar{ }
</style>
    
    	   <div class="calendar2" style="margin-bottom: 15px;"></div>
        <div class="box"></div>
    
    

<script type="text/javascript" src="${pageContext.request.contextPath}/sj/lib/demo/dist/js/pignose.calendar.full.min.js"></script>
<script type="text/javascript">
    //<![CDATA[
    $(function () {
        $('#wrapper .version strong').text('v' + $.fn.pignoseCalendar);
       
        function onSelectHandler(date, context) {
        	
            var $calendar = context.calendar;
            var text = '';

            if (date[0] !== null) {
                text += date[0].format('YYYY-MM-DD');
            	
            }
          
            $(location).attr("href","${pageContext.request.contextPath}/sj/counter/="+text);
        }

        function onApplyHandler(date, context) {
            /**
             * @date is an array which be included dates(clicked date at first index)
             * @context is an object which stored calendar interal data.
             * @context.calendar is a root element reference.
             * @context.calendar is a calendar element reference.
             * @context.storage.activeDates is all toggled data, If you use toggle type calendar.
             * @context.storage.events is all events associated to this date
             */
            
            var $element = context.element;
            var $calendar = context.calendar;
            var $box = $element.siblings('.box').show();
            var text = 'You applied date ';

            if (date[0] !== null) {
                text += date[0].format('YYYY-MM-DD');
               
            }

            if (date[0] !== null && date[1] !== null) {
                text += ' ~ ';
            }
            else if (date[0] === null && date[1] == null) {
                text += 'nothing';
                
            }

            if (date[1] !== null) {
                text += date[1].format('YYYY-MM-DD');
            }

            $box.text(text);
         
          
        }
        // Default Calendar
        $('.calendar2').pignoseCalendar({
            select: onSelectHandler
           
          
        }); 
        var url = decodeURIComponent(location.href);      
        var params = decodeURIComponent(location.href).substring( url.indexOf('=')+1, url.length ); 
       
        console.log($("div.pignose-calendar-body").find('div').attr('data-date') == params);
    });
    //]]>
    
    
    
    
    $(function(){       
        var url = decodeURIComponent(location.href);      
        var params = decodeURIComponent(location.href).substring( url.indexOf('=')+1, url.length );
     
        var url = params
      
        
        
          
     });
</script>
    
