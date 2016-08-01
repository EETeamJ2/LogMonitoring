<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
  <head>
    <title>Bootstrap Admin Theme v3</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    
  
     <link rel="stylesheet" type="text/css" href="resources/css/styles.css"/>
       <link rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap.min.css"/>

    <script src="<c:url value="/resources/js/jquery.js" />"></script>


    <!-- styles -->
<!--     <link href="css/styles.css" rel="stylesheet"> -->
  </head>
  <body>
  	<div class="header">
	     <div class="container" style="width:200px; padding-left:0px;padding-right:0px;">
	        <div class="row">
	           <div class="col-md-5">
	              <!-- Logo -->
	              <div class="logo">
	                 <h1><a href="index.html">EEJ2</a></h1>
	              </div>
	           </div>
	        </div>
	     </div>
	</div>

    <div class="page-content">
    	<div class="row">
		  <div class="col-md-12">
		  	<div class="row">
	  				<div class="col-md-12">
	  					<div class="content-box-header">
		  					<div class="panel-title">Filter</div>
							
			  			</div>
			  			<div class="content-box-large box-with-header">
			  				<div class="row">
								<div class="col-md-1">
									<a href="JavaScript:void(0)" class="single_view" onclick="kibanaDashboard('w');">
										<span>Weekly Dashboard</span>
									</a>
								</div>
								<div class="col-md-1">
									<a href="JavaScript:void(0)" class="single_view" onclick="kibanaDashboard('m');">
										<span>Monthly Dashboard</span>
									</a>
								</div>
								<div class="col-md-1">
									<a href="JavaScript:void(0)" class="single_view" onclick="kibanaDashboard('y');">
										<span>Yearly Dashboard</span>
									</a>	
								</div>
								<div class="col-md-1">
									<a href="JavaScript:void(0)" class="show_input_form">
										<span>Compare Dashboard</span>
									</a>
								</div>
								<div id="compare_input_form" class="col-md-8 hide">
									<form class="form-inline" role="form">
										
											<fieldset>
												<div class="form-group col-sm-3">
													<label class="sr-only" for="from_date">From Date</label>
													<input type="date" class="form-control" id="from_date1">
												</div>
												<div class="form-group  col-sm-2">
													<label class="sr-only" for="to_date">To Date</label>
													<input type="date" class="form-control" id="to_date1" placeholder="Start To Date">
												</div>
												<div class="form-group col-sm-2">
													<label class="sr-only" for="from_date">From Date</label>
													<input type="date" class="form-control" id="from_date2" placeholder="End From Date">
												</div>
												<div class="form-group  col-sm-2">
													<label class="sr-only" for="to_date">To Date</label>
													<input type="date" class="form-control" id="to_date2" placeholder="End To Date">
												</div>
												<div class="form-group  col-sm-2">
												<label class="sr-only">Type of Chart</label>
												<select class="form-control" id="type">
													  <option value="Pie">Pie Chart</option>
													  <option value="area">Area Chart</option>
													  <option value="histogram">Bar Chart</option>
													  <option value="line">Line Chart</option>
												</select></div>
												<a href="JavaScript:void(0)" class="multiple_view" onclick="kibanaDashboardRange(document.getElementById('from_date1').value,document.getElementById('to_date1').value,document.getElementById('from_date2').value,document.getElementById('to_date2').value,document.getElementById('type').value);">
										          <span>Dashboard</span>
									             </a>	
											</fieldset>
											
										</form>
								</div>
						</div>
	  				</div>

	  			</div>

			<div id="show_multiple_view" class="row hide">
		  		<div class="col-md-6">
		  			<div class="content-box-large">
		  				<div class="panel-heading">
							<div class="panel-title">New vs Returning Visitors1</div>
						</div>
		  				<div class="panel-body">
		  					<iframe id="kibana1" src="" height="600" width="100%"></iframe>
		  				</div>
		  			</div>
		  		</div>
				
		  		<div class="col-md-6">
		  			<div class="content-box-large">
		  				<div class="panel-heading">
							<div class="panel-title">New vs Returning Visitors2</div>
						</div>
		  				<div class="panel-body">
		  					<iframe id="kibana2" src="" height="600" width="100%"></iframe>
		  				</div>
		  			</div>
		  		</div>

		  		</div>
		  	
			<div id="show_single_view" class="row hide">
			
		  		<div class="col-md-12">
		  			<div class="content-box-large">
		  				<div class="panel-heading">
							<div class="panel-title">Dashboard</div>
						</div>
		  				<div class="panel-body">
		  					<iframe id="single" src="" height="600" width="100%"></iframe>
		  				</div>
		  			</div>
		  		</div>
				
			</div>
			
			</div>


		  </div>
		</div>
    </div>

    
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    
    
  </body>
  <script src="js/jquery.js"></script>
  <script>
  $(document).ready(function(){
  $(".multiple_view").click(function(){
		$("#show_multiple_view").addClass('show').removeClass('hide');
		$("#show_single_view").addClass('hide').removeClass('show');
		$("#compare_input_form").addClass('hide').removeClass('show');
		
  });
  $(".single_view").click(function(){
		$("#show_multiple_view").addClass('hide').removeClass('show');
		$("#show_single_view").addClass('show').removeClass('hide');
		$("#compare_input_form").addClass('hide').removeClass('show');
  });
  $(".show_input_form").click(function(){
		$("#show_multiple_view").addClass('hide').removeClass('show');
		$("#show_single_view").addClass('hide').removeClass('show');
		$("#compare_input_form").addClass('show').removeClass('hide');
		
  });
  });
  
  function kibanaDashboard(x) {
if(x == 'w'){
dash="http://localhost:5601/app/kibana#/dashboard/cnxDashboard?embed=true&_g=(filters:!(),refreshInterval:(display:Off,pause:!f,value:0),time:(from:now%2Fw,mode:quick,to:now%2Fw))&_a=(filters:!(),options:(darkTheme:!f),panels:!((col:1,id:Modue_javaClass_logLevel_piechart,panelIndex:1,row:1,size_x:5,size_y:5,type:visualization),(col:6,id:Module_javaClass_logLevel_error_dataTable,panelIndex:2,row:1,size_x:7,size_y:5,type:visualization)),query:(query_string:(analyze_wildcard:!t,query:'*')),title:cnxDashboard,uiState:())"
}

if(x == 'm'){
dash="http://localhost:5601/app/kibana#/dashboard/cnxDashboard?embed=true&_g=(filters:!(),refreshInterval:(display:Off,pause:!f,value:0),time:(from:now%2FM,mode:quick,to:now%2FM))&_a=(filters:!(),options:(darkTheme:!f),panels:!((col:1,id:Modue_javaClass_logLevel_piechart,panelIndex:1,row:1,size_x:5,size_y:5,type:visualization),(col:6,id:Module_javaClass_logLevel_error_dataTable,panelIndex:2,row:1,size_x:7,size_y:5,type:visualization)),query:(query_string:(analyze_wildcard:!t,query:'*')),title:cnxDashboard,uiState:())"
}

if(x == 'y'){
dash="http://localhost:5601/app/kibana#/dashboard/cnxDashboard?embed=true&_g=(filters:!(),refreshInterval:(display:Off,pause:!f,value:0),time:(from:now%2Fy,mode:quick,to:now%2Fy))&_a=(filters:!(),options:(darkTheme:!f),panels:!((col:1,id:Modue_javaClass_logLevel_piechart,panelIndex:1,row:1,size_x:5,size_y:5,type:visualization),(col:6,id:Module_javaClass_logLevel_error_dataTable,panelIndex:2,row:1,size_x:7,size_y:5,type:visualization)),query:(query_string:(analyze_wildcard:!t,query:'*')),title:cnxDashboard,uiState:())"
}
document.getElementById("single").src=dash;}

