		<script type="text/javascript">
			$(document).ready(function() {
				
				$.widget( "custom.catcomplete", $.ui.autocomplete, {
				    _create: function() {
				      this._super();
				      this.widget().menu( "option", "items", "> :not(.ui-autocomplete-category)" );
				    },
				    _renderMenu: function( ul, items ) {
				      var that = this,
				        currentCategory = "";
				      $.each( items, function( index, item ) {
				        var li;
				        if ( item.category != currentCategory ) {
				          ul.append( "<li class='ui-autocomplete-category'>" + getCategoryLabel(item.category) + "</li>" );
				          currentCategory = item.category;
				        }
				        li = that._renderItemData( ul, item );
				        if ( item.category ) {
				          li.attr( "aria-label", item.category + " : " + item.label );
				        }
				      });
				    }
				  });
				

				var url = "<g:createLink controller="search" action="autocomplete"/>";
	            $( "#search" ).catcomplete({
	            	source: function( request, response ) {
	                    $.ajax({
	                      url: url,
	                      dataType: "json",
	                      data: {
	                        query: request.term
	                      },
	                      success: function( data ) {
	                        response( data );
	                      }
	                    });
	                  },
	                select: function(event, ui) {
		                  $("#search-category").val(ui.item.category)
	                      $("#search").val(ui.item.value);
	                      $(this).parents("form").submit(); 
	                }
	            });

	            function getCategoryLabel(categoryName) {
		            if(categoryName == 'city') {
			            return "Miasto";
			        } 
		            else if (categoryName == 'restaurant') {
			            return "Lokal";
			        }
		        }
			});
			
		</script>