<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="tutajzjem">
		<title>Wynik wyszukiwania</title>
	</head>
	<body>
		
		<div class="search-header">
			<div class="centered">
				<div class="search-header-query">
					<div class="search-result-icon"></div>
					<div class="search-result-info gray">Szukasz: <span class="bold">${query}</span></div>
				</div>
				<input id="query" type="hidden" value="${query}">
				<input id="category" type="hidden" value="${category}">
				<input id="nextPage" type="hidden" value="${isNextPage}">
			</div>
		</div>
		
		<div class="search-bg">
			<div class="centered">
				<div class="search-content">
					<div class="search-filter">
						<div class="search-filter-icon"></div>
						<div class="search-filter-name orange">Typ lokalu:</div>
						<g:each in="${restaurantTypes}" status="i" var="restaurantType">	
							<label class="search-filter-checkbox white">
					    		<input type="checkbox" class="restaurantType" name="${restaurantType.name}" value="${restaurantType.name}" /> ${restaurantType.defaultTransaltion }
					  		</label>
					  	</g:each>
						
						<div class="search-filter-space"></div>
						<div class="search-filter-icon"></div>
						<div class="search-filter-name orange">Typ kuchni:</div>
						<g:each in="${cuisines}" status="i" var="cuisine">	
							<label class="search-filter-checkbox white">
					    		<input type="checkbox" class="cuisine" name="${cuisine.name}" value="${cuisine.name}" /> ${cuisine.defaultTransaltion }
					  		</label>
					  	</g:each>
					</div>
					
					<div class="search-results-container">
						<div class="search-results">
							<g:render template="searchitem"/>
						</div>
						
						<div class="overlay"></div>
					</div>
					
				</div>
			</div>
		</div>
		
		<script type="text/javascript">
			$(document).ready(function() {
				var isLoadingDone = true;
				var isNextPage = $("#nextPage").val()=='true'?true:false;
				var resultsPerPage = 10;
				var currentPage = 0;
				var query = $("#query").val();
				var category = $("#category").val();
			   	var url =  '<g:createLink controller="home" action="searchAjax"/>'

				
				//FILTERING
				$('.restaurantType').change(function() {
					isNextPage = true;
					currentPage = 0;
					loadData(false);
				});
				$('.cuisine').change(function() {
					isNextPage = true;
					currentPage = 0;
					loadData(false);
				});


				//LAZY LOADING
				$(window).scroll(function() {
					if($(window).scrollTop() + $(window).height() >= $(document).height()-120) {
						currentPage += 1;
						loadData(true);						
				    }
				});


				//LOADING RESULTS
				function loadData(append) {
					if(append && (!isLoadingDone || !isNextPage)) {
						return false;
					}

					isLoadingDone = false;
					$(".overlay").show();
					
					var restaurantTypes = "";
					var cuisines = "";
					$('.restaurantType').each(function(){
						if($(this).is(":checked")) {
							if(restaurantTypes=="") {
								restaurantTypes = $(this).val();
							} else {
								restaurantTypes += ","+$(this).val();
							}
						}
					});
					$('.cuisine').each(function(){
						if($(this).is(":checked")) {
							if(cuisines=="") {
								cuisines = $(this).val();
							} else {
								cuisines += ","+$(this).val();
							}
						}
					});

					var data = new Object();
					data['q'] = query;
					if(category!='') data['category'] = category;
					if(restaurantTypes!='') data['restaurantType'] = restaurantTypes;
					if(cuisines!='') data['cuisine'] = cuisines; 
					data['offset'] = resultsPerPage * currentPage;

					$.ajax({
		   		  		type: "GET",
		   		  		url: url,
		   		  		data: data
			   		}) .done(function( response ) {
				   		if (append) {
				   			$( ".search-results" ).append( response );
					   	} else {
				   			$( ".search-results" ).html( response );
						}
				   		$(".overlay").hide();
				   		isLoadingDone = true;
				   		isNextPage = $(".nextPage").last().val()=='true'?true:false;
			   		});		
				}

				
		
			    
			});	
		</script>
		
		
	</body>
</html>
