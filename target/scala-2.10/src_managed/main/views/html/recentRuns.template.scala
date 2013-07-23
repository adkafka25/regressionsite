
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
object recentRuns extends BaseScalaTemplate[play.api.templates.Html,Format[play.api.templates.Html]](play.api.templates.HtmlFormat) with play.api.templates.Template6[String,String,String,String,Int,Form[Run],play.api.templates.Html] {

    /**/
    def apply/*1.2*/(f1: String, f2: String, p1: String, p2: String, d: Int,  dataList: Form[Run]):play.api.templates.Html = {
        _display_ {
def /*5.2*/header/*5.8*/(key:String, title:String):play.api.templates.Html = {_display_(

Seq[Any](format.raw/*5.38*/("""
    <th class=""""),_display_(Seq[Any](/*6.17*/key/*6.20*/.replace(".","_"))),format.raw/*6.37*/(""" header "headerSortUp"">
        <a href= >"""),_display_(Seq[Any](/*7.20*/title)),format.raw/*7.25*/("""</a>
    </th>
""")))};
Seq[Any](format.raw/*1.80*/("""



"""),format.raw/*9.2*/("""

"""),_display_(Seq[Any](/*11.2*/homeSkeleton/*11.14*/ {_display_(Seq[Any](format.raw/*11.16*/("""
	<link rel="stylesheet" type="text/css" href=""""),_display_(Seq[Any](/*12.48*/routes/*12.54*/.Assets.at("stylesheets/bootstrap.min.css"))),format.raw/*12.97*/("""">
    <script type="text/javascript" src=""""),_display_(Seq[Any](/*13.42*/routes/*13.48*/.Application.javascriptRoutes())),format.raw/*13.79*/(""""></script>
    <script src=""""),_display_(Seq[Any](/*14.19*/routes/*14.25*/.Assets.at("js/bootstrap.min.js"))),format.raw/*14.58*/(""""></script>	
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
       
     	  <center><h1> Last """),_display_(Seq[Any](/*17.28*/d)),format.raw/*17.29*/(""" Runs that share """),_display_(Seq[Any](/*17.47*/f1)),format.raw/*17.49*/(""" and """),_display_(Seq[Any](/*17.55*/f2)),format.raw/*17.57*/("""</h1> </center>
   """),_display_(Seq[Any](/*18.5*/if(Run.dataSet(f1, f2, p1, p2).size == 0)/*18.46*/ {_display_(Seq[Any](format.raw/*18.48*/("""
        
        <div class="well">
            <em>Nothing to display</em>
        </div>
        
    """)))}/*24.7*/else/*24.12*/{_display_(Seq[Any](format.raw/*24.13*/("""     
        
        <table class="run zebra-striped">
            <thead>
                <tr>
                	"""),_display_(Seq[Any](/*29.19*/header("date.name", "Date"))),format.raw/*29.46*/("""
                    """),_display_(Seq[Any](/*30.22*/header("name", "Run Name"))),format.raw/*30.48*/("""
                    """),_display_(Seq[Any](/*31.22*/header("version.name", "Version"))),format.raw/*31.55*/("""
                    """),_display_(Seq[Any](/*32.22*/header("format.name", "Format"))),format.raw/*32.53*/("""
                    """),_display_(Seq[Any](/*33.22*/header("svn.num", "SVN"))),format.raw/*33.46*/("""
                    """),_display_(Seq[Any](/*34.22*/header("performance.time", "Performance Time"))),format.raw/*34.68*/("""
                    """),_display_(Seq[Any](/*35.22*/header("format", "Format"))),format.raw/*35.48*/("""
                    """),_display_(Seq[Any](/*36.22*/header("better", "# Better"))),format.raw/*36.50*/("""
                    """),_display_(Seq[Any](/*37.22*/header("worse", "# Worse"))),format.raw/*37.48*/("""
					"""),_display_(Seq[Any](/*38.7*/header("neutral", "# Neutral"))),format.raw/*38.37*/("""
                    """),_display_(Seq[Any](/*39.22*/header("bugs", "# Bugs"))),format.raw/*39.46*/("""
                    """),_display_(Seq[Any](/*40.22*/header("notdecompressed", "# Not Decompressed"))),format.raw/*40.69*/("""
                </tr>
            </thead>
            <tbody>

                """),_display_(Seq[Any](/*45.18*/for(run <- Run.truncate(Run.dataSet(f1, f2, p1, p2), d)) yield /*45.74*/ {_display_(Seq[Any](format.raw/*45.76*/("""
                    <tr>
                    
 						<td>
                            """),_display_(Seq[Any](/*49.30*/if(run.date == null)/*49.50*/ {_display_(Seq[Any](format.raw/*49.52*/("""
                                <em>-</em>
                            """)))}/*51.31*/else/*51.36*/{_display_(Seq[Any](format.raw/*51.37*/("""
                                """),_display_(Seq[Any](/*52.34*/run/*52.37*/.date.name.format("dd MMM yyyy"))),format.raw/*52.69*/("""
                            """)))})),format.raw/*53.30*/("""
                        </td>                   
                        <td>
                            """),_display_(Seq[Any](/*56.30*/if(run.name == null)/*56.50*/ {_display_(Seq[Any](format.raw/*56.52*/("""
                                <em>-</em>
                            """)))}/*58.31*/else/*58.36*/{_display_(Seq[Any](format.raw/*58.37*/("""
                                """),_display_(Seq[Any](/*59.34*/run/*59.37*/.name)),format.raw/*59.42*/("""
                            """)))})),format.raw/*60.30*/("""
                        </td>
						<td>
                            """),_display_(Seq[Any](/*63.30*/if(run.version == null)/*63.53*/ {_display_(Seq[Any](format.raw/*63.55*/("""
                                <em>-</em>
                            """)))}/*65.31*/else/*65.36*/{_display_(Seq[Any](format.raw/*65.37*/("""
                                """),_display_(Seq[Any](/*66.34*/run/*66.37*/.version.name)),format.raw/*66.50*/(""" of """),_display_(Seq[Any](/*66.55*/run/*66.58*/.version.platform.name)),format.raw/*66.80*/("""
                            """)))})),format.raw/*67.30*/("""
                        </td>
                        <td>
                            """),_display_(Seq[Any](/*70.30*/if(run.format == null)/*70.52*/ {_display_(Seq[Any](format.raw/*70.54*/("""
                                <em>-</em>
                            """)))}/*72.31*/else/*72.36*/{_display_(Seq[Any](format.raw/*72.37*/("""
                                """),_display_(Seq[Any](/*73.34*/run/*73.37*/.format.name)),format.raw/*73.49*/("""
                            """)))})),format.raw/*74.30*/("""
                        </td>

						<td>
                            """),_display_(Seq[Any](/*78.30*/if(run.svn == null)/*78.49*/ {_display_(Seq[Any](format.raw/*78.51*/("""
                                <em>-</em>
                            """)))}/*80.31*/else/*80.36*/{_display_(Seq[Any](format.raw/*80.37*/("""
                                """),_display_(Seq[Any](/*81.34*/run/*81.37*/.svn.num)),format.raw/*81.45*/("""
                            """)))})),format.raw/*82.30*/("""
                        </td>
						<td>
                            """),_display_(Seq[Any](/*85.30*/if(run.performance == null)/*85.57*/ {_display_(Seq[Any](format.raw/*85.59*/("""
                                <em>-</em>
                            """)))}/*87.31*/else/*87.36*/{_display_(Seq[Any](format.raw/*87.37*/("""
                                """),_display_(Seq[Any](/*88.34*/run/*88.37*/.performance.time.format("hh:mm:ss"))),format.raw/*88.73*/("""
                            """)))})),format.raw/*89.30*/("""
                        </td>
                        <td>
                            """),_display_(Seq[Any](/*92.30*/if(run.format.name == null)/*92.57*/ {_display_(Seq[Any](format.raw/*92.59*/("""
                                <em>-</em>
                            """)))}/*94.31*/else/*94.36*/{_display_(Seq[Any](format.raw/*94.37*/("""
                                """),_display_(Seq[Any](/*95.34*/run/*95.37*/.format.name)),format.raw/*95.49*/("""
                            """)))})),format.raw/*96.30*/("""
                        </td>
						<td>
                            """),_display_(Seq[Any](/*99.30*/if(Run.calculateDifferences(run,DiffType.getDiffTypeByID(DiffType.getDiffTypeID("Better"))) == 0)/*99.127*/ {_display_(Seq[Any](format.raw/*99.129*/("""
                                <em>-</em>
                            """)))}/*101.31*/else/*101.36*/{_display_(Seq[Any](format.raw/*101.37*/("""
                                """),_display_(Seq[Any](/*102.34*/(Run.calculateDifferences(run,DiffType.getDiffTypeByID(DiffType.getDiffTypeID("Better")))))),format.raw/*102.124*/("""
                            """)))})),format.raw/*103.30*/("""
                        </td>
                        <td>
                            """),_display_(Seq[Any](/*106.30*/if(Run.calculateDifferences(run,DiffType.getDiffTypeByID(DiffType.getDiffTypeID("Worse"))) == 0)/*106.126*/ {_display_(Seq[Any](format.raw/*106.128*/("""
                                <em>-</em>
                            """)))}/*108.31*/else/*108.36*/{_display_(Seq[Any](format.raw/*108.37*/("""
                                """),_display_(Seq[Any](/*109.34*/(Run.calculateDifferences(run,DiffType.getDiffTypeByID(DiffType.getDiffTypeID("Worse")))))),format.raw/*109.123*/("""
                            """)))})),format.raw/*110.30*/("""
                        </td>
						<td>
                            """),_display_(Seq[Any](/*113.30*/if(Run.calculateDifferences(run,DiffType.getDiffTypeByID(DiffType.getDiffTypeID("Neutral"))) == 0)/*113.128*/ {_display_(Seq[Any](format.raw/*113.130*/("""
                                <em>-</em>
                            """)))}/*115.31*/else/*115.36*/{_display_(Seq[Any](format.raw/*115.37*/("""
                                """),_display_(Seq[Any](/*116.34*/(Run.calculateDifferences(run,DiffType.getDiffTypeByID(DiffType.getDiffTypeID("Neutral")))))),format.raw/*116.125*/("""
                            """)))})),format.raw/*117.30*/("""
                        </td>
						<td>
                            """),_display_(Seq[Any](/*120.30*/if(Run.calculateBugs(run) == 0)/*120.61*/ {_display_(Seq[Any](format.raw/*120.63*/("""
                                <em>-</em>
                            """)))}/*122.31*/else/*122.36*/{_display_(Seq[Any](format.raw/*122.37*/("""
                                """),_display_(Seq[Any](/*123.34*/(Run.calculateBugs(run)))),format.raw/*123.58*/("""
                            """)))})),format.raw/*124.30*/("""
                        </td>
						<td>
                           
                               """),_display_(Seq[Any](/*128.33*/PageOut/*128.40*/.getPagesNotDecompressed(run.id))),format.raw/*128.72*/("""
                            
                        </td>
                        
                    </tr>
                """)))})),format.raw/*133.18*/("""

            </tbody>
        </table>
     
	<p>
	
	</p>

      """),_display_(Seq[Any](/*142.8*/if(Run.dataSet(f1, f2, p1, p2).size >= 2)/*142.49*/ {_display_(Seq[Any](format.raw/*142.51*/("""
     
        <p>
	
		</p>
		 <center><h1>Total Stats</h1> </center>
         <table class="run zebra-striped">
            <thead>
                <tr>
                    """),_display_(Seq[Any](/*151.22*/header("Runs", "Number of runs"))),format.raw/*151.54*/("""
                    """),_display_(Seq[Any](/*152.22*/header("better", "Total # Better"))),format.raw/*152.56*/("""
                    """),_display_(Seq[Any](/*153.22*/header("worse", "Total # Worse"))),format.raw/*153.54*/("""
					"""),_display_(Seq[Any](/*154.7*/header("neutral", "Total # Neutral"))),format.raw/*154.43*/("""
                    """),_display_(Seq[Any](/*155.22*/header("bugs", "Total # Bugs"))),format.raw/*155.52*/("""
                    """),_display_(Seq[Any](/*156.22*/header("notdecompressed", "Total # Not Decompressed"))),format.raw/*156.75*/("""
                </tr>
            </thead>
            <tbody>
		
              
                    <tr>
                    	<td>
                                """),_display_(Seq[Any](/*164.34*/Run/*164.37*/.truncate(Run.dataSet(f1, f2, p1, p2), d))),format.raw/*164.78*/(""").size                         
                        </td>
						<td>
                                """),_display_(Seq[Any](/*167.34*/Run/*167.37*/.getData(Run.truncate(Run.dataSet(f1, f2, p1, p2), d)).better)),format.raw/*167.98*/("""                       
                        </td>
                        <td>
                                """),_display_(Seq[Any](/*170.34*/Run/*170.37*/.getData(Run.truncate(Run.dataSet(f1, f2, p1, p2), d)).worse)),format.raw/*170.97*/("""                          
                        </td>
						<td>
                                """),_display_(Seq[Any](/*173.34*/Run/*173.37*/.getData(Run.truncate(Run.dataSet(f1, f2, p1, p2), d)).neutral)),format.raw/*173.99*/("""                             
                        </td>
						<td>
                                """),_display_(Seq[Any](/*176.34*/Run/*176.37*/.getData(Run.truncate(Run.dataSet(f1, f2, p1, p2), d)).bugs)),format.raw/*176.96*/("""            
                        </td>
						<td>
                             
                        </td>
                    </tr>
              	  
              	

            </tbody>
        </table>
        
    """)))})),format.raw/*188.6*/(""" 
       
         <table class="run zebra-striped">
            <thead>
                <tr>
                    
                    """),_display_(Seq[Any](/*194.22*/header("better", "Average Better"))),format.raw/*194.56*/("""
                    """),_display_(Seq[Any](/*195.22*/header("worse", "Average Worse"))),format.raw/*195.54*/("""
					"""),_display_(Seq[Any](/*196.7*/header("neutral", "Average Neutral"))),format.raw/*196.43*/("""
                    """),_display_(Seq[Any](/*197.22*/header("bugs", "Average Bugs"))),format.raw/*197.52*/("""
                    """),_display_(Seq[Any](/*198.22*/header("notdecompressed", "Average Total # Not Decompressed"))),format.raw/*198.83*/("""
                </tr>
            </thead>
            <tbody>
		
              
                    <tr>
						<td>
                                """),_display_(Seq[Any](/*206.34*/(CallData.divide(Run.getData(Run.truncate(Run.dataSet(f1, f2, p1, p2), d)).better, Run.dataSet(f1, f2, p1, p2).size)))),format.raw/*206.151*/("""  
                                                         
                        </td>
                        <td>
                                """),_display_(Seq[Any](/*210.34*/(CallData.divide(Run.getData(Run.truncate(Run.dataSet(f1, f2, p1, p2), d)).worse, Run.dataSet(f1, f2, p1, p2).size)))),format.raw/*210.150*/("""                          
                        </td>
						<td>
                                """),_display_(Seq[Any](/*213.34*/(CallData.divide(Run.getData(Run.truncate(Run.dataSet(f1, f2, p1, p2), d)).neutral, Run.dataSet(f1, f2, p1, p2).size)))),format.raw/*213.152*/("""                       
                        </td>
						<td>
                                """),_display_(Seq[Any](/*216.34*/CallData/*216.42*/.divide(Run.getData(Run.truncate(Run.dataSet(f1, f2, p1, p2), d)).bugs, Run.dataSet(f1, f2, p1, p2).size))),format.raw/*216.147*/(""") 
                        </td>
						<td>
                                """),_display_(Seq[Any](/*219.34*/(CallData.divide(Run.getData(Run.truncate(Run.dataSet(f1, f2, p1, p2), d)).notDecompressed, Run.dataSet(f1, f2, p1, p2).size)))),format.raw/*219.160*/("""
                        </td>
                    </tr>
              	  
              	

            </tbody>
        </table>
         <input type = "button" id = "test" value= "Download in Excel" class="btn primary" 
      		onclick = "download('"""),_display_(Seq[Any](/*228.31*/f1)),format.raw/*228.33*/("""','"""),_display_(Seq[Any](/*228.37*/f2)),format.raw/*228.39*/("""', '"""),_display_(Seq[Any](/*228.44*/p1)),format.raw/*228.46*/("""', '"""),_display_(Seq[Any](/*228.51*/p2)),format.raw/*228.53*/("""')" method = "POST"/>
		<script>
			function download(f1,f2,p1,p2) """),format.raw/*230.35*/("""{"""),format.raw/*230.36*/("""

			window.location = jsRoutes.controllers.Application.createFile(f1,f2,p1,p2).url ;
	
	
				"""),format.raw/*235.5*/("""}"""),format.raw/*235.6*/("""
		</script>
       
    """)))})),format.raw/*238.6*/("""    
""")))})))}
    }
    
    def render(f1:String,f2:String,p1:String,p2:String,d:Int,dataList:Form[Run]): play.api.templates.Html = apply(f1,f2,p1,p2,d,dataList)
    
    def f:((String,String,String,String,Int,Form[Run]) => play.api.templates.Html) = (f1,f2,p1,p2,d,dataList) => apply(f1,f2,p1,p2,d,dataList)
    
    def ref: this.type = this

}
                /*
                    -- GENERATED --
                    DATE: Tue Jul 23 11:40:05 EDT 2013
                    SOURCE: C:/Users/acarey/Desktop/andrewregressionsite/regressionsite/app/views/recentRuns.scala.html
                    HASH: 7fbc4e95552914346746ffacaeb4125b38a1f193
                    MATRIX: 763->1|901->88|914->94|1007->124|1060->142|1071->145|1109->162|1189->207|1215->212|1272->79|1306->230|1346->235|1367->247|1407->249|1492->298|1507->304|1572->347|1653->392|1668->398|1721->429|1788->460|1803->466|1858->499|2038->643|2061->644|2115->662|2139->664|2181->670|2205->672|2261->693|2311->734|2351->736|2481->849|2494->854|2533->855|2690->976|2739->1003|2798->1026|2846->1052|2905->1075|2960->1108|3019->1131|3072->1162|3131->1185|3177->1209|3236->1232|3304->1278|3363->1301|3411->1327|3470->1350|3520->1378|3579->1401|3627->1427|3670->1435|3722->1465|3781->1488|3827->1512|3886->1535|3955->1582|4078->1669|4150->1725|4190->1727|4318->1819|4347->1839|4387->1841|4481->1917|4494->1922|4533->1923|4604->1958|4616->1961|4670->1993|4733->2024|4880->2135|4909->2155|4949->2157|5043->2233|5056->2238|5095->2239|5166->2274|5178->2277|5205->2282|5268->2313|5378->2387|5410->2410|5450->2412|5544->2488|5557->2493|5596->2494|5667->2529|5679->2532|5714->2545|5755->2550|5767->2553|5811->2575|5874->2606|6002->2698|6033->2720|6073->2722|6167->2798|6180->2803|6219->2804|6290->2839|6302->2842|6336->2854|6399->2885|6511->2961|6539->2980|6579->2982|6673->3058|6686->3063|6725->3064|6796->3099|6808->3102|6838->3110|6901->3141|7011->3215|7047->3242|7087->3244|7181->3320|7194->3325|7233->3326|7304->3361|7316->3364|7374->3400|7437->3431|7565->3523|7601->3550|7641->3552|7735->3628|7748->3633|7787->3634|7858->3669|7870->3672|7904->3684|7967->3715|8077->3789|8184->3886|8225->3888|8320->3964|8334->3969|8374->3970|8446->4005|8560->4095|8624->4126|8753->4218|8860->4314|8902->4316|8997->4392|9011->4397|9051->4398|9123->4433|9236->4522|9300->4553|9411->4627|9520->4725|9562->4727|9657->4803|9671->4808|9711->4809|9783->4844|9898->4935|9962->4966|10073->5040|10114->5071|10155->5073|10250->5149|10264->5154|10304->5155|10376->5190|10423->5214|10487->5245|10630->5351|10647->5358|10702->5390|10868->5523|10980->5599|11031->5640|11072->5642|11293->5826|11348->5858|11408->5881|11465->5915|11525->5938|11580->5970|11624->5978|11683->6014|11743->6037|11796->6067|11856->6090|11932->6143|12143->6317|12156->6320|12220->6361|12366->6470|12379->6473|12463->6534|12619->6653|12632->6656|12715->6716|12856->6820|12869->6823|12954->6885|13098->6992|13111->6995|13193->7054|13464->7293|13643->7435|13700->7469|13760->7492|13815->7524|13859->7532|13918->7568|13978->7591|14031->7621|14091->7644|14175->7705|14371->7864|14512->7981|14706->8138|14846->8254|14987->8358|15129->8476|15267->8577|15285->8585|15414->8690|15531->8770|15681->8896|15979->9157|16004->9159|16045->9163|16070->9165|16112->9170|16137->9172|16179->9177|16204->9179|16302->9248|16332->9249|16459->9348|16488->9349|16549->9378
                    LINES: 26->1|28->5|28->5|30->5|31->6|31->6|31->6|32->7|32->7|35->1|39->9|41->11|41->11|41->11|42->12|42->12|42->12|43->13|43->13|43->13|44->14|44->14|44->14|47->17|47->17|47->17|47->17|47->17|47->17|48->18|48->18|48->18|54->24|54->24|54->24|59->29|59->29|60->30|60->30|61->31|61->31|62->32|62->32|63->33|63->33|64->34|64->34|65->35|65->35|66->36|66->36|67->37|67->37|68->38|68->38|69->39|69->39|70->40|70->40|75->45|75->45|75->45|79->49|79->49|79->49|81->51|81->51|81->51|82->52|82->52|82->52|83->53|86->56|86->56|86->56|88->58|88->58|88->58|89->59|89->59|89->59|90->60|93->63|93->63|93->63|95->65|95->65|95->65|96->66|96->66|96->66|96->66|96->66|96->66|97->67|100->70|100->70|100->70|102->72|102->72|102->72|103->73|103->73|103->73|104->74|108->78|108->78|108->78|110->80|110->80|110->80|111->81|111->81|111->81|112->82|115->85|115->85|115->85|117->87|117->87|117->87|118->88|118->88|118->88|119->89|122->92|122->92|122->92|124->94|124->94|124->94|125->95|125->95|125->95|126->96|129->99|129->99|129->99|131->101|131->101|131->101|132->102|132->102|133->103|136->106|136->106|136->106|138->108|138->108|138->108|139->109|139->109|140->110|143->113|143->113|143->113|145->115|145->115|145->115|146->116|146->116|147->117|150->120|150->120|150->120|152->122|152->122|152->122|153->123|153->123|154->124|158->128|158->128|158->128|163->133|172->142|172->142|172->142|181->151|181->151|182->152|182->152|183->153|183->153|184->154|184->154|185->155|185->155|186->156|186->156|194->164|194->164|194->164|197->167|197->167|197->167|200->170|200->170|200->170|203->173|203->173|203->173|206->176|206->176|206->176|218->188|224->194|224->194|225->195|225->195|226->196|226->196|227->197|227->197|228->198|228->198|236->206|236->206|240->210|240->210|243->213|243->213|246->216|246->216|246->216|249->219|249->219|258->228|258->228|258->228|258->228|258->228|258->228|258->228|258->228|260->230|260->230|265->235|265->235|268->238
                    -- GENERATED --
                */
            