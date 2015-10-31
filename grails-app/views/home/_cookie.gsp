<div class="cookie-policy" style="display: none;">
	<span class="btn cookie-policy-closebtn">
        <i class="glyphicon glyphicon-remove"></i>
    </span>
	<div class="cookie-policy-txt">
		Ten serwis wykorzystuje pliki cookies. Korzystanie z witryny oznacza zgodę na ich używanie, zgodnie z ustawieniami przeglądarki. Więcej w 
		<a href="<g:createLink controller="register" action="cookie"/>">Polityce prywatności</a>
	</div>
</div>

<g:javascript src='jquery.cookie.js' />
<script type="text/javascript">
	$(document).ready(function() {
		if($.cookie("cookie_accepted") != "yes") {
			$(".cookie-policy").show();
		};

		$(".cookie-policy-closebtn").click(function(){
			$.cookie("cookie_accepted", "yes", { expires: 62 });
			$(".cookie-policy").hide();
		});
	});
</script>