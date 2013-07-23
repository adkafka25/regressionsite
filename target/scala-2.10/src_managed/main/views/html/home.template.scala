
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
object home extends BaseScalaTemplate[play.api.templates.Html,Format[play.api.templates.Html]](play.api.templates.HtmlFormat) with play.api.templates.Template0[play.api.templates.Html] {

    /**/
    def apply():play.api.templates.Html = {
        _display_ {
def /*1.2*/link/*1.6*/(f1:String, f2:String, p1:String, p2:String ) = {{
    
    
    
    // Generate the link
    routes.Application.dataList(f1, f2, p1, p2)
    
}};
Seq[Any](format.raw/*8.2*/("""


"""),_display_(Seq[Any](/*11.2*/homeMain/*11.10*/{_display_(Seq[Any](format.raw/*11.11*/("""
<!DOCTYPE html>
  <html>
  <head>
      <meta charset="utf-8">
      <script type="text/javascript" src=""""),_display_(Seq[Any](/*16.44*/routes/*16.50*/.Application.javascriptRoutes())),format.raw/*16.81*/(""""></script>
      <script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js">
      </script>
      <script type="text/javascript" src=""""),_display_(Seq[Any](/*19.44*/routes/*19.50*/.Assets.at("js/jquery.chained.min.js"))),format.raw/*19.88*/("""" charset="utf-8"></script>
      <script>
        /* if (jQuery().chained) """),format.raw/*21.34*/("""{"""),format.raw/*21.35*/("""  
              alert('jQuery is loaded!');  
         """),format.raw/*23.10*/("""}"""),format.raw/*23.11*/("""
          else"""),format.raw/*24.15*/("""{"""),format.raw/*24.16*/("""   
             alert('jQuery is not loaded!');  
         """),format.raw/*26.10*/("""}"""),format.raw/*26.11*/("""
        */
      </script>
      <script type="text/javascript" src=""""),_display_(Seq[Any](/*29.44*/routes/*29.50*/.Application.javascriptRoutes())),format.raw/*29.81*/(""""></script>
   </head>
   <center>
   <body>
      <select id="platform" name="#platform">
           <option value="Please select Platform">Please select Platform</option>
			"""),_display_(Seq[Any](/*35.5*/for(plat <- Platform.getList) yield /*35.34*/ {_display_(Seq[Any](format.raw/*35.36*/("""
           <option value="""),_display_(Seq[Any](/*36.27*/plat/*36.31*/.getPlatformName)),format.raw/*36.47*/(""" class = """),_display_(Seq[Any](/*36.57*/plat/*36.61*/.getPlatformName)),format.raw/*36.77*/("""> """),_display_(Seq[Any](/*36.80*/plat/*36.84*/.getPlatformName)),format.raw/*36.100*/("""</option>
           """)))})),format.raw/*37.13*/("""
      </select>
      <select id="format" name="#format">
           <option value="Please select Format">Please select Format</option>
           """),_display_(Seq[Any](/*41.13*/for(form <- FileFormat.getList) yield /*41.44*/ {_display_(Seq[Any](format.raw/*41.46*/("""
           <option value="""),_display_(Seq[Any](/*42.27*/form/*42.31*/.getFileFormatName)),format.raw/*42.49*/("""  class ="""),_display_(Seq[Any](/*42.59*/form/*42.63*/.getFileFormatName)),format.raw/*42.81*/(""">"""),_display_(Seq[Any](/*42.83*/form/*42.87*/.getFileFormatName)),format.raw/*42.105*/("""</option>
           """)))})),format.raw/*43.13*/("""
      </select>
      <select id="run" name="#run">
             
           """),_display_(Seq[Any](/*47.13*/for(run <- Run.getList) yield /*47.36*/ {_display_(Seq[Any](format.raw/*47.38*/("""
           <option value="""),_display_(Seq[Any](/*48.27*/run/*48.30*/.getRunID)),format.raw/*48.39*/("""   class = """),_display_(Seq[Any](/*48.51*/run/*48.54*/.getPlatformFormat)),format.raw/*48.72*/(""">"""),_display_(Seq[Any](/*48.74*/run/*48.77*/.getRunName)),format.raw/*48.88*/("""</option>
           """)))})),format.raw/*49.13*/("""
           <option value="">All Runs</option> 
           
      </select>
      <input type = "button" value= "Search" class="btn primary" 
      	onclick = "NavigateToSite('platform','format','version.platform.name', 'format.name','run')"/>
       
      <p>
      
      OR
      </p>
       
       <select id="platform2" name="#platform2">
           <option value="Please select Platform">Please select Platform</option>
			"""),_display_(Seq[Any](/*63.5*/for(plat <- Platform.getList) yield /*63.34*/ {_display_(Seq[Any](format.raw/*63.36*/("""
           <option value="""),_display_(Seq[Any](/*64.27*/plat/*64.31*/.getPlatformName)),format.raw/*64.47*/(""" class = """),_display_(Seq[Any](/*64.57*/plat/*64.61*/.getPlatformName)),format.raw/*64.77*/("""> """),_display_(Seq[Any](/*64.80*/plat/*64.84*/.getPlatformName)),format.raw/*64.100*/("""</option>
           """)))})),format.raw/*65.13*/("""
      </select>
      <select id="version2" name="#version2">
           <option value="">Please select Version</option>
           """),_display_(Seq[Any](/*69.13*/for(vers <- Version.getList) yield /*69.41*/ {_display_(Seq[Any](format.raw/*69.43*/("""
           <option value="""),_display_(Seq[Any](/*70.27*/vers/*70.31*/.getVersionName)),format.raw/*70.46*/("""  class = """),_display_(Seq[Any](/*70.57*/vers/*70.61*/.getThePlatform.getPlatformName)),format.raw/*70.92*/(""">"""),_display_(Seq[Any](/*70.94*/vers/*70.98*/.getVersionName)),format.raw/*70.113*/("""</option>
           """)))})),format.raw/*71.13*/("""
      </select>
      <select id="run2" name="#run2">
           
           """),_display_(Seq[Any](/*75.13*/for(run <- Run.getList) yield /*75.36*/ {_display_(Seq[Any](format.raw/*75.38*/("""
           <option value="""),_display_(Seq[Any](/*76.27*/run/*76.30*/.getRunID)),format.raw/*76.39*/("""   class = """),_display_(Seq[Any](/*76.51*/run/*76.54*/.version.getVersionName)),format.raw/*76.77*/(""">"""),_display_(Seq[Any](/*76.79*/run/*76.82*/.getRunName)),format.raw/*76.93*/("""</option>
           """)))})),format.raw/*77.13*/("""
           <option value="">All Runs</option> 
      </select>
      <input type = "button" value= "Search" class="btn primary"
       onclick = "NavigateToSite('platform2','version2','version.platform.name', 'version.name','run2')"/>
      
     <p>
     OR
      </p>  
  
  	<select id="date" name="#date">
           <option value="Choose from Dates">Choose from dates</option>
           """),_display_(Seq[Any](/*89.13*/for(da <- models.Date.getList) yield /*89.43*/ {_display_(Seq[Any](format.raw/*89.45*/("""
           <option value="""),_display_(Seq[Any](/*90.27*/da/*90.29*/.getDateName)),format.raw/*90.41*/("""  class = """),_display_(Seq[Any](/*90.52*/da/*90.54*/.getDateName)),format.raw/*90.66*/(""">"""),_display_(Seq[Any](/*90.68*/da/*90.70*/.getDateName)),format.raw/*90.82*/("""</option>
           """)))})),format.raw/*91.13*/("""
      </select>
      <select id="run3" name="#run3">
           
           """),_display_(Seq[Any](/*95.13*/for(run <- Run.getList) yield /*95.36*/ {_display_(Seq[Any](format.raw/*95.38*/("""
           <option value="""),_display_(Seq[Any](/*96.27*/run/*96.30*/.getRunID)),format.raw/*96.39*/("""  class = """),_display_(Seq[Any](/*96.50*/run/*96.53*/.getDateName)),format.raw/*96.65*/(""">"""),_display_(Seq[Any](/*96.67*/run/*96.70*/.getRunName)),format.raw/*96.81*/("""</option>
           """)))})),format.raw/*97.13*/("""
           <option value="">All Runs</option> 
      </select>
      <input type = "button" value= "Search" class="btn primary" 
      onclick = "NavigateToSite('','','','','run3')"/>
 <p>
      </p>
      

<script>
/**
 * Redirects to proper run data
 *  p1: param one (format.name, etc)
 *  p2: param two
 *	list1: The first list you're pulling a value from
 *	list2: The second list you're pulling a value from
 */
function NavigateToSite(list1,list2,p1,p2,id) """),format.raw/*114.47*/("""{"""),format.raw/*114.48*/("""
	
	var value = document.getElementById(id).value;
	if (value == "")"""),format.raw/*117.18*/("""{"""),format.raw/*117.19*/("""
		var f1 = document.getElementById(list1).value
		var f2 = document.getElementById(list2).value
		window.location = jsRoutes.controllers.Application.dataList(f1,f2,p1,p2).url ;
	"""),format.raw/*121.2*/("""}"""),format.raw/*121.3*/("""
	else """),format.raw/*122.7*/("""{"""),format.raw/*122.8*/("""
		
		window.location = jsRoutes.controllers.Application.getData(value).url ;
		
	"""),format.raw/*126.2*/("""}"""),format.raw/*126.3*/("""
	
	
	
"""),format.raw/*130.1*/("""}"""),format.raw/*130.2*/("""
</script>
  
 
      

      <script language="JavaScript" type="text/javascript">
      $("#run").chained("#platform, #format"); 
      $("#version2").chained("#platform2");
      $("#run2").chained("#version2"); 
      $("#run3").chained("#date"); 
      
      $('form').submit(function()"""),format.raw/*142.34*/("""{"""),format.raw/*142.35*/("""
    	    if($('#platform').val() == "" || $('#format').val() == "")"""),format.raw/*143.68*/("""{"""),format.raw/*143.69*/("""
    	        return false;
    	    """),format.raw/*145.10*/("""}"""),format.raw/*145.11*/("""
    	    """),format.raw/*146.10*/("""}"""),format.raw/*146.11*/(""");
      
      
      </script>

  </body>
 

 
  
<head>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <title>
      Google Visualization API Sample
    </title>
    <script type="text/javascript" src="http://www.google.com/jsapi"></script>
    <script type="text/javascript">
      google.load('visualization', '1.1', """),format.raw/*164.43*/("""{"""),format.raw/*164.44*/("""packages: ['corechart', 'controls']"""),format.raw/*164.79*/("""}"""),format.raw/*164.80*/(""");
    </script>
    <script type="text/javascript">
    function decode(encodedString) """),format.raw/*167.36*/("""{"""),format.raw/*167.37*/("""
		var tmpElement = document.createElement('span');
		tmpElement.innerHTML = encodedString;
		return tmpElement.innerHTML;
	  """),format.raw/*171.4*/("""}"""),format.raw/*171.5*/("""
    /**
    Converts data into suitable
    **/
        function ra()"""),format.raw/*175.22*/("""{"""),format.raw/*175.23*/("""
         var table=""""),_display_(Seq[Any](/*176.22*/{controllers.Application.createData()})),format.raw/*176.60*/("""";
         var tableFormatted=decode(table);
         var obj = eval("(" + tableFormatted + ")");
         return obj;
        """),format.raw/*180.9*/("""}"""),format.raw/*180.10*/("""
    
      function drawVisualization() """),format.raw/*182.36*/("""{"""),format.raw/*182.37*/("""
        var dashboard = new google.visualization.Dashboard(
             document.getElementById('dashboard'));
      
         var control = new google.visualization.ControlWrapper("""),format.raw/*186.64*/("""{"""),format.raw/*186.65*/("""
           'controlType': 'ChartRangeFilter',
           'containerId': 'control',
           'options': """),format.raw/*189.23*/("""{"""),format.raw/*189.24*/("""
             // Filter by the date axis.
             'filterColumnIndex': 0,
             'ui': """),format.raw/*192.20*/("""{"""),format.raw/*192.21*/("""
               'chartType': 'LineChart',
               'chartOptions': """),format.raw/*194.32*/("""{"""),format.raw/*194.33*/("""
                 'chartArea': """),format.raw/*195.31*/("""{"""),format.raw/*195.32*/("""'width': '90%'"""),format.raw/*195.46*/("""}"""),format.raw/*195.47*/(""",
                 'hAxis': """),format.raw/*196.27*/("""{"""),format.raw/*196.28*/("""'baselineColor': 'none'"""),format.raw/*196.51*/("""}"""),format.raw/*196.52*/("""
               """),format.raw/*197.16*/("""}"""),format.raw/*197.17*/(""",
               // Display a single series that shows the closing value of the stock.
               // Thus, this view has two columns: the date (axis) and the stock value (line series).
               'chartView': """),format.raw/*200.29*/("""{"""),format.raw/*200.30*/("""
                 'columns': [0, 2]
               """),format.raw/*202.16*/("""}"""),format.raw/*202.17*/(""",
               // 1 day in milliseconds = 24 * 60 * 60 * 1000 = 86,400,000
               'minRangeSize': 86400000
             """),format.raw/*205.14*/("""}"""),format.raw/*205.15*/("""
           """),format.raw/*206.12*/("""}"""),format.raw/*206.13*/(""",
           // Initial range: 2012-02-09 to 2012-03-20.
           'state': """),format.raw/*208.21*/("""{"""),format.raw/*208.22*/("""'range': """),format.raw/*208.31*/("""{"""),format.raw/*208.32*/("""'start': new Date(2012, 1, 9), 'end': new Date(2012, 2, 20)"""),format.raw/*208.91*/("""}"""),format.raw/*208.92*/("""}"""),format.raw/*208.93*/("""
         """),format.raw/*209.10*/("""}"""),format.raw/*209.11*/(""");
      
         var chart = new google.visualization.ChartWrapper("""),format.raw/*211.60*/("""{"""),format.raw/*211.61*/("""
           'chartType': 'LineChart',
           'containerId': 'chart',
           'options': """),format.raw/*214.23*/("""{"""),format.raw/*214.24*/("""
             // Use the same chart area width as the control for axis alignment.
             'chartArea': """),format.raw/*216.27*/("""{"""),format.raw/*216.28*/("""'height': '80%', 'width': '90%'"""),format.raw/*216.59*/("""}"""),format.raw/*216.60*/(""",
             'hAxis': """),format.raw/*217.23*/("""{"""),format.raw/*217.24*/("""'slantedText': false"""),format.raw/*217.44*/("""}"""),format.raw/*217.45*/(""",
             'vAxis': """),format.raw/*218.23*/("""{"""),format.raw/*218.24*/("""'viewWindow': """),format.raw/*218.38*/("""{"""),format.raw/*218.39*/("""'min': 0, 'max': 2000"""),format.raw/*218.60*/("""}"""),format.raw/*218.61*/("""}"""),format.raw/*218.62*/(""",
             'legend': """),format.raw/*219.24*/("""{"""),format.raw/*219.25*/("""'position': 'none'"""),format.raw/*219.43*/("""}"""),format.raw/*219.44*/("""
           """),format.raw/*220.12*/("""}"""),format.raw/*220.13*/(""",
           // Convert the first column from 'date' to 'string'.
           'view': """),format.raw/*222.20*/("""{"""),format.raw/*222.21*/("""
             'columns': [
               """),format.raw/*224.16*/("""{"""),format.raw/*224.17*/("""
                 'calc': function(dataTable, rowIndex) """),format.raw/*225.56*/("""{"""),format.raw/*225.57*/("""
                   return dataTable.getFormattedValue(rowIndex, 0);
                 """),format.raw/*227.18*/("""}"""),format.raw/*227.19*/(""",
                 'type': 'string'
               """),format.raw/*229.16*/("""}"""),format.raw/*229.17*/(""", 1, 2]
           """),format.raw/*230.12*/("""}"""),format.raw/*230.13*/("""
         """),format.raw/*231.10*/("""}"""),format.raw/*231.11*/(""");
      
         var data = new google.visualization.DataTable();
         data.addColumn('date', 'Date');
         data.addColumn('number', 'Stock low');
         data.addColumn('number', 'Stock open');
         
      
         // Create random stock values, just like it works in reality.
         var open, close = 300;
         var low, high;
         for (var day = 1; day < 121; ++day) """),format.raw/*242.46*/("""{"""),format.raw/*242.47*/("""
           var change = (Math.sin(day / 2.5 + Math.PI) + Math.sin(day / 3) - Math.cos(day * 0.7)) * 150;
           change = change >= 0 ? change + 10 : change - 10;
           open = close;
           close = Math.max(50, open + change);
           low = Math.min(open, close) - (Math.cos(day * 1.7) + 1) * 15;
           low = Math.max(0, low);
           high = Math.max(open, close) + (Math.cos(day * 1.3) + 1) * 15;
           
           data.addRow([new Date(2012, 0 ,day), Math.round(low), Math.round(open)]);
         """),format.raw/*252.10*/("""}"""),format.raw/*252.11*/("""
         data.addRows(ra());
         dashboard.bind(control, chart);
         dashboard.draw(data);
      """),format.raw/*256.7*/("""}"""),format.raw/*256.8*/("""
      

      google.setOnLoadCallback(drawVisualization);
    </script>
  </head>
  <body>
    <div id="dashboard">
        <div id="chart" style='width: 915px; height: 300px;'></div>
        <div id="control" style='width: 915px; height: 50px;'></div>
    </div>
  </body>
</center>
""")))})))}
    }
    
