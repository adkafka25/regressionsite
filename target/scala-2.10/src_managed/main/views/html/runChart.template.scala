
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
object runChart extends BaseScalaTemplate[play.api.templates.Html,Format[play.api.templates.Html]](play.api.templates.HtmlFormat) with play.api.templates.Template1[Html,play.api.templates.Html] {

    /**/
    def apply/*1.2*/(content: Html):play.api.templates.Html = {
        _display_ {

Seq[Any](format.raw/*1.17*/("""
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="content-type" content="text/html; charset=utf-8" />
  <title>Google Visualization API Sample</title>
  <script type="text/javascript" src="http://www.google.com/jsapi"></script>
  <script type="text/javascript">
    google.load('visualization', '1', """),format.raw/*8.39*/("""{"""),format.raw/*8.40*/("""packages: ['annotatedtimeline']"""),format.raw/*8.71*/("""}"""),format.raw/*8.72*/(""");
    function decode(encodedString) """),format.raw/*9.36*/("""{"""),format.raw/*9.37*/("""
		var tmpElement = document.createElement('span');
		tmpElement.innerHTML = encodedString;
		return tmpElement.innerHTML;
	  """),format.raw/*13.4*/("""}"""),format.raw/*13.5*/("""
    /**
    Converts data into suitable format
    **/
        function ra()"""),format.raw/*17.22*/("""{"""),format.raw/*17.23*/("""
         var table=""""),_display_(Seq[Any](/*18.22*/{controllers.Application.createData()})),format.raw/*18.60*/("""";
         var tableFormatted=decode(table);
         var obj = eval("(" + tableFormatted + ")");
         return obj;
        """),format.raw/*22.9*/("""}"""),format.raw/*22.10*/("""
    function drawVisualization() """),format.raw/*23.34*/("""{"""),format.raw/*23.35*/("""
      var data = new google.visualization.DataTable();
      data.addColumn('date', 'Date');
      data.addColumn('number', 'Java Bugs');
      data.addColumn('number', 'Native Bugs');
      data.addRows(ra());
    
      /*data.addRows([
        [new Date(2008, 1 ,1), 30000,  40645],
        [new Date(2008, 1 ,2), 14045,  20374],
        [new Date(2008, 1 ,3), 55022,  50766],
        [new Date(2008, 1 ,4), 75284,  14334],
        [new Date(2008, 1 ,5), 41476,  66467],
        [new Date(2008, 1 ,6), 33322,  39463]
      ]);
      */
    
      var annotatedtimeline = new google.visualization.AnnotatedTimeLine(
          document.getElementById('visualization'));
      annotatedtimeline.draw(data, """),format.raw/*42.36*/("""{"""),format.raw/*42.37*/("""
    	  'displayAnnotations': false,
    	  'displayZoomButtons': false,
    	  'thickness': 2,
    	  'highlightDot': 'last'
    	  
      
      """),format.raw/*49.7*/("""}"""),format.raw/*49.8*/(""");
    """),format.raw/*50.5*/("""}"""),format.raw/*50.6*/("""
    
    google.setOnLoadCallback(drawVisualization);
  </script>
</head>
<body style="font-family: Arial;border: 0 none;">
<div id="visualization" style="width: 800px; height: 400px;"></div>
</body>
</html>"""))}
    }
    
    def render(content:Html): play.api.templates.Html = apply(content)
    
    def f:((Html) => play.api.templates.Html) = (content) => apply(content)
    
    def ref: this.type = this

}
                /*
                    -- GENERATED --
                    DATE: Tue Jul 23 11:40:05 EDT 2013
                    SOURCE: C:/Users/acarey/Desktop/andrewregressionsite/regressionsite/app/views/runChart.scala.html
                    HASH: bff0841d2f0c325083541e32886996d1d80aa962
                    MATRIX: 724->1|816->16|1172->345|1200->346|1258->377|1286->378|1352->417|1380->418|1537->548|1565->549|1674->630|1703->631|1762->654|1822->692|1981->824|2010->825|2073->860|2102->861|2856->1587|2885->1588|3066->1742|3094->1743|3129->1751|3157->1752
                    LINES: 26->1|29->1|36->8|36->8|36->8|36->8|37->9|37->9|41->13|41->13|45->17|45->17|46->18|46->18|50->22|50->22|51->23|51->23|70->42|70->42|77->49|77->49|78->50|78->50
                    -- GENERATED --
                */
            