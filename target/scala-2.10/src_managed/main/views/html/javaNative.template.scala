
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
object javaNative extends BaseScalaTemplate[play.api.templates.Html,Format[play.api.templates.Html]](play.api.templates.HtmlFormat) with play.api.templates.Template1[Html,play.api.templates.Html] {

    /**/
    def apply/*1.2*/(content: Html):play.api.templates.Html = {
        _display_ {

Seq[Any](format.raw/*1.17*/("""
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <title>
      Google Visualization API Sample
    </title>
    <script type="text/javascript" src="http://www.google.com/jsapi"></script>
    <script type="text/javascript">
      google.load('visualization', '1.1', """),format.raw/*10.43*/("""{"""),format.raw/*10.44*/("""packages: ['corechart', 'controls']"""),format.raw/*10.79*/("""}"""),format.raw/*10.80*/(""");
    </script>
    <script type="text/javascript">
    function decode(encodedString) """),format.raw/*13.36*/("""{"""),format.raw/*13.37*/("""
		var tmpElement = document.createElement('span');
		tmpElement.innerHTML = encodedString;
		return tmpElement.innerHTML;
	  """),format.raw/*17.4*/("""}"""),format.raw/*17.5*/("""
    /**
    Converts data into suitable format
    **/
        function ra()"""),format.raw/*21.22*/("""{"""),format.raw/*21.23*/("""
         var table=""""),_display_(Seq[Any](/*22.22*/{controllers.Application.createData()})),format.raw/*22.60*/("""";
         var tableFormatted=decode(table);
         var obj = eval("(" + tableFormatted + ")");
         return obj;
        """),format.raw/*26.9*/("""}"""),format.raw/*26.10*/("""
    
      function drawVisualization() """),format.raw/*28.36*/("""{"""),format.raw/*28.37*/("""
        var dashboard = new google.visualization.Dashboard(
             document.getElementById('dashboard'));
      
         var control = new google.visualization.ControlWrapper("""),format.raw/*32.64*/("""{"""),format.raw/*32.65*/("""
           'controlType': 'ChartRangeFilter',
           'containerId': 'control',
           'options': """),format.raw/*35.23*/("""{"""),format.raw/*35.24*/("""
             // Filter by the date axis.
             'filterColumnIndex': 0,
             'ui': """),format.raw/*38.20*/("""{"""),format.raw/*38.21*/("""
               'chartType': 'LineChart',
               'chartOptions': """),format.raw/*40.32*/("""{"""),format.raw/*40.33*/("""
                 'chartArea': """),format.raw/*41.31*/("""{"""),format.raw/*41.32*/("""'width': '90%'"""),format.raw/*41.46*/("""}"""),format.raw/*41.47*/(""",
                 'hAxis': """),format.raw/*42.27*/("""{"""),format.raw/*42.28*/("""'baselineColor': 'none'"""),format.raw/*42.51*/("""}"""),format.raw/*42.52*/("""
               """),format.raw/*43.16*/("""}"""),format.raw/*43.17*/(""",
               // Display a single series that shows the closing value of the stock.
               // Thus, this view has two columns: the date (axis) and the stock value (line series).
               'chartView': """),format.raw/*46.29*/("""{"""),format.raw/*46.30*/("""
                 'columns': [0, 2]
               """),format.raw/*48.16*/("""}"""),format.raw/*48.17*/(""",
               // 1 day in milliseconds = 24 * 60 * 60 * 1000 = 86,400,000
               'minRangeSize': 86400000
             """),format.raw/*51.14*/("""}"""),format.raw/*51.15*/("""
           """),format.raw/*52.12*/("""}"""),format.raw/*52.13*/(""",
           // Initial range: 2012-02-09 to 2012-03-20.
          // 'state': """),format.raw/*54.23*/("""{"""),format.raw/*54.24*/("""'range': """),format.raw/*54.33*/("""{"""),format.raw/*54.34*/("""'start': new Date(2012, 1, 9), 'end': new Date(2012, 2, 20)"""),format.raw/*54.93*/("""}"""),format.raw/*54.94*/("""}"""),format.raw/*54.95*/("""
         """),format.raw/*55.10*/("""}"""),format.raw/*55.11*/(""");
      
         var chart = new google.visualization.ChartWrapper("""),format.raw/*57.60*/("""{"""),format.raw/*57.61*/("""
        	
           'chartType': 'LineChart',
           'containerId': 'chart',
           'options': """),format.raw/*61.23*/("""{"""),format.raw/*61.24*/("""
             // Use the same chart area width as the control for axis alignment.
             'chartArea': """),format.raw/*63.27*/("""{"""),format.raw/*63.28*/("""'height': '80%', 'width': '90%'"""),format.raw/*63.59*/("""}"""),format.raw/*63.60*/(""",
             'hAxis': """),format.raw/*64.23*/("""{"""),format.raw/*64.24*/("""'slantedText': false"""),format.raw/*64.44*/("""}"""),format.raw/*64.45*/(""",
             'vAxis': """),format.raw/*65.23*/("""{"""),format.raw/*65.24*/("""'viewWindow': """),format.raw/*65.38*/("""{"""),format.raw/*65.39*/("""'min': 0, 'max': 10"""),format.raw/*65.58*/("""}"""),format.raw/*65.59*/(""", 'title': 'Number of Bugs'"""),format.raw/*65.86*/("""}"""),format.raw/*65.87*/(""",
             'legend': """),format.raw/*66.24*/("""{"""),format.raw/*66.25*/("""'position': 'none'"""),format.raw/*66.43*/("""}"""),format.raw/*66.44*/(""",
             'title': 'Number of Bugs: Java Versus Native'
           """),format.raw/*68.12*/("""}"""),format.raw/*68.13*/(""",
           // Convert the first column from 'date' to 'string'.
           'view': """),format.raw/*70.20*/("""{"""),format.raw/*70.21*/("""
             'columns': [
               """),format.raw/*72.16*/("""{"""),format.raw/*72.17*/("""
                 'calc': function(dataTable, rowIndex) """),format.raw/*73.56*/("""{"""),format.raw/*73.57*/("""
                   return dataTable.getFormattedValue(rowIndex, 0);
                 """),format.raw/*75.18*/("""}"""),format.raw/*75.19*/(""",
                 'type': 'string'
               """),format.raw/*77.16*/("""}"""),format.raw/*77.17*/(""", 1, 2]
           """),format.raw/*78.12*/("""}"""),format.raw/*78.13*/("""
         """),format.raw/*79.10*/("""}"""),format.raw/*79.11*/(""");
      
         var data = new google.visualization.DataTable();
         data.addColumn('date', 'Date');
         data.addColumn('number', 'Java Bugs');
         data.addColumn('number', 'Native Bugs');
         
      
         /* Create random stock values, just like it works in reality.
         var open, close = 300;
         var low, high;
         for (var day = 1; day < 121; ++day) """),format.raw/*90.46*/("""{"""),format.raw/*90.47*/("""
           var change = (Math.sin(day / 2.5 + Math.PI) + Math.sin(day / 3) - Math.cos(day * 0.7)) * 150;
           change = change >= 0 ? change + 10 : change - 10;
           open = close;
           close = Math.max(50, open + change);
           low = Math.min(open, close) - (Math.cos(day * 1.7) + 1) * 15;
           low = Math.max(0, low);
           high = Math.max(open, close) + (Math.cos(day * 1.3) + 1) * 15;
           
           data.addRow([new Date(2012, 0 ,day), Math.round(low), Math.round(open)]);
         """),format.raw/*100.10*/("""}"""),format.raw/*100.11*/("""
         */
         data.addRows(ra());
         dashboard.bind(control, chart);
         dashboard.draw(data);
      """),format.raw/*105.7*/("""}"""),format.raw/*105.8*/("""
      

      google.setOnLoadCallback(drawVisualization);
    </script>
  </head>
  <body>
    <div id="dashboard">
        <div id="chart" style='width: 915px; height: 300px;'></div>
        <div id="control" style='width: 915px; height: 50px;'></div>
    </div>
  </body>
  </html>"""))}
    }
    
