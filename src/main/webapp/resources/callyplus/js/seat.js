			
				var price = Number($('input[name="s_pay"]').val());
				$(document).ready(function() {
					var $cart = $('#selected-seats'), //Sitting Area
					$counter = $('#counter'), //Votes
					$total = $('#total'); //Total money
					var sc = $('#seat-map').seatCharts({
						map: [  //Seating chart
							'aaaaaaaaaa',
							'aaaaaaaaaa',
							'__________',
							'aaaaaaaa__',
							'aaaaaaaaaa',
							'aaaaaaaaaa',
							'aaaaaaaaaa',
							'aaaaaaaaaa',
							'aaaaaaaaaa',
							'__aaaaaa__'
						],
						naming : {
							top : false,
							getLabel : function (character, row, column) {
								return column;
							}
						},
						legend : { //Definition legend
							node : $('#legend'),
							items : [
								[ 'a', 'available',   '예약가능' ],
								[ 'a', 'unavailable', '예약석'],
								[ 'a', 'selected', '선택한 좌석']
							]					
						},
						click: function () { //Click event
							if (this.status() == 'available') { //optional seat
								$('<li>'+(this.settings.row+1)+'열'+this.settings.label+'번</li>')
									.attr('id', 'cart-item-'+this.settings.id)
									.data('seatId', this.settings.id)
									.appendTo($cart);
									$counter.text(sc.find('selected').length+1+"장");
									$total.text(recalculateTotal(sc)+price+"원");
									
								var seatName = $('#selected-seats').find('li');
								$.ajax({
									url : "/cally/movie/seatAdd",
									data : {
										mr_no : $('input[name="maxRes"]').val(),
										msp_name : this.settings.id
									},
									type : 'POST',
									dataType : 'text',
									success : function(data){
									},
									error : function (request, error) {
								        console.log(arguments);
								        alert("seat >  Can't do because: " + error);
								    }
								});		
								return 'selected';
								
							} else if (this.status() == 'selected') { //Checked
									//Update Number
									$counter.text(sc.find('selected').length-1+"장");
									//update totalnum
									$total.text(recalculateTotal(sc)-price+"원");
										
									//Delete reservation
									$('#cart-item-'+this.settings.id).remove();
									//optional
									return 'available';
							} else if (this.status() == 'unavailable') { //sold
								return 'unavailable';
							} else {
								return this.style();
							}
						}
					});

					//sold seat		
					$.ajax({
						url : "/cally/movie/call_seat",
						data : {
							ms_no : $('input[name="ms_no"]').val(),
							detail : $('input[name="detail"]').val(),
							cno : $('input[name="cno"]').val()
						},
						type : "POST",
						dataType : "JSON",
						success : function(response){	
							for(var i in response){
								sc.get([response[i].MSP_NAME]).status('unavailable');
								console.log(response);
							}

						}
					});	
				});
				//sum total money
				function recalculateTotal(sc) {
					var total = 0;
					sc.find('selected').each(function () {
						total += price;
					});
							
					return total;
				}
				
