<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <link rel="stylesheet" href="${pageContext.request.contextPath}/sj/jqbar.css" />        
                    <div id="bar-1" class="col-md-12 ">
                    </div>
                    <div id="bar-2">
                    </div>
                    <div id="bar-3">
                    </div>
                   

        
    <script src="${pageContext.request.contextPath}/sj/jqbar.js" type="text/javascript"></script>
    <script type="text/javascript">

        $(document).ready(function () {

            $('#bar-1').jqbar({ label: '탄수화물', value: 99, barColor: '#D64747' });

            $('#bar-2').jqbar({ label: 'C#', value: 99, barColor: '#FF681F' });

            $('#bar-3').jqbar({ label: 'Javascript', value: 90, barColor: '#ea805c' });

          
        });
    </script>