    def render(content:Html): play.api.templates.Html = apply(content)
    
    def f:((Html) => play.api.templates.Html) = (content) => apply(content)
    
    def ref: this.type = this

}
                /*
                    -- GENERATED --
                    DATE: Tue Jul 23 11:40:03 EDT 2013
                    SOURCE: C:/Users/acarey/Desktop/andrewregressionsite/regressionsite/app/views/javaNative.scala.html
                    HASH: d115327e71f11506118a282bd8808a8c613805d5
                    MATRIX: 726->1|818->16|1200->370|1229->371|1292->406|1321->407|1440->498|1469->499|1626->629|1654->630|1763->711|1792->712|1851->735|1911->773|2070->905|2099->906|2170->949|2199->950|2414->1137|2443->1138|2580->1247|2609->1248|2738->1349|2767->1350|2870->1425|2899->1426|2959->1458|2988->1459|3030->1473|3059->1474|3116->1503|3145->1504|3196->1527|3225->1528|3270->1545|3299->1546|3547->1766|3576->1767|3657->1820|3686->1821|3847->1954|3876->1955|3917->1968|3946->1969|4055->2050|4084->2051|4121->2060|4150->2061|4237->2120|4266->2121|4295->2122|4334->2133|4363->2134|4462->2205|4491->2206|4628->2315|4657->2316|4795->2426|4824->2427|4883->2458|4912->2459|4965->2484|4994->2485|5042->2505|5071->2506|5124->2531|5153->2532|5195->2546|5224->2547|5271->2566|5300->2567|5355->2594|5384->2595|5438->2621|5467->2622|5513->2640|5542->2641|5644->2715|5673->2716|5788->2803|5817->2804|5889->2848|5918->2849|6003->2906|6032->2907|6148->2995|6177->2996|6258->3049|6287->3050|6335->3070|6364->3071|6403->3082|6432->3083|6867->3490|6896->3491|7463->4029|7493->4030|7646->4155|7675->4156
                    LINES: 26->1|29->1|38->10|38->10|38->10|38->10|41->13|41->13|45->17|45->17|49->21|49->21|50->22|50->22|54->26|54->26|56->28|56->28|60->32|60->32|63->35|63->35|66->38|66->38|68->40|68->40|69->41|69->41|69->41|69->41|70->42|70->42|70->42|70->42|71->43|71->43|74->46|74->46|76->48|76->48|79->51|79->51|80->52|80->52|82->54|82->54|82->54|82->54|82->54|82->54|82->54|83->55|83->55|85->57|85->57|89->61|89->61|91->63|91->63|91->63|91->63|92->64|92->64|92->64|92->64|93->65|93->65|93->65|93->65|93->65|93->65|93->65|93->65|94->66|94->66|94->66|94->66|96->68|96->68|98->70|98->70|100->72|100->72|101->73|101->73|103->75|103->75|105->77|105->77|106->78|106->78|107->79|107->79|118->90|118->90|128->100|128->100|133->105|133->105
                    -- GENERATED --
                */
            