    def render(): play.api.templates.Html = apply()
    
    def f:(() => play.api.templates.Html) = () => apply()
    
    def ref: this.type = this

}
                /*
                    -- GENERATED --
                    DATE: Tue Jul 23 11:40:03 EDT 2013
                    SOURCE: C:/Users/acarey/Desktop/andrewregressionsite/regressionsite/app/views/home.scala.html
                    HASH: 8181ea278281e988db2e3cbdd21a22ff738b103d
                    MATRIX: 770->1|781->5|962->157|1004->164|1021->172|1060->173|1208->285|1223->291|1276->322|1473->483|1488->489|1548->527|1654->605|1683->606|1769->664|1798->665|1842->681|1871->682|1961->744|1990->745|2100->819|2115->825|2168->856|2386->1039|2431->1068|2471->1070|2535->1098|2548->1102|2586->1118|2632->1128|2645->1132|2683->1148|2722->1151|2735->1155|2774->1171|2829->1194|3018->1347|3065->1378|3105->1380|3169->1408|3182->1412|3222->1430|3268->1440|3281->1444|3321->1462|3359->1464|3372->1468|3413->1486|3468->1509|3587->1592|3626->1615|3666->1617|3730->1645|3742->1648|3773->1657|3821->1669|3833->1672|3873->1690|3911->1692|3923->1695|3956->1706|4011->1729|4492->2175|4537->2204|4577->2206|4641->2234|4654->2238|4692->2254|4738->2264|4751->2268|4789->2284|4828->2287|4841->2291|4880->2307|4935->2330|5109->2468|5153->2496|5193->2498|5257->2526|5270->2530|5307->2545|5354->2556|5367->2560|5420->2591|5458->2593|5471->2597|5509->2612|5564->2635|5683->2718|5722->2741|5762->2743|5826->2771|5838->2774|5869->2783|5917->2795|5929->2798|5974->2821|6012->2823|6024->2826|6057->2837|6112->2860|6555->3267|6601->3297|6641->3299|6705->3327|6716->3329|6750->3341|6797->3352|6808->3354|6842->3366|6880->3368|6891->3370|6925->3382|6980->3405|7099->3488|7138->3511|7178->3513|7242->3541|7254->3544|7285->3553|7332->3564|7344->3567|7378->3579|7416->3581|7428->3584|7461->3595|7516->3618|8028->4101|8058->4102|8158->4173|8188->4174|8399->4357|8428->4358|8464->4366|8493->4367|8607->4453|8636->4454|8675->4465|8704->4466|9037->4770|9067->4771|9165->4840|9195->4841|9263->4880|9293->4881|9333->4892|9363->4893|9771->5272|9801->5273|9865->5308|9895->5309|10015->5400|10045->5401|10203->5531|10232->5532|10335->5606|10365->5607|10425->5630|10486->5668|10646->5800|10676->5801|10748->5844|10778->5845|10994->6032|11024->6033|11162->6142|11192->6143|11322->6244|11352->6245|11456->6320|11486->6321|11547->6353|11577->6354|11620->6368|11650->6369|11708->6398|11738->6399|11790->6422|11820->6423|11866->6440|11896->6441|12145->6661|12175->6662|12257->6715|12287->6716|12449->6849|12479->6850|12521->6863|12551->6864|12659->6943|12689->6944|12727->6953|12757->6954|12845->7013|12875->7014|12905->7015|12945->7026|12975->7027|13075->7098|13105->7099|13232->7197|13262->7198|13401->7308|13431->7309|13491->7340|13521->7341|13575->7366|13605->7367|13654->7387|13684->7388|13738->7413|13768->7414|13811->7428|13841->7429|13891->7450|13921->7451|13951->7452|14006->7478|14036->7479|14083->7497|14113->7498|14155->7511|14185->7512|14301->7599|14331->7600|14404->7644|14434->7645|14520->7702|14550->7703|14667->7791|14697->7792|14779->7845|14809->7846|14858->7866|14888->7867|14928->7878|14958->7879|15393->8285|15423->8286|15990->8824|16020->8825|16160->8937|16189->8938
                    LINES: 28->1|28->1|36->8|39->11|39->11|39->11|44->16|44->16|44->16|47->19|47->19|47->19|49->21|49->21|51->23|51->23|52->24|52->24|54->26|54->26|57->29|57->29|57->29|63->35|63->35|63->35|64->36|64->36|64->36|64->36|64->36|64->36|64->36|64->36|64->36|65->37|69->41|69->41|69->41|70->42|70->42|70->42|70->42|70->42|70->42|70->42|70->42|70->42|71->43|75->47|75->47|75->47|76->48|76->48|76->48|76->48|76->48|76->48|76->48|76->48|76->48|77->49|91->63|91->63|91->63|92->64|92->64|92->64|92->64|92->64|92->64|92->64|92->64|92->64|93->65|97->69|97->69|97->69|98->70|98->70|98->70|98->70|98->70|98->70|98->70|98->70|98->70|99->71|103->75|103->75|103->75|104->76|104->76|104->76|104->76|104->76|104->76|104->76|104->76|104->76|105->77|117->89|117->89|117->89|118->90|118->90|118->90|118->90|118->90|118->90|118->90|118->90|118->90|119->91|123->95|123->95|123->95|124->96|124->96|124->96|124->96|124->96|124->96|124->96|124->96|124->96|125->97|142->114|142->114|145->117|145->117|149->121|149->121|150->122|150->122|154->126|154->126|158->130|158->130|170->142|170->142|171->143|171->143|173->145|173->145|174->146|174->146|192->164|192->164|192->164|192->164|195->167|195->167|199->171|199->171|203->175|203->175|204->176|204->176|208->180|208->180|210->182|210->182|214->186|214->186|217->189|217->189|220->192|220->192|222->194|222->194|223->195|223->195|223->195|223->195|224->196|224->196|224->196|224->196|225->197|225->197|228->200|228->200|230->202|230->202|233->205|233->205|234->206|234->206|236->208|236->208|236->208|236->208|236->208|236->208|236->208|237->209|237->209|239->211|239->211|242->214|242->214|244->216|244->216|244->216|244->216|245->217|245->217|245->217|245->217|246->218|246->218|246->218|246->218|246->218|246->218|246->218|247->219|247->219|247->219|247->219|248->220|248->220|250->222|250->222|252->224|252->224|253->225|253->225|255->227|255->227|257->229|257->229|258->230|258->230|259->231|259->231|270->242|270->242|280->252|280->252|284->256|284->256
                    -- GENERATED --
                */
            