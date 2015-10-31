<g:if test="${restaurants==null || restaurants.isEmpty() }">
	<div class="search-noresult"></div>
</g:if>
<g:each in="${restaurants}" status="i" var="restaurant">
	<div class="search-item">
		<div class="search-item-img">
			<a href="<g:createLink mapping="restaurant" id="${restaurant?.identifier}" />">
				<img class="restaurant-small-circle-img" alt="${restaurant?.name }" src="<g:createLink controller="image" action="circle" id="${restaurant?.mainImage?.identifier}" params="[ext:'.jpg']" />">
			</a>
		</div>
		<div class="search-item-rest">
			<div class="search-item-name orange"><h2><a href="<g:createLink mapping="restaurant" id="${restaurant?.identifier}" />">${restaurant?.name }</a></h2></div>
			<div class="search-item-address">${restaurant?.streetno }, ${restaurant?.city }</div>
			<div class="search-item-type">
				<g:each in="${restaurant.getTypeLabelList()}" var="restaurantType" status="ti">${ti==0?restaurantType:', '+restaurantType}</g:each>
			</div>
			<div class="search-item-cuisine">
				<g:each in="${restaurant.getcuisineLabelList()}" var="cuisine" status="ci">${ci==0?cuisine:', '+cuisine}</g:each>
			</div>
		</div>
		<div class="search-item-rest2">
			<div class="search-item-see">Zobacz:</div>
			<div class="search-item-menulink"><a href="<g:createLink mapping="restaurant" id="${restaurant?.identifier}" />#weekmenuanchor">obiad dnia</a></div>
			<div class="search-item-menulink"><a href="<g:createLink mapping="restaurant" id="${restaurant?.identifier}" />#menuanchor">karta dań</a></div>
			<div class="search-item-openhours">
				<g:if test="${restaurant?.isOpenToday()}">
				     <span class="search-item-openhours-label">Dziś czynne:</span> <span class="search-item-openhours-hour"><g:formatDate format="HH:mm" date="${restaurant?.getTodayOpenHour()}"/> - <g:formatDate format="HH:mm" date="${restaurant?.getTodayCloseHour()}"/></span>
				</g:if>
				<g:else>
				      <span class="search-item-openhours-label">Dziś nieczynne</span>
				</g:else>
			</div>
		</div>
	</div>
	<hr class="search-result-line">
</g:each>
<input class="nextPage" type="hidden" value="${isNextPage}">