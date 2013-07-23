
package views.html

import play.templates._
import play.templates.TemplateMagic._

import play.api.templates._
import play.api.templates.PlayMagic._
import models._
import controllers._
import java.lang._
import java.util._
import scala.collection.JavaConversions._
import scala.collection.JavaConverters._
import play.api.i18n._
import play.core.j.PlayMagicForJava._
import play.mvc._
import play.data._
import play.api.data.Field
import play.mvc.Http.Context.Implicit._
import views.html._
/**/
object homeSkeleton extends BaseScalaTemplate[play.api.templates.Html,Format[play.api.templates.Html]](play.api.templates.HtmlFormat) with play.api.templates.Template1[Html,play.api.templates.Html] {

    /**/
    def apply/*3.2*/(content: Html):play.api.templates.Html = {
        _display_ {
def /*6.2*/linkTo/*6.8*/( route: String ) = {{
	if(route == "New") {
		routes.NewRun.newRun()
	}
	else if(route == "Import"){
		routes.Application.importRun()
	}
	else if(route == "Overview") {
		routes.Application.overview()
		}
	else if(route == "Runs") {
		routes.Application.runIndex()
		}
	else if(route == "Bugs") {
		routes.Application.listBug()
		}
	else if(route == "Pages") {
		routes.Application.listPage()
		}
	else {
		routes.Application.overview()
	}
 
}};
Seq[Any](format.raw/*3.17*/("""


"""),format.raw/*29.2*/("""
<!DOCTYPE html>
<html>

<head>
    <link rel="stylesheet" type="text/css" media="screen" href=""""),_display_(Seq[Any](/*34.66*/routes/*34.72*/.Assets.at("stylesheets/main.css"))),format.raw/*34.106*/(""""> 
	<link type = "text/css" rel="stylesheet" media="screen" href=""""),_display_(Seq[Any](/*35.65*/routes/*35.71*/.Assets.at("stylesheets/bootstrap.css"))),format.raw/*35.110*/("""" >
	<link rel="stylesheet" type="text/css" media="screen" href=""""),_display_(Seq[Any](/*36.63*/routes/*36.69*/.Assets.at("stylesheets/bootstrap.min.css"))),format.raw/*36.112*/(""""> 
	
	<script type="text/javascript" src=""""),_display_(Seq[Any](/*38.39*/routes/*38.45*/.Application.javascriptRoutes())),format.raw/*38.76*/(""""></script>
</head>
<title>Regression Database Overview</title>
<body>

<div class="navbar navbar-fixed-top">
<div class="navbar navbar-inverse">
 <div class="navbar-inner">
	<a class="brand" href=""""),_display_(Seq[Any](/*46.26*/linkTo("Overview"))),format.raw/*46.44*/(""" ">Regression Database</a>
   <ul class = nav nav-tabs>
  	    <li class="divider-vertical"></li>
   		<li><a href = """"),_display_(Seq[Any](/*49.22*/linkTo("New"))),format.raw/*49.35*/(""" " >New Regression Run</a></li>
   		<li class="divider-vertical"></li>
   		<li><a href = """"),_display_(Seq[Any](/*51.22*/linkTo("Import"))),format.raw/*51.38*/(""" " >Import Regression Data</a></li> 
   		
   	
       
   		
   </ul>
           <ul class="nav">
    <li class="dropdown">
		<a href="#" class="dropdown-toggle" data-toggle="dropdown">
			Quick Links
		</a>
		<ul class="dropdown-menu">
			<li><a href = """"),_display_(Seq[Any](/*63.20*/linkTo("Runs"))),format.raw/*63.34*/(""" ">View all Runs</a></li>
			<li><a href = """"),_display_(Seq[Any](/*64.20*/linkTo("Pages"))),format.raw/*64.35*/(""" " >View all Pages</a></li>
			<li><a href = """"),_display_(Seq[Any](/*65.20*/linkTo("Bugs"))),format.raw/*65.34*/(""" " >View all Bugs</a></li>
		</ul>
    </li>
    </ul>
 <form class="navbar-search pull-left" name ="filter" onsubmit ="return search()">  
   	<input type="text" id = "searchbox" class="search-query" placeholder="Search by Run Name" />  
 	
 </form> 
   

   </div>
   </div>
  </div>
 
<script>
 function search() """),format.raw/*80.20*/("""{"""),format.raw/*80.21*/("""
	// <input type = "submit" style="visibility: hidden" onsubmit = "search()"/>
     var textInput = document.getElementById("searchbox").value;
    //alert("I am an alert box!");
    //window.location.href = 'http://www.google.com';
    window.location.href = jsRoutes.controllers.Application.listRun(0, "name","asc", textInput, "name").url;
	  return false;
"""),format.raw/*87.1*/("""}"""),format.raw/*87.2*/("""
 </script>  
  
<
<script src=""""),_display_(Seq[Any](/*91.15*/routes/*91.21*/.Assets.at("js/jquery.js"))),format.raw/*91.47*/(""""></script>
<script src=""""),_display_(Seq[Any](/*92.15*/routes/*92.21*/.Assets.at("js/bootstrap.js"))),format.raw/*92.50*/(""""></script>
<script src=""""),_display_(Seq[Any](/*93.15*/routes/*93.21*/.Assets.at("js/bootstrap-dropdown.js"))),format.raw/*93.59*/(""""></script>
<script src=""""),_display_(Seq[Any](/*94.15*/routes/*94.21*/.Assets.at("js/bootstrap.min.js"))),format.raw/*94.54*/(""""></script>	
		<section id="main">
            """),_display_(Seq[Any](/*96.14*/content)),format.raw/*96.21*/("""
        </section>

	</body>
</html>
"""))}
    }
    
    def render(content:Html): play.api.templates.Html = apply(content)
    
    def f:((Html) => play.api.templates.Html) = (content) => apply(content)
    
    def ref: this.type = this

}
                /*
                    -- GENERATED --
                    DATE: Tue Jul 23 11:40:03 EDT 2013
                    SOURCE: C:/Users/acarey/Desktop/andrewregressionsite/regressionsite/app/views/homeSkeleton.scala.html
                    HASH: 6e7cf29b18aac4139457269781c8021a7a5c60c3
                    MATRIX: 728->5|803->27|816->33|1313->20|1346->500|1484->602|1499->608|1556->642|1661->711|1676->717|1738->756|1841->823|1856->829|1922->872|2004->918|2019->924|2072->955|2315->1162|2355->1180|2513->1302|2548->1315|2679->1410|2717->1426|3022->1695|3058->1709|3140->1755|3177->1770|3261->1818|3297->1832|3656->2163|3685->2164|4078->2530|4106->2531|4179->2568|4194->2574|4242->2600|4305->2627|4320->2633|4371->2662|4434->2689|4449->2695|4509->2733|4572->2760|4587->2766|4642->2799|4728->2849|4757->2856
                    LINES: 26->3|28->6|28->6|52->3|55->29|60->34|60->34|60->34|61->35|61->35|61->35|62->36|62->36|62->36|64->38|64->38|64->38|72->46|72->46|75->49|75->49|77->51|77->51|89->63|89->63|90->64|90->64|91->65|91->65|106->80|106->80|113->87|113->87|117->91|117->91|117->91|118->92|118->92|118->92|119->93|119->93|119->93|120->94|120->94|120->94|122->96|122->96
                    -- GENERATED --
                */
            