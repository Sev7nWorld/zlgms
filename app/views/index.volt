<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        {{ get_title() }}
		{{ stylesheet_link('plugins/bootstrap/css/bootstrap.css') }}
		{{ stylesheet_link('css/index.css') }}
		{{ stylesheet_link('plugins/flexigrid/css/flexigrid.pack.css') }}
		{{ stylesheet_link('plugins/validation/css/validationEngine.jquery.css') }}
    </head>
    <body>
		{{content()}}
        {{ javascript_include('js/jquery.min.js') }}
		{{ javascript_include('plugins/bootstrap/js/bootstrap.js') }}
		{{ javascript_include('js/simpla.jquery.configuration.js') }}
		{{ javascript_include('plugins/flexigrid/js/flexigrid.pack.js') }}
		{{ javascript_include('plugins/validation/jquery.validationEngine.js') }}
		{{ javascript_include('plugins/My97DatePicker/WdatePicker.js') }}
		{{ javascript_include('js/ajaxfileupload.js') }}		
		{{ javascript_include('js/index.js') }}		
    </body>
</html>