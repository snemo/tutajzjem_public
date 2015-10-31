<!DOCTYPE html>
<html lang="pl-PL">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<META HTTP-EQUIV="content-type" CONTENT="text/html; charset=iso-8859-2">
		<title>Tutaj Zjem</title>

		<link rel="shortcut icon" href="./resources/images/favicon.ico" />
		
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'ui/jquery-ui.min.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.min.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap-theme.min.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'tutajzjem.css')}" type="text/css">
		
		<g:javascript src='jquery.js' />
		<g:javascript src='ui/jquery-ui.min.js' />
		
		<r:layoutResources />
	</head>
	<body>
		<div class="top-header">
			<div class="menu-container">
				<div class="centered">
					<a class="menu-logo" href="<g:createLink absolute="true"/>"></a>
					<div class="menu-sentence"></div>
				</div>
			</div>
			
			<div class="search-foto-container">
				<div class="search-foto">
					<div class="search-space"></div>
					<div class="search-block">
						<div class="search-space"></div>
						<form action="<g:createLink controller="home" action="search"/>" method="get">
							<div class="input-group input-group-lg search-input-group">
					          <input id="search" name="q" type="text" class="form-control" placeholder="wpisz miasto lub nazwę restauracji...">
					          <span class="input-group-btn">
						        <button type="submit" class="btn btn-search" type="button">
						        	<span class="glyphicon glyphicon-search"></span>
						        </button>
						      </span>
					        </div>
					        <input id="search-category" type="hidden" name="category" value="">
				        </form>
				        <div class="search-recommended">
				        	<div class="search-recommended-city">
				        		<%-- <div class="search-recommended-city-title orange bold">
				        			Popularne miasta:
				        		</div>--%>
				        		<div class="search-recommended-block">
					        		<ul class="search-recommended-ul orange left">
					        			<li><a href="<g:createLink controller="home" action="search" params="[q: 'Cieszyn', category:'city']"/>">Cieszyn</a></li>
					        			<li><a href="<g:createLink controller="home" action="search" params="[q: 'Ustroń', category:'city']"/>">Ustroń</a></li>
					        			<li><a href="<g:createLink controller="home" action="search" params="[q: 'Skoczów', category:'city']"/>">Skoczów</a></li>
					        			<li><a href="<g:createLink controller="home" action="search" params="[q: 'Wisła', category:'city']"/>">Wisła</a></li>
					        		</ul>
					        		<ul class="search-recommended-ul orange left">
					        			<li><a href="<g:createLink controller="home" action="search" params="[q: 'Bielsko-Biała', category:'city']"/>">Bielsko-Biała</a></li>
					        			<li><a href="<g:createLink controller="home" action="search" params="[q: 'Brenna', category:'city']"/>">Brenna</a></li>
					        			<li><a href="<g:createLink controller="home" action="search" params="[q: 'Jastrzębie-Zdrój', category:'city']"/>">Jastrzębie-Zdrój</a></li>
					        			<li><a href="<g:createLink controller="home" action="search" params="[q: 'Żywiec', category:'city']"/>">Żywiec</a></li>
					        		</ul>
					        		<ul class="search-recommended-ul orange left">
					        			<li><a href="<g:createLink controller="home" action="search" params="[q: 'Żory', category:'city']"/>">Żory</a></li>
					        			<li><a href="<g:createLink controller="home" action="search" params="[q: 'Pszczyna', category:'city']"/>">Pszczyna</a></li>
					        			<li><a href="<g:createLink controller="home" action="search" params="[q: 'Kęty', category:'city']"/>">Kęty</a></li>
					        			<li><a href="<g:createLink controller="home" action="search" params="[q: 'Wodzisław Śląski', category:'city']"/>">Wodzisław Śląski</a></li>
					        		</ul>
					        		<ul class="search-recommended-ul orange left">
					        			<li><a href="<g:createLink controller="home" action="search" params="[q: 'Oświęcim', category:'city']"/>">Oświęcim</a></li>
					        			<li><a href="<g:createLink controller="home" action="search" params="[q: 'Wadowice', category:'city']"/>">Wadowice</a></li>
					        			<li><a href="<g:createLink controller="home" action="search" params="[q: 'Rybnik', category:'city']"/>">Rybnik</a></li>
					        			<li><a href="<g:createLink controller="home" action="search" params="[q: 'Racibórz', category:'city']"/>">Racibórz</a></li>
					        		</ul>
				        		</div>
				        	</div>
				       <%-- <div class="search-recommended-restaurants">
				        		<div class="search-recommended-restaurants-title orange bold">
				        			Popularne lokale:
				        		</div>
				        		<div class="search-recommended-block">
					        		<ul class="search-recommended-ul white left">
					        			<li>Cieszyn</li>
					        			<li>Ustroń</li>
					        			<li>Skoczów</li>
					        			<li>Wisła</li>
					        		</ul>
					        		<ul class="search-recommended-ul white left">
					        			<li>Bielsko-Biała</li>
					        			<li>Brenna</li>
					        			<li>Jastrzębie-Zdrój</li>
					        			<li>Żywiec</li>
					        		</ul>
				        		</div>
				        	</div>--%>
				        </div>
					</div>
				</div>
			</div>

		</div>
		
		
		<div class="recommended-part">
			<div class="part-content centered">
				<div class="part-title">
					<div class="recommended-title"></div>
				</div>
				<div class="restaurant-row row recommended-big">
					<g:each in="${bigRecommendedRestaurant}" status="i" var="recommended">
						<a href="<g:createLink mapping="restaurant" id="${recommended?.restaurant?.identifier}" />" class="restaurant-item">
							<div class="restaurant-circle">
								<img class="restaurant-circle-img" alt="${recommended?.restaurant?.name }" src="<g:createLink controller="image" action="circle" id="${recommended?.restaurant?.mainImage?.identifier}" params="[ext:'.jpg']" />">
							</div>
							<div class="restaurant-item-details">
								<div class="restaurant-item-name orange">${recommended?.restaurant?.name }</div>
								<div class="restaurant-item-address white">${recommended?.restaurant?.city}, ul. ${recommended?.restaurant?.streetno}</div>
								<div class="restaurant-item-openhours white">
									<g:if test="${recommended?.restaurant?.isOpenToday()}">
									     dziś czynne: <g:formatDate format="HH:mm" date="${recommended?.restaurant?.getTodayOpenHour()}"/> - <g:formatDate format="HH:mm" date="${recommended?.restaurant?.getTodayCloseHour()}"/>
									</g:if>
									<g:else>
									     dziś nieczynne, sprawdź godziny otwarcia
									</g:else>
								</div>
							</div>
						</a>
					</g:each>
				</div>
			</div>
		</div>
		
		<div class="userspec-part">
			<div class="part-content centered">
				<div class="userspec-part-title">
					<div class="userspec-title"></div>
				</div>
				<div class="userspec-content">
					<div class="userspec-desc-1 gray">
						Pomagamy klientom znaleźć miejsce, w którym będą mogli zjeść smaczny posiłek,<br/>
						napić się dobrej kawy lub poprostu spotkać się ze znajomymi w przyjemnej atmosferze. <br/>
						Tym samym promujemy lokale gastronomiczne, które dzięki tutajzjem.pl zyskują nowych klientów.
					</div>
					<div class="userspec-desc-2 orange">
						To takie proste!
					</div>
					<div class="userspec-desc-3 gray">
						Wpisz w wyszukiwarce miasto, w którym wybierasz się na posiłek lub konkretną nazwę lokalu. <br/>
						W wynikach bez problemu znajdziesz wszystko, czego szukasz.
					</div>
					<div class="userspec-infographic"></div>
				</div>
			</div>
		</div>
		
		<div class="companyspec-part">
			<div class="part-content centered">
				<div class="companyspec-part-title">
					<div class="companyspec-title"></div>
				</div>
				<div class="companyspec-content">
					<div class="companyspec-infographic"></div>
					<div class="row">
						<div class="companyspec-column">
							<div class="companyspec-col-title font-white">Więcej klientów</div>
							<div class="companyspec-col-desc font-white">
								Liczba użytkowników korzystających<br/>
								z naszego portalu stale rośnie.<br/>
								Przeczytaj o nas w internecie<br/>
								i odwiedź naszego facebooka!
							</div>
						</div>
						<div class="companyspec-column">
							<div class="companyspec-col-title font-white">Mniej zmartwień</div>
							<div class="companyspec-col-desc font-white">
								Szybkie i automatyczne aktualizacje<br/>
								menu dań dnia. Wystarczy 10min<br/>
								tygodniowo na obsługę swojego konta,<br/>
								a korzystanie z portalu<br>
								jest dziecinnie proste.
							</div>
						</div>
						<div class="companyspec-column">
							<div class="companyspec-col-title font-white">Świetna reklama</div>
							<div class="companyspec-col-desc font-white">
								Nasz portal odwiedzają ludzie z całego<br/>
								Śląska Cieszyńskiego, co stanowi świetną<br/>
								reklamę dla Twojego lokalu.<br/>
								Za dodatkową opłatą możesz również<br/>
								znaleźć się na głównej stronie.
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- FOOTER -->
		<g:render template="footer" />
		
		<!-- AUTOCOMPLETE -->
		<g:render template="autocomplete" />
		
		<!-- COOKIE POLICY -->
		<g:render template="cookie"/>
	</body>
</html>