function kibanaDashboardRange(f1,t1,f2,t2,ty) {
  if(ty=='Pie'){
    x="http://localhost:5601/app/kibana#/visualize/create?embed=true&type=pie&indexPattern=cnxapplog&_g=(refreshInterval:(display:Off,pause:!f,value:0),time:(from:'"+f1+"T18:30:00.000Z',mode:absolute,to:'"+t1+"T18:29:59.999Z'))&_a=(filters:!(),linked:!f,query:(query_string:(analyze_wildcard:!t,query:'*')),uiState:(),vis:(aggs:!((id:'1',params:(),schema:metric,type:count),(id:'2',params:(customInterval:'2h',extended_bounds:(),field:'@timestamp',interval:d,min_doc_count:1,row:!t),schema:split,type:date_histogram),(id:'3',params:(field:loglevel,order:desc,orderBy:'1',size:5),schema:segment,type:terms)),listeners:(),params:(addLegend:!t,addTooltip:!t,isDonut:!f,shareYAxis:!t),title:'New%20Visualization',type:pie))"
    y="http://localhost:5601/app/kibana#/visualize/create?embed=true&type=pie&indexPattern=cnxapplog&_g=(refreshInterval:(display:Off,pause:!f,value:0),time:(from:'"+f2+"T18:30:00.000Z',mode:absolute,to:'"+t2+"T18:29:59.999Z'))&_a=(filters:!(),linked:!f,query:(query_string:(analyze_wildcard:!t,query:'*')),uiState:(),vis:(aggs:!((id:'1',params:(),schema:metric,type:count),(id:'2',params:(customInterval:'2h',extended_bounds:(),field:'@timestamp',interval:d,min_doc_count:1,row:!t),schema:split,type:date_histogram),(id:'3',params:(field:loglevel,order:desc,orderBy:'1',size:5),schema:segment,type:terms)),listeners:(),params:(addLegend:!t,addTooltip:!t,isDonut:!f,shareYAxis:!t),title:'New%20Visualization',type:pie))"
    }
     if(ty=='histogram'){
    x="http://localhost:5601/app/kibana#/visualize/create?embed=true&type=histogram&indexPattern=cnxapplog&_g=(refreshInterval:(display:Off,pause:!f,value:0),time:(from:'"+f1+"T06:21:19.154Z',mode:absolute,to:'"+t1+"T06:36:19.154Z'))&_a=(filters:!(),linked:!f,query:(query_string:(analyze_wildcard:!t,query:'*')),uiState:(),vis:(aggs:!((id:'1',params:(),schema:metric,type:count),(id:'2',params:(customInterval:'2h',extended_bounds:(),field:'@timestamp',interval:d,min_doc_count:1,row:!t),schema:split,type:date_histogram),(id:'3',params:(field:loglevel,order:desc,orderBy:'1',size:5),schema:segment,type:terms)),listeners:(),params:(addLegend:!t,addTimeMarker:!f,addTooltip:!t,defaultYExtents:!f,mode:stacked,scale:linear,setYExtents:!f,shareYAxis:!t,times:!(),yAxis:()),title:'New%20Visualization',type:histogram))"
    y="http://localhost:5601/app/kibana#/visualize/create?embed=true&type=histogram&indexPattern=cnxapplog&_g=(refreshInterval:(display:Off,pause:!f,value:0),time:(from:'"+f2+"T06:21:19.154Z',mode:absolute,to:'"+t2+"T06:36:19.154Z'))&_a=(filters:!(),linked:!f,query:(query_string:(analyze_wildcard:!t,query:'*')),uiState:(),vis:(aggs:!((id:'1',params:(),schema:metric,type:count),(id:'2',params:(customInterval:'2h',extended_bounds:(),field:'@timestamp',interval:d,min_doc_count:1,row:!t),schema:split,type:date_histogram),(id:'3',params:(field:loglevel,order:desc,orderBy:'1',size:5),schema:segment,type:terms)),listeners:(),params:(addLegend:!t,addTimeMarker:!f,addTooltip:!t,defaultYExtents:!f,mode:stacked,scale:linear,setYExtents:!f,shareYAxis:!t,times:!(),yAxis:()),title:'New%20Visualization',type:histogram))"
    }
     if(ty=='area'){
    x="http://localhost:5601/app/kibana#/visualize/create?embed=true&type=area&indexPattern=cnxapplog&_g=(refreshInterval:(display:Off,pause:!f,value:0),time:(from:'"+f1+"T18:30:00.000Z',mode:absolute,to:'"+t1+"T18:29:59.999Z'))&_a=(filters:!(),linked:!f,query:(query_string:(analyze_wildcard:!t,query:'*')),uiState:(),vis:(aggs:!((id:'1',params:(),schema:metric,type:count),(id:'2',params:(customInterval:'2h',extended_bounds:(),field:'@timestamp',interval:d,min_doc_count:1,row:!t),schema:split,type:date_histogram),(id:'3',params:(field:loglevel,order:desc,orderBy:'1',size:5),schema:segment,type:terms)),listeners:(),params:(addLegend:!t,addTimeMarker:!f,addTooltip:!t,defaultYExtents:!f,interpolate:linear,mode:stacked,scale:linear,setYExtents:!f,shareYAxis:!t,smoothLines:!f,times:!(),yAxis:()),title:'New%20Visualization',type:area))"
    y="http://localhost:5601/app/kibana#/visualize/create?embed=true&type=area&indexPattern=cnxapplog&_g=(refreshInterval:(display:Off,pause:!f,value:0),time:(from:'"+f2+"T18:30:00.000Z',mode:absolute,to:'"+t2+"T18:29:59.999Z'))&_a=(filters:!(),linked:!f,query:(query_string:(analyze_wildcard:!t,query:'*')),uiState:(),vis:(aggs:!((id:'1',params:(),schema:metric,type:count),(id:'2',params:(customInterval:'2h',extended_bounds:(),field:'@timestamp',interval:d,min_doc_count:1,row:!t),schema:split,type:date_histogram),(id:'3',params:(field:loglevel,order:desc,orderBy:'1',size:5),schema:segment,type:terms)),listeners:(),params:(addLegend:!t,addTimeMarker:!f,addTooltip:!t,defaultYExtents:!f,interpolate:linear,mode:stacked,scale:linear,setYExtents:!f,shareYAxis:!t,smoothLines:!f,times:!(),yAxis:()),title:'New%20Visualization',type:area))"
    }
     if(ty=='line'){
    x="http://localhost:5601/app/kibana#/visualize/create?embed=true&type=line&indexPattern=cnxapplog&_g=(refreshInterval:(display:Off,pause:!f,value:0),time:(from:'"+f1+"T18:30:00.000Z',mode:absolute,to:'"+t1+"T18:29:59.999Z'))&_a=(filters:!(),linked:!f,query:(query_string:(analyze_wildcard:!t,query:'*')),uiState:(),vis:(aggs:!((id:'1',params:(),schema:metric,type:count),(id:'2',params:(customInterval:'2h',extended_bounds:(),field:'@timestamp',interval:d,min_doc_count:1,row:!t),schema:split,type:date_histogram),(id:'3',params:(field:loglevel,order:desc,orderBy:'1',size:5),schema:segment,type:terms)),listeners:(),params:(addLegend:!t,addTimeMarker:!f,addTooltip:!t,defaultYExtents:!f,drawLinesBetweenPoints:!t,interpolate:linear,radiusRatio:9,scale:linear,setYExtents:!f,shareYAxis:!t,showCircles:!t,smoothLines:!f,times:!(),yAxis:()),title:'New%20Visualization',type:line))"
    y="http://localhost:5601/app/kibana#/visualize/create?embed=true&type=line&indexPattern=cnxapplog&_g=(refreshInterval:(display:Off,pause:!f,value:0),time:(from:'"+f2+"T18:30:00.000Z',mode:absolute,to:'"+t2+"T18:29:59.999Z'))&_a=(filters:!(),linked:!f,query:(query_string:(analyze_wildcard:!t,query:'*')),uiState:(),vis:(aggs:!((id:'1',params:(),schema:metric,type:count),(id:'2',params:(customInterval:'2h',extended_bounds:(),field:'@timestamp',interval:d,min_doc_count:1,row:!t),schema:split,type:date_histogram),(id:'3',params:(field:loglevel,order:desc,orderBy:'1',size:5),schema:segment,type:terms)),listeners:(),params:(addLegend:!t,addTimeMarker:!f,addTooltip:!t,defaultYExtents:!f,drawLinesBetweenPoints:!t,interpolate:linear,radiusRatio:9,scale:linear,setYExtents:!f,shareYAxis:!t,showCircles:!t,smoothLines:!f,times:!(),yAxis:()),title:'New%20Visualization',type:line))"
    }


document.getElementById("kibana1").src=x;
document.getElementById("kibana2").src=y;
}
  </script>
</html>