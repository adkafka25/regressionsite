
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
object dataList extends BaseScalaTemplate[play.api.templates.Html,Format[play.api.templates.Html]](play.api.templates.HtmlFormat) with play.api.templates.Template5[String,String,String,String,Form[Run],play.api.templates.Html] {

    /**/
    def apply/*1.2*/(f1: String, f2: String, p1: String, p2: String, dataList: Form[Run]):play.api.templates.Html = {
        _display_ {
def /*5.2*/header/*5.8*/(key:String, title:String):play.api.templates.Html = {_display_(

Seq[Any](format.raw/*5.38*/("""
    <th class=""""),_display_(Seq[Any](/*6.17*/key/*6.20*/.replace(".","_"))),format.raw/*6.37*/(""" header "headerSortUp"">
        <a href= >"""),_display_(Seq[Any](/*7.20*/title)),format.raw/*7.25*/("""</a>
    </th>
""")))};
Seq[Any](format.raw/*1.71*/("""



"""),format.raw/*9.2*/("""

"""),_display_(Seq[Any](/*11.2*/homeSkeleton/*11.14*/ {_display_(Seq[Any](format.raw/*11.16*/("""
	<link rel="stylesheet" type="text/css" href=""""),_display_(Seq[Any](/*12.48*/routes/*12.54*/.Assets.at("stylesheets/bootstrap.min.css"))),format.raw/*12.97*/("""">
    <script type="text/javascript" src=""""),_display_(Seq[Any](/*13.42*/routes/*13.48*/.Application.javascriptRoutes())),format.raw/*13.79*/(""""></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
       
     	  <center><h1>Runs that share """),_display_(Seq[Any](/*16.38*/f1)),format.raw/*16.40*/(""" and """),_display_(Seq[Any](/*16.46*/f2)),format.raw/*16.48*/("""</h1> </center>
   """),_display_(Seq[Any](/*17.5*/if(Run.dataSet(f1, f2, p1, p2).size == 0)/*17.46*/ {_display_(Seq[Any](format.raw/*17.48*/("""
        
        <div class="well">
            <em>Nothing to display</em>
        </div>
        
    """)))}/*23.7*/else/*23.12*/{_display_(Seq[Any](format.raw/*23.13*/("""     
        
        <table class="run zebra-striped">
            <thead>
                <tr>
                	"""),_display_(Seq[Any](/*28.19*/header("date.name", "Date"))),format.raw/*28.46*/("""
                    """),_display_(Seq[Any](/*29.22*/header("name", "Run Name"))),format.raw/*29.48*/("""
                    """),_display_(Seq[Any](/*30.22*/header("version.name", "Version"))),format.raw/*30.55*/("""
                    """),_display_(Seq[Any](/*31.22*/header("format.name", "Format"))),format.raw/*31.53*/("""
                    """),_display_(Seq[Any](/*32.22*/header("svn.num", "SVN"))),format.raw/*32.46*/("""
                    """),_display_(Seq[Any](/*33.22*/header("performance.time", "Performance Time"))),format.raw/*33.68*/("""
                    """),_display_(Seq[Any](/*34.22*/header("better", "# Better"))),format.raw/*34.50*/("""
                    """),_display_(Seq[Any](/*35.22*/header("worse", "# Worse"))),format.raw/*35.48*/("""
					"""),_display_(Seq[Any](/*36.7*/header("neutral", "# Neutral"))),format.raw/*36.37*/("""
                    """),_display_(Seq[Any](/*37.22*/header("bugs", "# Bugs"))),format.raw/*37.46*/("""
                    """),_display_(Seq[Any](/*38.22*/header("notdecompressed", "# Not Decompressed"))),format.raw/*38.69*/("""
                </tr>
            </thead>
            <tbody>

                """),_display_(Seq[Any](/*43.18*/for(run <- Run.dataSet(f1, f2, p1, p2)) yield /*43.57*/ {_display_(Seq[Any](format.raw/*43.59*/("""
                    <tr>
                    
 						<td>
                            """),_display_(Seq[Any](/*47.30*/if(run.date == null)/*47.50*/ {_display_(Seq[Any](format.raw/*47.52*/("""
                                <em>-</em>
                            """)))}/*49.31*/else/*49.36*/{_display_(Seq[Any](format.raw/*49.37*/("""
                                """),_display_(Seq[Any](/*50.34*/run/*50.37*/.date.name.format("dd MMM yyyy"))),format.raw/*50.69*/("""
                            """)))})),format.raw/*51.30*/("""
                        </td>                   
                        <td>
                            """),_display_(Seq[Any](/*54.30*/if(run.name == null)/*54.50*/ {_display_(Seq[Any](format.raw/*54.52*/("""
                                <em>-</em>
                            """)))}/*56.31*/else/*56.36*/{_display_(Seq[Any](format.raw/*56.37*/("""
                                """),_display_(Seq[Any](/*57.34*/run/*57.37*/.name)),format.raw/*57.42*/("""
                            """)))})),format.raw/*58.30*/("""
                        </td>
						<td>
                            """),_display_(Seq[Any](/*61.30*/if(run.version == null)/*61.53*/ {_display_(Seq[Any](format.raw/*61.55*/("""
                                <em>-</em>
                            """)))}/*63.31*/else/*63.36*/{_display_(Seq[Any](format.raw/*63.37*/("""
                                """),_display_(Seq[Any](/*64.34*/run/*64.37*/.version.name)),format.raw/*64.50*/(""" of """),_display_(Seq[Any](/*64.55*/run/*64.58*/.version.platform.name)),format.raw/*64.80*/("""
                            """)))})),format.raw/*65.30*/("""
                        </td>
                        <td>
                            """),_display_(Seq[Any](/*68.30*/if(run.format == null)/*68.52*/ {_display_(Seq[Any](format.raw/*68.54*/("""
                                <em>-</em>
                            """)))}/*70.31*/else/*70.36*/{_display_(Seq[Any](format.raw/*70.37*/("""
                                """),_display_(Seq[Any](/*71.34*/run/*71.37*/.format.name)),format.raw/*71.49*/("""
                            """)))})),format.raw/*72.30*/("""
                        </td>

						<td>
                            """),_display_(Seq[Any](/*76.30*/if(run.svn == null)/*76.49*/ {_display_(Seq[Any](format.raw/*76.51*/("""
                                <em>-</em>
                            """)))}/*78.31*/else/*78.36*/{_display_(Seq[Any](format.raw/*78.37*/("""
                                """),_display_(Seq[Any](/*79.34*/run/*79.37*/.svn.num)),format.raw/*79.45*/("""
                            """)))})),format.raw/*80.30*/("""
                        </td>
						<td>
                            """),_display_(Seq[Any](/*83.30*/if(run.performance == null)/*83.57*/ {_display_(Seq[Any](format.raw/*83.59*/("""
                                <em>-</em>
                            """)))}/*85.31*/else/*85.36*/{_display_(Seq[Any](format.raw/*85.37*/("""
                                """),_display_(Seq[Any](/*86.34*/run/*86.37*/.performance.time.format("hh:mm:ss"))),format.raw/*86.73*/("""
                            """)))})),format.raw/*87.30*/("""
                        </td>

						<td>
                            """),_display_(Seq[Any](/*91.30*/if(Run.calculateDifferences(run,DiffType.getDiffTypeByID(DiffType.getDiffTypeID("Better"))) == 0)/*91.127*/ {_display_(Seq[Any](format.raw/*91.129*/("""
                                <em>-</em>
                            """)))}/*93.31*/else/*93.36*/{_display_(Seq[Any](format.raw/*93.37*/("""
                                """),_display_(Seq[Any](/*94.34*/(Run.calculateDifferences(run,DiffType.getDiffTypeByID(DiffType.getDiffTypeID("Better")))))),format.raw/*94.124*/("""
                            """)))})),format.raw/*95.30*/("""
                        </td>
                        <td>
                            """),_display_(Seq[Any](/*98.30*/if(Run.calculateDifferences(run,DiffType.getDiffTypeByID(DiffType.getDiffTypeID("Worse"))) == 0)/*98.126*/ {_display_(Seq[Any](format.raw/*98.128*/("""
                                <em>-</em>
                            """)))}/*100.31*/else/*100.36*/{_display_(Seq[Any](format.raw/*100.37*/("""
                                """),_display_(Seq[Any](/*101.34*/(Run.calculateDifferences(run,DiffType.getDiffTypeByID(DiffType.getDiffTypeID("Worse")))))),format.raw/*101.123*/("""
                            """)))})),format.raw/*102.30*/("""
                        </td>
						<td>
                            """),_display_(Seq[Any](/*105.30*/if(Run.calculateDifferences(run,DiffType.getDiffTypeByID(DiffType.getDiffTypeID("Neutral"))) == 0)/*105.128*/ {_display_(Seq[Any](format.raw/*105.130*/("""
                                <em>-</em>
                            """)))}/*107.31*/else/*107.36*/{_display_(Seq[Any](format.raw/*107.37*/("""
                                """),_display_(Seq[Any](/*108.34*/(Run.calculateDifferences(run,DiffType.getDiffTypeByID(DiffType.getDiffTypeID("Neutral")))))),format.raw/*108.125*/("""
                            """)))})),format.raw/*109.30*/("""
                        </td>
						<td>
                            """),_display_(Seq[Any](/*112.30*/if(Run.calculateBugs(run) == 0)/*112.61*/ {_display_(Seq[Any](format.raw/*112.63*/("""
                                <em>-</em>
                            """)))}/*114.31*/else/*114.36*/{_display_(Seq[Any](format.raw/*114.37*/("""
                                """),_display_(Seq[Any](/*115.34*/(Run.calculateBugs(run)))),format.raw/*115.58*/("""
                            """)))})),format.raw/*116.30*/("""
                        </td>
						<td>
                           
                               """),_display_(Seq[Any](/*120.33*/PageOut/*120.40*/.getPagesNotDecompressed(run.id))),format.raw/*120.72*/("""
                            
                        </td>
                        
                    </tr>
                """)))})),format.raw/*125.18*/("""

            </tbody>
        </table>
     
	<p>
	
	</p>

      """),_display_(Seq[Any](/*134.8*/if(Run.dataSet(f1, f2, p1, p2).size >= 2)/*134.49*/ {_display_(Seq[Any](format.raw/*134.51*/("""
     
        <p>
	
		</p>
		 <center><h1>Total Stats</h1> </center>
         <table class="run zebra-striped">
            <thead>
                <tr>
                    """),_display_(Seq[Any](/*143.22*/header("Runs", "Number of runs"))),format.raw/*143.54*/("""
                    """),_display_(Seq[Any](/*144.22*/header("better", "Total # Better"))),format.raw/*144.56*/("""
                    """),_display_(Seq[Any](/*145.22*/header("worse", "Total # Worse"))),format.raw/*145.54*/("""
					"""),_display_(Seq[Any](/*146.7*/header("neutral", "Total # Neutral"))),format.raw/*146.43*/("""
                    """),_display_(Seq[Any](/*147.22*/header("bugs", "Total # Bugs"))),format.raw/*147.52*/("""
                    """),_display_(Seq[Any](/*148.22*/header("notdecompressed", "Total # Not Decompressed"))),format.raw/*148.75*/("""
                </tr>
            </thead>
            <tbody>
		
              
                    <tr>
                    	<td>
                                """),_display_(Seq[Any](/*156.34*/Run/*156.37*/.dataSet(f1, f2, p1, p2).size)),format.raw/*156.66*/("""                          
                        </td>
						<td>
                                """),_display_(Seq[Any](/*159.34*/Run/*159.37*/.getData(Run.dataSet(f1, f2, p1, p2)).better)),format.raw/*159.81*/("""                          
                        </td>
                        <td>
                                """),_display_(Seq[Any](/*162.34*/Run/*162.37*/.getData(Run.dataSet(f1, f2, p1, p2)).worse)),format.raw/*162.80*/("""                            
                        </td>
						<td>
                                """),_display_(Seq[Any](/*165.34*/Run/*165.37*/.getData(Run.dataSet(f1, f2, p1, p2)).neutral)),format.raw/*165.82*/("""                            
                        </td>
						<td>
                                """),_display_(Seq[Any](/*168.34*/Run/*168.37*/.getData(Run.dataSet(f1, f2, p1, p2)).bugs)),format.raw/*168.79*/("""           
                        </td>
						<td>
                             	"""),_display_(Seq[Any](/*171.32*/Run/*171.35*/.getData(Run.dataSet(f1, f2, p1, p2)).notDecompressed)),format.raw/*171.88*/(""" 
                        </td>
                    </tr>
              	  
              	

            </tbody>
        </table>
        
    """)))})),format.raw/*180.6*/(""" 
       
         <table class="run zebra-striped">
            <thead>
                <tr>
                    
                    """),_display_(Seq[Any](/*186.22*/header("better", "Average Better"))),format.raw/*186.56*/("""
                    """),_display_(Seq[Any](/*187.22*/header("worse", "Average Worse"))),format.raw/*187.54*/("""
					"""),_display_(Seq[Any](/*188.7*/header("neutral", "Average Neutral"))),format.raw/*188.43*/("""
                    """),_display_(Seq[Any](/*189.22*/header("bugs", "Average Bugs"))),format.raw/*189.52*/("""
                    """),_display_(Seq[Any](/*190.22*/header("notdecompressed", "Average Total # Not Decompressed"))),format.raw/*190.83*/("""
                </tr>
            </thead>
            <tbody>
		
              
                    <tr>
						<td>
                                """),_display_(Seq[Any](/*198.34*/(CallData.divide(Run.getData(Run.dataSet(f1, f2, p1, p2)).better, Run.dataSet(f1, f2, p1, p2).size)))),format.raw/*198.134*/("""  
                                                         
                        </td>
                        <td>
                                """),_display_(Seq[Any](/*202.34*/(CallData.divide(Run.getData(Run.dataSet(f1, f2, p1, p2)).worse, Run.dataSet(f1, f2, p1, p2).size)))),format.raw/*202.133*/("""                          
                        </td>
						<td>
                                """),_display_(Seq[Any](/*205.34*/(CallData.divide(Run.getData(Run.dataSet(f1, f2, p1, p2)).neutral, Run.dataSet(f1, f2, p1, p2).size)))),format.raw/*205.135*/("""                       
                        </td>
						<td>
                                """),_display_(Seq[Any](/*208.34*/(CallData.divide(Run.getData(Run.dataSet(f1, f2, p1, p2)).bugs, Run.dataSet(f1, f2, p1, p2).size)))),format.raw/*208.132*/(""" 
                        </td>
						<td>
                                """),_display_(Seq[Any](/*211.34*/(CallData.divide(Run.getData(Run.dataSet(f1, f2, p1, p2)).notDecompressed, Run.dataSet(f1, f2, p1, p2).size)))),format.raw/*211.143*/("""
                        </td>
                    </tr>
              	  
              	

            </tbody>
        </table>
        <input type = "button" id = "test" value= "Download in Excel" class="btn primary" 
    	  onclick = "download('"""),_display_(Seq[Any](/*220.30*/f1)),format.raw/*220.32*/("""','"""),_display_(Seq[Any](/*220.36*/f2)),format.raw/*220.38*/("""', '"""),_display_(Seq[Any](/*220.43*/p1)),format.raw/*220.45*/("""', '"""),_display_(Seq[Any](/*220.50*/p2)),format.raw/*220.52*/("""')" method = "POST"/>
		<script>
			function download(f1,f2,p1,p2) """),format.raw/*222.35*/("""{"""),format.raw/*222.36*/("""

			window.location = jsRoutes.controllers.Application.createFile(f1,f2,p1,p2).url ;
	
	
				"""),format.raw/*227.5*/("""}"""),format.raw/*227.6*/("""
		</script>
       
    """)))})),format.raw/*230.6*/("""    
""")))})),format.raw/*231.2*/("""
"""))}
    }
    
    def render(f1:String,f2:String,p1:String,p2:String,dataList:Form[Run]): play.api.templates.Html = apply(f1,f2,p1,p2,dataList)
    
    def f:((String,String,String,String,Form[Run]) => play.api.templates.Html) = (f1,f2,p1,p2,dataList) => apply(f1,f2,p1,p2,dataList)
    
    def ref: this.type = this

}
                /*
                    -- GENERATED --
                    DATE: Tue Jul 23 11:40:03 EDT 2013
                    SOURCE: C:/Users/acarey/Desktop/andrewregressionsite/regressionsite/app/views/dataList.scala.html
                    HASH: 1ca4b9308d590e87443947da0bb77ad3a007563f
                    MATRIX: 757->1|886->79|899->85|992->115|1045->133|1056->136|1094->153|1174->198|1200->203|1257->70|1291->221|1331->226|1352->238|1392->240|1477->289|1492->295|1557->338|1638->383|1653->389|1706->420|1895->573|1919->575|1961->581|1985->583|2041->604|2091->645|2131->647|2261->760|2274->765|2313->766|2470->887|2519->914|2578->937|2626->963|2685->986|2740->1019|2799->1042|2852->1073|2911->1096|2957->1120|3016->1143|3084->1189|3143->1212|3193->1240|3252->1263|3300->1289|3343->1297|3395->1327|3454->1350|3500->1374|3559->1397|3628->1444|3751->1531|3806->1570|3846->1572|3974->1664|4003->1684|4043->1686|4137->1762|4150->1767|4189->1768|4260->1803|4272->1806|4326->1838|4389->1869|4536->1980|4565->2000|4605->2002|4699->2078|4712->2083|4751->2084|4822->2119|4834->2122|4861->2127|4924->2158|5034->2232|5066->2255|5106->2257|5200->2333|5213->2338|5252->2339|5323->2374|5335->2377|5370->2390|5411->2395|5423->2398|5467->2420|5530->2451|5658->2543|5689->2565|5729->2567|5823->2643|5836->2648|5875->2649|5946->2684|5958->2687|5992->2699|6055->2730|6167->2806|6195->2825|6235->2827|6329->2903|6342->2908|6381->2909|6452->2944|6464->2947|6494->2955|6557->2986|6667->3060|6703->3087|6743->3089|6837->3165|6850->3170|6889->3171|6960->3206|6972->3209|7030->3245|7093->3276|7205->3352|7312->3449|7353->3451|7447->3527|7460->3532|7499->3533|7570->3568|7683->3658|7746->3689|7874->3781|7980->3877|8021->3879|8116->3955|8130->3960|8170->3961|8242->3996|8355->4085|8419->4116|8530->4190|8639->4288|8681->4290|8776->4366|8790->4371|8830->4372|8902->4407|9017->4498|9081->4529|9192->4603|9233->4634|9274->4636|9369->4712|9383->4717|9423->4718|9495->4753|9542->4777|9606->4808|9749->4914|9766->4921|9821->4953|9987->5086|10099->5162|10150->5203|10191->5205|10412->5389|10467->5421|10527->5444|10584->5478|10644->5501|10699->5533|10743->5541|10802->5577|10862->5600|10915->5630|10975->5653|11051->5706|11262->5880|11275->5883|11327->5912|11468->6016|11481->6019|11548->6063|11707->6185|11720->6188|11786->6231|11929->6337|11942->6340|12010->6385|12153->6491|12166->6494|12231->6536|12355->6623|12368->6626|12444->6679|12630->6833|12809->6975|12866->7009|12926->7032|12981->7064|13025->7072|13084->7108|13144->7131|13197->7161|13257->7184|13341->7245|13537->7404|13661->7504|13855->7661|13978->7760|14119->7864|14244->7965|14382->8066|14504->8164|14620->8243|14753->8352|15049->8611|15074->8613|15115->8617|15140->8619|15182->8624|15207->8626|15249->8631|15274->8633|15372->8702|15402->8703|15529->8802|15558->8803|15619->8832|15658->8839
                    LINES: 26->1|28->5|28->5|30->5|31->6|31->6|31->6|32->7|32->7|35->1|39->9|41->11|41->11|41->11|42->12|42->12|42->12|43->13|43->13|43->13|46->16|46->16|46->16|46->16|47->17|47->17|47->17|53->23|53->23|53->23|58->28|58->28|59->29|59->29|60->30|60->30|61->31|61->31|62->32|62->32|63->33|63->33|64->34|64->34|65->35|65->35|66->36|66->36|67->37|67->37|68->38|68->38|73->43|73->43|73->43|77->47|77->47|77->47|79->49|79->49|79->49|80->50|80->50|80->50|81->51|84->54|84->54|84->54|86->56|86->56|86->56|87->57|87->57|87->57|88->58|91->61|91->61|91->61|93->63|93->63|93->63|94->64|94->64|94->64|94->64|94->64|94->64|95->65|98->68|98->68|98->68|100->70|100->70|100->70|101->71|101->71|101->71|102->72|106->76|106->76|106->76|108->78|108->78|108->78|109->79|109->79|109->79|110->80|113->83|113->83|113->83|115->85|115->85|115->85|116->86|116->86|116->86|117->87|121->91|121->91|121->91|123->93|123->93|123->93|124->94|124->94|125->95|128->98|128->98|128->98|130->100|130->100|130->100|131->101|131->101|132->102|135->105|135->105|135->105|137->107|137->107|137->107|138->108|138->108|139->109|142->112|142->112|142->112|144->114|144->114|144->114|145->115|145->115|146->116|150->120|150->120|150->120|155->125|164->134|164->134|164->134|173->143|173->143|174->144|174->144|175->145|175->145|176->146|176->146|177->147|177->147|178->148|178->148|186->156|186->156|186->156|189->159|189->159|189->159|192->162|192->162|192->162|195->165|195->165|195->165|198->168|198->168|198->168|201->171|201->171|201->171|210->180|216->186|216->186|217->187|217->187|218->188|218->188|219->189|219->189|220->190|220->190|228->198|228->198|232->202|232->202|235->205|235->205|238->208|238->208|241->211|241->211|250->220|250->220|250->220|250->220|250->220|250->220|250->220|250->220|252->222|252->222|257->227|257->227|260->230|261->231
                    -- GENERATED --
                */
            