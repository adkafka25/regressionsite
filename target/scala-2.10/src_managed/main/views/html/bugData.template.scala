
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
object bugData extends BaseScalaTemplate[play.api.templates.Html,Format[play.api.templates.Html]](play.api.templates.HtmlFormat) with play.api.templates.Template2[Long,Form[Bug],play.api.templates.Html] {

    /**/
    def apply/*1.2*/(id: Long, dataForm: Form[Bug]):play.api.templates.Html = {
        _display_ {
def /*3.2*/header/*3.8*/(key:String, title:String):play.api.templates.Html = {_display_(

Seq[Any](format.raw/*3.38*/("""
    <th class=""""),_display_(Seq[Any](/*4.17*/key/*4.20*/.replace(".","_"))),format.raw/*4.37*/(""" header "headerSortUp"">
        <a href= >"""),_display_(Seq[Any](/*5.20*/title)),format.raw/*5.25*/("""</a>
    </th>
""")))};def /*9.2*/linkByRun/*9.11*/(runID:Long) = {{
routes.Application.getData(runID);

}};
Seq[Any](format.raw/*1.33*/("""

"""),format.raw/*7.2*/("""

"""),format.raw/*12.2*/("""

"""),_display_(Seq[Any](/*14.2*/homeSkeleton/*14.14*/ {_display_(Seq[Any](format.raw/*14.16*/("""
    <link rel="stylesheet" type="text/css" media="screen" href=""""),_display_(Seq[Any](/*15.66*/routes/*15.72*/.Assets.at("stylesheets/buttons.less"))),format.raw/*15.110*/(""""> 
   
    <script src=""""),_display_(Seq[Any](/*17.19*/routes/*17.25*/.Assets.at("js/bootstrap.min.js"))),format.raw/*17.58*/(""""></script>
    <script src=""""),_display_(Seq[Any](/*18.19*/routes/*18.25*/.Assets.at("js/bootstrap-button"))),format.raw/*18.58*/(""""></script>		
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
        
        <center><h1>Info pertaining to Bug ID: """),_display_(Seq[Any](/*21.49*/id)),format.raw/*21.51*/("""</h1> </center>
        
        <table class="Bug zebra-striped">
            <thead>
                <tr>
                    """),_display_(Seq[Any](/*26.22*/header("number", "Bug Number"))),format.raw/*26.52*/("""
					"""),_display_(Seq[Any](/*27.7*/header("bugstatus.name", "Bug Status"))),format.raw/*27.45*/("""
					"""),_display_(Seq[Any](/*28.7*/header("difference.name", "Difference Desc"))),format.raw/*28.51*/(""" 
					"""),_display_(Seq[Any](/*29.7*/header("pagesoutbug.run.format.name", "Format"))),format.raw/*29.54*/("""
					"""),_display_(Seq[Any](/*30.7*/header("pagesoutbug.run.version.name", "Version"))),format.raw/*30.56*/("""
					"""),_display_(Seq[Any](/*31.7*/header("pagesoutbug.run.date.name", "Date Appeared"))),format.raw/*31.59*/("""					
                </tr>
            </thead>
            <tbody>

                
                    <tr>
                        <td>"""),_display_(Seq[Any](/*38.30*/Bug/*38.33*/.getBugFromID(id).number)),format.raw/*38.57*/("""
                        
                        </a> 
							
						</td>
						<td>
                            """),_display_(Seq[Any](/*44.30*/if(Bug.getBugFromID(id).bugstatus == null)/*44.72*/ {_display_(Seq[Any](format.raw/*44.74*/("""
                                <em>-</em>
                            """)))}/*46.31*/else/*46.36*/{_display_(Seq[Any](format.raw/*46.37*/("""
                                """),_display_(Seq[Any](/*47.34*/Bug/*47.37*/.getBugFromID(id).bugstatus.name)),format.raw/*47.69*/("""
                            """)))})),format.raw/*48.30*/("""
                        </td>
						<td>
							"""),_display_(Seq[Any](/*51.9*/for(difference <- Bug.getDifferences(Bug.getBugFromID(id))) yield /*51.68*/ {_display_(Seq[Any](format.raw/*51.70*/("""
								"""),_display_(Seq[Any](/*52.10*/if(difference.difftype.name == "Worse")/*52.49*/ {_display_(Seq[Any](format.raw/*52.51*/("""
									<font color="red">&bull; <i>"""),_display_(Seq[Any](/*53.39*/difference/*53.49*/.name)),format.raw/*53.54*/("""</i></font>  
								""")))}/*54.11*/else/*54.16*/{_display_(Seq[Any](format.raw/*54.17*/("""
									"""),_display_(Seq[Any](/*55.11*/if(difference.difftype.name == "Better")/*55.51*/ {_display_(Seq[Any](format.raw/*55.53*/("""
										<font color="green">&bull; <i>"""),_display_(Seq[Any](/*56.42*/difference/*56.52*/.name)),format.raw/*56.57*/("""</i></font>
									""")))}/*57.12*/else/*57.17*/{_display_(Seq[Any](format.raw/*57.18*/("""
										<font color="black">&bull; <i>"""),_display_(Seq[Any](/*58.42*/difference/*58.52*/.name)),format.raw/*58.57*/("""</i></font>
									""")))})),format.raw/*59.11*/("""
								""")))})),format.raw/*60.10*/("""
								
								</br>
							""")))})),format.raw/*63.9*/("""
                        </td>
						<td>
							"""),_display_(Seq[Any](/*66.9*/if(Bug.getFileFormat(Bug.getBugFromID(id)) == null)/*66.60*/ {_display_(Seq[Any](format.raw/*66.62*/("""
								<em>-</em>
							""")))}/*68.10*/else/*68.15*/{_display_(Seq[Any](format.raw/*68.16*/("""
								"""),_display_(Seq[Any](/*69.10*/Bug/*69.13*/.getFileFormat(Bug.getBugFromID(id)).name)),format.raw/*69.54*/("""
							""")))})),format.raw/*70.9*/("""
                        </td>
						<td>
							"""),_display_(Seq[Any](/*73.9*/if(Bug.getVersion(Bug.getBugFromID(id)) == null)/*73.57*/ {_display_(Seq[Any](format.raw/*73.59*/("""
								<em>-</em>
							""")))}/*75.10*/else/*75.15*/{_display_(Seq[Any](format.raw/*75.16*/("""
								"""),_display_(Seq[Any](/*76.10*/Bug/*76.13*/.getVersion(Bug.getBugFromID(id)).name)),format.raw/*76.51*/("""
							""")))})),format.raw/*77.9*/("""
                        </td>
						<td>
							"""),_display_(Seq[Any](/*80.9*/if(Bug.getDate(Bug.getBugFromID(id)) == null)/*80.54*/ {_display_(Seq[Any](format.raw/*80.56*/("""
								<em>-</em>
							""")))}/*82.10*/else/*82.15*/{_display_(Seq[Any](format.raw/*82.16*/("""
								"""),_display_(Seq[Any](/*83.10*/Bug/*83.13*/.getDate(Bug.getBugFromID(id)).name.format("dd MMM yyyy"))),format.raw/*83.70*/("""
							""")))})),format.raw/*84.9*/("""
                        </td>
                    </tr>
					
                

            </tbody>
        </table>
        
        <center><h1>Runs containing Bug ID: """),_display_(Seq[Any](/*93.46*/id)),format.raw/*93.48*/("""</h1> </center>
        
        <table class="run zebra-striped">
            <thead>
                <tr>
                    """),_display_(Seq[Any](/*98.22*/header("name", "Run Name"))),format.raw/*98.48*/("""
                    """),_display_(Seq[Any](/*99.22*/header("version.name", "Version"))),format.raw/*99.55*/("""
                    """),_display_(Seq[Any](/*100.22*/header("format.name", "Format"))),format.raw/*100.53*/("""
					"""),_display_(Seq[Any](/*101.7*/header("date.name", "Date"))),format.raw/*101.34*/("""
                    """),_display_(Seq[Any](/*102.22*/header("svn.num", "SVN"))),format.raw/*102.46*/("""
                    """),_display_(Seq[Any](/*103.22*/header("performance.time", "Performance Time"))),format.raw/*103.68*/("""
                </tr>
            </thead>
            <tbody>

                """),_display_(Seq[Any](/*108.18*/for(run <- Run.listRunsFromBug(Bug.getBugFromID(id))) yield /*108.71*/ {_display_(Seq[Any](format.raw/*108.73*/("""
                    <tr>
                         <td>
                         <a href=""""),_display_(Seq[Any](/*111.36*/linkByRun(run.id))),format.raw/*111.53*/("""" title="View all Run Information from """),_display_(Seq[Any](/*111.93*/run/*111.96*/.name)),format.raw/*111.101*/("""">"""),_display_(Seq[Any](/*111.104*/run/*111.107*/.name)),format.raw/*111.112*/("""</a> 	
						</td>
						<td>
                            """),_display_(Seq[Any](/*114.30*/if(run.version == null)/*114.53*/ {_display_(Seq[Any](format.raw/*114.55*/("""
                                <em>-</em>
                            """)))}/*116.31*/else/*116.36*/{_display_(Seq[Any](format.raw/*116.37*/("""
                                """),_display_(Seq[Any](/*117.34*/run/*117.37*/.version.name)),format.raw/*117.50*/(""" of """),_display_(Seq[Any](/*117.55*/run/*117.58*/.version.platform.name)),format.raw/*117.80*/("""
                            """)))})),format.raw/*118.30*/("""
                        </td>
                        <td>
                            """),_display_(Seq[Any](/*121.30*/if(run.format == null)/*121.52*/ {_display_(Seq[Any](format.raw/*121.54*/("""
                                <em>-</em>
                            """)))}/*123.31*/else/*123.36*/{_display_(Seq[Any](format.raw/*123.37*/("""
                                """),_display_(Seq[Any](/*124.34*/run/*124.37*/.format.name)),format.raw/*124.49*/("""
                            """)))})),format.raw/*125.30*/("""
                        </td>
						<td>
                            """),_display_(Seq[Any](/*128.30*/if(run.date == null)/*128.50*/ {_display_(Seq[Any](format.raw/*128.52*/("""
                                <em>-</em>
                            """)))}/*130.31*/else/*130.36*/{_display_(Seq[Any](format.raw/*130.37*/("""
                                """),_display_(Seq[Any](/*131.34*/run/*131.37*/.date.name.format("dd MMM yyyy"))),format.raw/*131.69*/("""
                            """)))})),format.raw/*132.30*/("""
                        </td>
						<td>
                            """),_display_(Seq[Any](/*135.30*/if(run.svn == null)/*135.49*/ {_display_(Seq[Any](format.raw/*135.51*/("""
                                <em>-</em>
                            """)))}/*137.31*/else/*137.36*/{_display_(Seq[Any](format.raw/*137.37*/("""
                                """),_display_(Seq[Any](/*138.34*/run/*138.37*/.svn.num)),format.raw/*138.45*/("""
                            """)))})),format.raw/*139.30*/("""
                        </td>
						<td>
                            """),_display_(Seq[Any](/*142.30*/if(run.performance == null)/*142.57*/ {_display_(Seq[Any](format.raw/*142.59*/("""
                                <em>-</em>
                            """)))}/*144.31*/else/*144.36*/{_display_(Seq[Any](format.raw/*144.37*/("""
                                """),_display_(Seq[Any](/*145.34*/run/*145.37*/.performance.time.format("hh:mm:ss"))),format.raw/*145.73*/("""
                            """)))})),format.raw/*146.30*/("""
                        </td>
                    </tr>
                
			""")))})),format.raw/*150.5*/("""
            </tbody>
        </table>
        
        

    
""")))})),format.raw/*157.2*/("""

            """))}
    }
    
    def render(id:Long,dataForm:Form[Bug]): play.api.templates.Html = apply(id,dataForm)
    
    def f:((Long,Form[Bug]) => play.api.templates.Html) = (id,dataForm) => apply(id,dataForm)
    
    def ref: this.type = this

}
                /*
                    -- GENERATED --
                    DATE: Tue Jul 23 11:40:02 EDT 2013
                    SOURCE: C:/Users/acarey/Desktop/andrewregressionsite/regressionsite/app/views/bugData.scala.html
                    HASH: 21b0e6fe0a12055171e21052953a4ac1d8c43085
                    MATRIX: 733->1|824->37|837->43|930->73|983->91|994->94|1032->111|1112->156|1138->161|1178->184|1195->193|1283->32|1313->179|1344->251|1384->256|1405->268|1445->270|1548->337|1563->343|1624->381|1688->409|1703->415|1758->448|1825->479|1840->485|1895->518|2098->685|2122->687|2292->821|2344->851|2387->859|2447->897|2490->905|2556->949|2600->958|2669->1005|2712->1013|2783->1062|2826->1070|2900->1122|3084->1270|3096->1273|3142->1297|3300->1419|3351->1461|3391->1463|3485->1539|3498->1544|3537->1545|3608->1580|3620->1583|3674->1615|3737->1646|3825->1699|3900->1758|3940->1760|3987->1771|4035->1810|4075->1812|4151->1852|4170->1862|4197->1867|4240->1892|4253->1897|4292->1898|4340->1910|4389->1950|4429->1952|4508->1995|4527->2005|4554->2010|4596->2034|4609->2039|4648->2040|4727->2083|4746->2093|4773->2098|4828->2121|4871->2132|4937->2167|5025->2220|5085->2271|5125->2273|5174->2304|5187->2309|5226->2310|5273->2321|5285->2324|5348->2365|5389->2375|5477->2428|5534->2476|5574->2478|5623->2509|5636->2514|5675->2515|5722->2526|5734->2529|5794->2567|5835->2577|5923->2630|5977->2675|6017->2677|6066->2708|6079->2713|6118->2714|6165->2725|6177->2728|6256->2785|6297->2795|6515->2977|6539->2979|6709->3113|6757->3139|6816->3162|6871->3195|6931->3218|6985->3249|7029->3257|7079->3284|7139->3307|7186->3331|7246->3354|7315->3400|7439->3487|7509->3540|7550->3542|7681->3636|7721->3653|7798->3693|7811->3696|7840->3701|7881->3704|7895->3707|7924->3712|8023->3774|8056->3797|8097->3799|8192->3875|8206->3880|8246->3881|8318->3916|8331->3919|8367->3932|8409->3937|8422->3940|8467->3962|8531->3993|8660->4085|8692->4107|8733->4109|8828->4185|8842->4190|8882->4191|8954->4226|8967->4229|9002->4241|9066->4272|9177->4346|9207->4366|9248->4368|9343->4444|9357->4449|9397->4450|9469->4485|9482->4488|9537->4520|9601->4551|9712->4625|9741->4644|9782->4646|9877->4722|9891->4727|9931->4728|10003->4763|10016->4766|10047->4774|10111->4805|10222->4879|10259->4906|10300->4908|10395->4984|10409->4989|10449->4990|10521->5025|10534->5028|10593->5064|10657->5095|10771->5177|10874->5248
                    LINES: 26->1|28->3|28->3|30->3|31->4|31->4|31->4|32->5|32->5|34->9|34->9|38->1|40->7|42->12|44->14|44->14|44->14|45->15|45->15|45->15|47->17|47->17|47->17|48->18|48->18|48->18|51->21|51->21|56->26|56->26|57->27|57->27|58->28|58->28|59->29|59->29|60->30|60->30|61->31|61->31|68->38|68->38|68->38|74->44|74->44|74->44|76->46|76->46|76->46|77->47|77->47|77->47|78->48|81->51|81->51|81->51|82->52|82->52|82->52|83->53|83->53|83->53|84->54|84->54|84->54|85->55|85->55|85->55|86->56|86->56|86->56|87->57|87->57|87->57|88->58|88->58|88->58|89->59|90->60|93->63|96->66|96->66|96->66|98->68|98->68|98->68|99->69|99->69|99->69|100->70|103->73|103->73|103->73|105->75|105->75|105->75|106->76|106->76|106->76|107->77|110->80|110->80|110->80|112->82|112->82|112->82|113->83|113->83|113->83|114->84|123->93|123->93|128->98|128->98|129->99|129->99|130->100|130->100|131->101|131->101|132->102|132->102|133->103|133->103|138->108|138->108|138->108|141->111|141->111|141->111|141->111|141->111|141->111|141->111|141->111|144->114|144->114|144->114|146->116|146->116|146->116|147->117|147->117|147->117|147->117|147->117|147->117|148->118|151->121|151->121|151->121|153->123|153->123|153->123|154->124|154->124|154->124|155->125|158->128|158->128|158->128|160->130|160->130|160->130|161->131|161->131|161->131|162->132|165->135|165->135|165->135|167->137|167->137|167->137|168->138|168->138|168->138|169->139|172->142|172->142|172->142|174->144|174->144|174->144|175->145|175->145|175->145|176->146|180->150|187->157
                    -- GENERATED --
                */
            