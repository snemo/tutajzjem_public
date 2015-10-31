<g:set var="today" value="${formatDate(format:'dd.MM.yyyy',date:new Date())}" />
<g:set var="currentDayName" value="${formatDate(format:'E',date:new Date())}" />

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="tutajzjem">
		<title>TutajZjem.pl - ${restaurant?.name}</title>
		
		<script type="text/javascript" src="${resource(dir: 'js', file: '/fancybox/jquery.fancybox-1.3.4.pack.js')}"></script>
		<script type="text/javascript" src="${resource(dir: 'js', file: 'jquery.dotdotdot.min.js')}"></script>
		<link rel="stylesheet" href="${resource(dir: 'js', file: 'fancybox/jquery.fancybox-1.3.4.css')}" type="text/css" media="screen">
		
		<link href='http://fonts.googleapis.com/css?family=Signika:400,700&subset=latin,latin-ext' rel='stylesheet' type='text/css'/> 
	</head>
	<body>
		
			<div class="restaurant-content centered">
				<div class="restaurant-block-1">
					<div class="restaurant-gallery">
						<div class="restaurant-maim-img-wrap">
							<a id="restaurant-main-img-fancybox" rel="restaurant_img_group" href="<g:createLink controller="image" action="get" id="${restaurant?.mainImage?.identifier}" params="[ext:'.jpg']" />" title="">
								<div class="restaurant-maim-img" style="background: url(<g:createLink controller="image" action="thumbnail" id="${restaurant?.mainImage?.identifier}" params="[size:'big']" />) 50% 50% no-repeat;"></div>
							</a>
						</div>
						<div class="restaurant-thumbs-container">
							<div class="restaurant-thumbs-wrap">
								<div class="restaurant-thumbs" count="${restaurant?.images?.size()}">
									<g:each var="image" in="${restaurant?.images}">
										<div class="restaurant-thumbs-img-wrap" imgid="${image?.identifier}">
											<img class="restaurant-thumbs-img" src="<g:createLink controller="image" action="thumbnail" id="${image?.identifier}" params="[size:'small']" />" alt="TutajZjem.pl">
										</div>
									</g:each>
								</div>
							</div>
							<div class="restaurant-thumbs-btn-prev"></div>
							<div class="restaurant-thumbs-btn-next"></div>
						</div>
					</div>
					
					<div class="restaurant-info">
						<div class="restaurant-info-name orange"><h1>${restaurant?.name }</h1></div>
						<hr class="restaurant-info-hr">
						<div class="restaurant-info-wrap row gray">
							<div class="col-md-8">
								<div class="restaurant-info-address-street">ul. ${restaurant?.streetno }</div>
								<div class="restaurant-info-address-city">${restaurant?.postcode } ${restaurant?.city }</div>
								<g:if test="${ restaurant?.phone1}">
									<div class="restaurant-info-address-tel">Tel.: ${restaurant?.phone1 }</div>
								</g:if>
								<g:if test="${ restaurant?.phone2}">
									<div class="restaurant-info-address-tel">Tel.: ${restaurant?.phone2 }</div>
								</g:if>
								<g:if test="${ restaurant?.webpage}">
									<div class="restaurant-info-address-www"><a class="link" href="http://${restaurant?.webpage }">${restaurant?.webpage }</a></div>
								</g:if>
								<g:if test="${ restaurant?.mail}">
									<div class="restaurant-info-address-email"><a class="link" href="mailto:${restaurant?.mail}">${restaurant?.mail}</a></div>
								</g:if>
							</div>
							<div class="col-md-4">
								<div class="restaurant-info-openhours-label gray">Godziny otwarcia:</div>
								<table class="restaurant-info-openhours-table gray">
									<tbody>
										<tr class="${currentDayName=='Pn'?'restaurant-info-openhours-currentday':''}">
											<td>Pon.${currentDayName }</td>
											<td class="right"><g:formatDate format="HH:mm" date="${restaurant?.mondayOpen}"/> - <g:formatDate format="HH:mm" date="${restaurant?.mondayClosed}"/></td>
										</tr>
										<tr class="${currentDayName=='Wt'?'restaurant-info-openhours-currentday':''}">
											<td>Wt.</td>
											<td class="right"><g:formatDate format="HH:mm" date="${restaurant?.tuesdayOpen}"/> - <g:formatDate format="HH:mm" date="${restaurant?.tuesdayClosed}"/></td>
										</tr>
										<tr class="${currentDayName=='Śr'?'restaurant-info-openhours-currentday':''}">
											<td>Śr.</td>
											<td class="right"><g:formatDate format="HH:mm" date="${restaurant?.wednesdayOpen}"/> - <g:formatDate format="HH:mm" date="${restaurant?.wednesdayClosed}"/></td>
										</tr>
										<tr class="${currentDayName=='Cz'?'restaurant-info-openhours-currentday':''}">
											<td>Czw. </td>
											<td class="right"><g:formatDate format="HH:mm" date="${restaurant?.thursdayOpen}"/> - <g:formatDate format="HH:mm" date="${restaurant?.thursdayClosed}"/></td>
										</tr>
										<tr class="${currentDayName=='Pt'?'restaurant-info-openhours-currentday':''}">
											<td>Pt.</td>
											<td class="right"><g:formatDate format="HH:mm" date="${restaurant?.fridayOpen}"/> - <g:formatDate format="HH:mm" date="${restaurant?.fridayClosed}"/></td>
										</tr>
										<tr class="${currentDayName=='So'?'restaurant-info-openhours-currentday':''}">
											<td>Sob.</td>
											<td class="right"><g:formatDate format="HH:mm" date="${restaurant?.saturdayOpen}"/> - <g:formatDate format="HH:mm" date="${restaurant?.saturdayClosed}"/></td>
										</tr>
										<tr class="${currentDayName=='N'?'restaurant-info-openhours-currentday':''}">
											<td>Nie.</td>
											<td class="right"><g:formatDate format="HH:mm" date="${restaurant?.sundayOpen}"/> - <g:formatDate format="HH:mm" date="${restaurant?.sundayClosed}"/></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<!-- TYP KUCHNI -->
						<!-- TYP LOKALU -->
						<div class="restaurant-types gray">
							<span class="orange bold">Typ lokalu: </span>							
							<g:each var="type" in="${restaurant?.types}">
								${type}
							</g:each>
						</div>
						<div class="restaurant-cuisines gray">
							<span class="orange bold">Kuchnia: </span>
							<g:each var="cuisine" in="${restaurant?.cuisines}">
								${cuisine}
							</g:each>
						</div>
					</div>
				</div>
				
				<div class="restaurant-block-2">
					<!-- MAPA -->
					<div class="restaurant-map">
						<input id="restaurant-map-lat" type="hidden" value="${restaurant?.latitude}">
						<input id="restaurant-map-lng" type="hidden" value="${restaurant?.longitude}">
						<g:if test="${restaurant?.latitude !=null}">
							<div id="restaurant-map-canvas"></div>
						</g:if>
						<g:else>
							<div class="restaurant-empty-map"></div>
						</g:else>
					</div>
					<!-- OPIS -->
					<div class="restaurant-about">
						<hr class="restaurant-info-hr">
						<div class="restaurant-about-name orange">O lokalu</div>
						<div id="restaurant-about-dot" class="restaurant-about-desc gray">${restaurant?.description}</div>
					</div>
				</div>
			</div>
			
			
			<!-- WEEK MENU -->
			<g:if test="${weekMenuParsed != null}">
				<%-- Check if for today exist some menu --%>
				<g:set var="isTodayMenu" value="${false}" />
				<g:each var="day" in="${weekMenuParsed}">
					<g:if test="${today==day?.date}">
						<g:if test="${day?.items!=null && !day?.items.isEmpty()}">
							<g:set var="isTodayMenu" value="${true}" />
						</g:if>
					</g:if>
				</g:each>
				
				<div id="weekmenuanchor" class="restaurant-weekmenu">
					<div class="restaurant-content centered">
						<div class="restaurant-part-title">
							<div class="restaurant-weekmenu-title"></div>
						</div>
						
						<!-- Current day -->
						<g:if test="${isTodayMenu}">
							<div class="restaurant-weekmenu-current restaurant-menu-size">
								<g:each var="day" in="${weekMenuParsed}">
									<g:if test="${today==day?.date}">
										<div class="restaurant-weekmenu-day">
											<div class="restaurant-weekmenu-content">
												<div class="restaurant-weekmenu-header">
													<div class="restaurant-weekmenu-name menu-header orange left">Dziś - ${day?.label}</div>
													<div class="restaurant-weekmenu-openhours right white">
														<span class="glyphicon glyphicon-time"></span>
														${day?.openhoursfromhour}:${day?.openhoursfromminute} - ${day?.openhourstohour}:${day?.openhourstominute}
													</div>
												</div>
												<div class="restaurant-weekmenu-table-cont">
													<table class="restaurant-weekmenu-table white">
														<tbody>
															<g:each var="item" in="${day?.items}">
																<tr>
																	<td class="menu-food">
																		<div class="menu-food-name"><span class="orange">&#8226; </span>${item?.name}</div>
																	</td>
																	<td class="menu-price">${item?.price}</td>
																</tr>
															</g:each>
														</tbody>
													</table>
												</div>
											</div>
										</div>
									</g:if>
								</g:each>
							</div>
						</g:if>
						
						<!-- Whole week -->
						<div class="restaurant-weekmenu-whole restaurant-menu-size" style="${isTodayMenu?'display: none;':''}">
							<g:each var="day" in="${weekMenuParsed}" status="i">
								<g:if test="${day?.items!=null && !day?.items.isEmpty()}">
									<div class="restaurant-weekmenu-day${today==day?.date ? ' today' : ''}">
										<g:if test="${i!=0}">
											<hr class="restaurant-weekmenu-hr">
										</g:if>
										
										<div class="restaurant-weekmenu-content">
											<div class="restaurant-weekmenu-header">
												<div class="restaurant-weekmenu-name menu-header orange left">${day?.label}</div>
												<div class="restaurant-weekmenu-openhours right white">
													<span class="glyphicon glyphicon-time"></span>
													${day?.openhoursfromhour}:${day?.openhoursfromminute} - ${day?.openhourstohour}:${day?.openhourstominute}
												</div>
											</div>
											<div class="restaurant-weekmenu-table-cont">
												<table class="restaurant-weekmenu-table white">
													<tbody>
														<g:each var="item" in="${day?.items}">
															<tr>
																<td class="menu-food">
																	<div class="menu-food-name"><span class="orange">&#8226; </span>${item?.name}</div>
																</td>
																<td class="menu-price">${item?.price}</td>
															</tr>
														</g:each>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</g:if>
							</g:each>
						</div>
						<g:if test="${isTodayMenu}">
							<div class="restaurant-weekmenu-footer">
								<div class="restaurant-weekmenu-next"></div>
							</div>
						</g:if>
					</div>
				</div>
			</g:if>
			
			<!-- PERMANENT MENU -->
			<g:if test="${permanentMenuParsed != null}">
			<div id="menuanchor" class="restaurant-permanentmenu">
				<div class="restaurant-content centered">
					<div class="restaurant-part-title">
						<div class="restaurant-permanentmenu-title"></div>
					</div>
					
					<div class="permanentmenu centred">
						<g:each var="category" in="${permanentMenuParsed}" status="i">
							<div class="permanentmenu-category">
								<g:if test="${i!=0}">
									<hr class="restaurant-permanentmenu-cat-hr">
								</g:if>
								<div class="permanentmenu-category-name menu-header orange">${category?.name }</div>
								
								<table class="restaurant-permanentmenu-table gray table-hover table">
									<tbody>
										<g:each var="item" in="${category.items}">
											<tr>
												<td class="menu-food">
													<div class="menu-food-name"><span class="orange">&#8226; </span>${item?.name}</div>
													<g:if test="${item?.description!=null && item?.description!=''}">
														<div class="menu-food-desc">${item?.description}</div>
													</g:if>
													
												</td>
												<td class="menu-price">${item?.price}</td>
											</tr>
										</g:each>
									</tbody>
								</table>
							</div>
						</g:each>
					</div>
				</div>
			</div>
			</g:if>
			
			<div class="fancybox-gallery">
				<g:each var="image" in="${restaurant?.images}">
					<a rel="restaurant_img_group" href="<g:createLink controller="image" action="get" id="${image?.identifier}" params="[ext:'.jpg']" />" title=""></a>
				</g:each>
			</div>
		
		<script type="text/javascript">
			$(document).ready(function() {
				//ellipsis for description
				$('#restaurant-about-dot').dotdotdot({
						wrap : 'word'
					});
			});	
		</script>
		
		<script type="text/javascript">
			$(document).ready(function() {
				
				var thumb_url = '<g:createLink controller="image" action="thumbnail"/>';
				var img_url = '<g:createLink controller="image" action="get"/>';
				var gallery_thumbwidth = "115";
				var gallery_currentimg = 1;
				
				function getImgQuantity() {
					return $(".restaurant-thumbs").attr("count");
				}
				$(".restaurant-thumbs").css("width", (getImgQuantity()*gallery_thumbwidth)+"px");

				//Scroll prev thumbs 
				$(".restaurant-thumbs-btn-prev").click(function(){
					var scrollPosition = $(".restaurant-thumbs-wrap").scrollLeft();
					scrollPosition -= gallery_thumbwidth*3;
					$(".restaurant-thumbs-wrap").animate({scrollLeft:scrollPosition}, 500);
				});
				//Scroll next thumbs
				$(".restaurant-thumbs-btn-next").click(function(){
					var scrollPosition = $(".restaurant-thumbs-wrap").scrollLeft();
					//alert("next: " + scrollPosition);
					scrollPosition += gallery_thumbwidth*3;
					$(".restaurant-thumbs-wrap").animate({scrollLeft:scrollPosition}, 500);
				});

				//Load image
				$(".restaurant-thumbs-img-wrap").click(function() {
					var imgId = $(this).attr('imgid');
					var url = thumb_url + "/" + imgId + "?size=big";
					var urlBig = img_url + "/" + imgId + "?ext=.jpg";

					$('.restaurant-maim-img').css("background", "url("+url+")  50% 50% no-repeat");
					$('#restaurant-main-img-fancybox').attr('href', urlBig);
				});


				//Fancy box
				$("a[rel=restaurant_img_group]").fancybox({
					'transitionIn'		: 'none',
					'transitionOut'		: 'none',
					'autoScale' : true
				});

				//Week Menu - show more
				$(".restaurant-weekmenu-next").click(function() {
					$(".restaurant-weekmenu-current").toggle();
					$(".restaurant-weekmenu-whole").fadeToggle( "slow" );
					$(".restaurant-weekmenu-footer").toggle();
				});
				
			});	
		</script>
		
		<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAaRbRjGteUJbDnzH2MIuj9sphbl7OS8qU">
    	</script>			
		<script type="text/javascript">
			function initialize() {
				var lat = $('#restaurant-map-lat').val()
				var lng = $('#restaurant-map-lng').val()
				
				if(lat == "" || lng == "") {
					return;
				}
				
				var myLatlng = new google.maps.LatLng(lat, lng);

		        var mapOptions = {
		          center: myLatlng,
		          zoom: 14,
		          scrollwheel: false 
		        };
		        var map = new google.maps.Map(document.getElementById("restaurant-map-canvas"),
		            mapOptions);

		        var marker = new google.maps.Marker({
		            position: myLatlng,
		            map: map,
		            title:"Hello World!"
		        });
	      	}
	      	google.maps.event.addDomListener(window, 'load', initialize);
    	</script>
		
	</body>
</html>