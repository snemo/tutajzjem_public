<%@ page import="pl.tutajzjem.restaurant.Restaurant" %>



<div class="form-horizontal">
<div class="form-group">
	<label class="col-sm-2 control-label">
		Zdjęcia
	</label>
	<div class="col-sm-10">
		<span class="btn btn-success fileinput-button attachment-btn">
     				<i class="glyphicon glyphicon-plus"></i>
     				<span>Dodaj zdjęcia</span>
        			<input id="fileupload" type="file" name="files[]" data-url="<g:createLink controller="image" action="upload" />" multiple>
    	</span>
    	<div class="attachment-progress">
    		<label>Wysyłanie pliku, proszę czekać...</label>
	    	<div id="progress" class="progress">
	    		<span id="files-to-upload"></span>
		        <div class="progress-bar progress-bar-success"></div>
		    </div>
    	</div>
	    <div id="files" class="files row attachment-files">
	    	<g:each var="image" in="${restaurantInstance?.images}">
	    		<div class="col-xs-6 col-md-3">
					<div class="thumbnail restaurantimage ${restaurantInstance?.mainImage?.identifier==image?.identifier?'selected-restaurantimage':'' }" imageid="${image?.identifier}">
						<img alt=""${image?.name} src="<g:createLink controller="image" action="thumbnail" id="${image?.identifier}" />">
						<div class="caption">
							${image?.name}	
						</div>
						<button type="button" class="btn btn-danger remove-img"><i class="glyphicon glyphicon-remove"></i></button>
					</div>
				</div>
	    	</g:each>
	    </div>
	    <p class="help-block">Kliknij na zdjęcie aby oznaczyć jako główne.</p>
	</div>
</div>
</div>

<script id="thumb-template" type="text/x-handlebars-template">
	{{#each images}}
	<div class="col-xs-6 col-md-3">
		<div class="thumbnail restaurantimage" imageid="{{id}}">
			<img alt="{{name}}" src="{{thumbnail_url}}">
			<div class="caption">
				{{name}}	
			</div>
			<button type="button" class="btn btn-danger remove-img"><i class="glyphicon glyphicon-remove"></i></button>			
		</div>
	</div>
	{{/each}}
</script>

<script type="text/javascript">
			$(document).ready(function() {

				//FILE UPLOAD
				$('#fileupload').fileupload({
					dataType: 'json',
				    multiple: true,
				    disableImageResize: /Android(?!.*Chrome)|Opera/
			            .test(window.navigator.userAgent),
			        previewMaxWidth: 100,
			        previewMaxHeight: 100,
			        previewCrop: true
			    }).on('fileuploadadd', function (e, data) {
				    $('.attachment-btn').hide();
				    $('.attachment-progress').show();
		
			        var files = '';
			        $.each(data.files, function (index, file) {
				        files += file.name + " ";
			        });
			        $('#files-to-upload').html(files);
			    }).on('fileuploadprogressall', function (e, data) {
			        var progress = parseInt(data.loaded / data.total * 100, 10);
			        $('#progress .progress-bar').css(
			            'width',
			            progress + '%'
			        );
			    }).on('fileuploaddone', function (e, data) {
			    	$('.attachment-btn').show();
				    $('.attachment-progress').hide();
				    
					//thumb
					var source   = $("#thumb-template").html();
		  			var template = Handlebars.compile(source);
					$('#files').append(template({images:data.result}));
					$('#progress .progress-bar').css('width', 0 + '%');

					//refresh images ids
					refreshAttachmentIds();
					
			    }).on('fileuploadfail', function (e, data) {
			    	$('.attachment-btn').show();
				    $('.attachment-progress').hide();
				    $('#progress .progress-bar').css('width', 0 + '%');	
					alert(data.jqXHR.responseText);
			    });

			    function refreshAttachmentIds() {
			    	$('.input-image').remove();
					
			    	$('.restaurantimage').each(function( index ) {
				    	var imgId = $( this ).attr('imageid');
				    	var hiddenInput = $('<input/>',{type:'hidden', name:"images", value:imgId});
				    	hiddenInput.addClass('input-image');
				    	hiddenInput.appendTo('.new-restaurant');		
		    		});

		    		//Set main img for first photo
			    	if($('.input-mainImage').val()=="") {
			    		$('.restaurantimage').each(function( index ) {
					    	var imgId = $( this ).attr('imageid');
					    	$('.input-mainImage').val(imgId);
					    	$(this).addClass("selected-restaurantimage");
					    	return
			    		});
				    }
				}
		
			    //SET MAIN IMAGE
			    $('.restaurantimage').live('click', function() {
				    $('.restaurantimage').removeClass("selected-restaurantimage");
					$(this).addClass("selected-restaurantimage");
					$('.input-mainImage').val($(this).attr('imageid'));
				});

				//REMOVE IMAGE
			    $('.remove-img').live('click', function() {
				    $('.restaurantimage').removeClass("selected-restaurantimage");
					var img = $(this).parent();
					var imageid = img.attr('imageid');

					$.get( "<g:createLink controller="image" action="delete"/>"+"?id="+imageid, function( data ) {
						img.remove();
						refreshAttachmentIds();
					});

					
				});

				
		
			    
			});	
		</script>