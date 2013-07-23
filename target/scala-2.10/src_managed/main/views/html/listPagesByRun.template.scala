
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
object listPagesByRun extends BaseScalaTemplate[play.api.templates.Html,Format[play.api.templates.Html]](play.api.templates.HtmlFormat) with play.api.templates.Template6[com.avaje.ebean.Page[PageOut],String,String,Long,String,String,play.api.templates.Html] {

    /**/
    def apply/*1.2*/(currentPage: com.avaje.ebean.Page[PageOut], currentSortBy: String, currentOrder: String, runID: Long, currentFilter: String, d:String):play.api.templates.Html = {
        _display_ {
def /*32.2*/header/*32.8*/(key:String, title:String):play.api.templates.Html = {_display_(

Seq[Any](format.raw/*32.38*/("""
    <th class=""""),_display_(Seq[Any](/*33.17*/key/*33.20*/.replace(".","_"))),format.raw/*33.37*/(""" header """),_display_(Seq[Any](/*33.46*/if(currentSortBy == key){/*33.72*/{if(currentOrder == "asc") "headerSortDown" else "headerSortUp"}})),format.raw/*33.136*/("""">
        <a href=""""),_display_(Seq[Any](/*34.19*/link(0, key))),format.raw/*34.31*/("""">"""),_display_(Seq[Any](/*34.34*/title)),format.raw/*34.39*/("""</a>
    </th>
""")))};def /*6.2*/link/*6.6*/(newPage:Int, newSortBy:String) = {{
    
    var sortBy = currentSortBy
    var order = currentOrder
    
    if(newSortBy != null) {
        sortBy = newSortBy
        if(currentSortBy == newSortBy) {
            if(currentOrder == "asc") {
                order = "desc"
            } else {
                order = "asc"
            }
        } else {
            order = "asc"
        }
    }
    
    // Generate the link
    routes.Application.listPageByRun(newPage, sortBy, order, runID, currentFilter, d)
    
}};
Seq[Any](format.raw/*1.137*/("""

"""),format.raw/*5.42*/("""
"""),format.raw/*27.2*/("""

"""),format.raw/*31.37*/("""
"""),format.raw/*36.2*/("""

"""),_display_(Seq[Any](/*38.2*/homeSkeleton/*38.14*/ {_display_(Seq[Any](format.raw/*38.16*/("""
    
    <h1 id="homeTitle">
    """),_display_(Seq[Any](/*41.6*/if(d == "all")/*41.20*/ {_display_(Seq[Any](format.raw/*41.22*/("""
	 Displaying all """),_display_(Seq[Any](/*42.19*/currentPage/*42.30*/.getTotalRowCount)),format.raw/*42.47*/(""" pages From Run """),_display_(Seq[Any](/*42.64*/Run/*42.67*/.nameByID(runID))),format.raw/*42.83*/("""
	""")))})),format.raw/*43.3*/("""
    """),_display_(Seq[Any](/*44.6*/if(d == "error")/*44.22*/ {_display_(Seq[Any](format.raw/*44.24*/("""
	 Displaying all """),_display_(Seq[Any](/*45.19*/currentPage/*45.30*/.getTotalRowCount)),format.raw/*45.47*/(""" pages From Run """),_display_(Seq[Any](/*45.64*/Run/*45.67*/.nameByID(runID))),format.raw/*45.83*/(""" with Errors
	""")))})),format.raw/*46.3*/("""
	"""),_display_(Seq[Any](/*47.3*/if(d == "worse")/*47.19*/ {_display_(Seq[Any](format.raw/*47.21*/("""
	 Displaying all """),_display_(Seq[Any](/*48.19*/currentPage/*48.30*/.getTotalRowCount)),format.raw/*48.47*/(""" pages From Run """),_display_(Seq[Any](/*48.64*/Run/*48.67*/.nameByID(runID))),format.raw/*48.83*/(""" with Worse Differences
	""")))})),format.raw/*49.3*/("""
	"""),_display_(Seq[Any](/*50.3*/if(d == "better")/*50.20*/ {_display_(Seq[Any](format.raw/*50.22*/("""
	 Displaying all """),_display_(Seq[Any](/*51.19*/currentPage/*51.30*/.getTotalRowCount)),format.raw/*51.47*/(""" pages From Run """),_display_(Seq[Any](/*51.64*/Run/*51.67*/.nameByID(runID))),format.raw/*51.83*/(""" with Better Differences
	""")))})),format.raw/*52.3*/("""
	"""),_display_(Seq[Any](/*53.3*/if(d == "neutral")/*53.21*/ {_display_(Seq[Any](format.raw/*53.23*/("""
	 Displaying all """),_display_(Seq[Any](/*54.19*/currentPage/*54.30*/.getTotalRowCount)),format.raw/*54.47*/(""" pages From Run """),_display_(Seq[Any](/*54.64*/Run/*54.67*/.nameByID(runID))),format.raw/*54.83*/(""" with Neutral Differences
	""")))})),format.raw/*55.3*/("""
    </h1>
	
	
	
    """),_display_(Seq[Any](/*60.6*/if(flash.containsKey("success"))/*60.38*/ {_display_(Seq[Any](format.raw/*60.40*/("""
        <div class="alert-message warning">
            <strong>Done!</strong> """),_display_(Seq[Any](/*62.37*/flash/*62.42*/.get("success"))),format.raw/*62.57*/("""
        </div>
    """)))})),format.raw/*64.6*/(""" 


	
    <div id="actions">
        
        <form action=""""),_display_(Seq[Any](/*70.24*/link(0, "name"))),format.raw/*70.39*/("""" method="GET">
            <input type="search" id="searchbox" name="f" value=""""),_display_(Seq[Any](/*71.66*/currentFilter)),format.raw/*71.79*/("""" placeholder="Filter by Page name...">
            <input type="submit" id="searchsubmit" value="Filter by name" class="btn primary">
        </form>
        
    </div>
    
    """),_display_(Seq[Any](/*77.6*/if(currentPage.getTotalRowCount == 0)/*77.43*/ {_display_(Seq[Any](format.raw/*77.45*/("""
        
        <div class="well">
            <em>Nothing to display</em>
        </div>
        
    """)))}/*83.7*/else/*83.12*/{_display_(Seq[Any](format.raw/*83.13*/("""
        
        <table class="PageOut zebra-striped">
            <thead>
                <tr>
                    """),_display_(Seq[Any](/*88.22*/header("name", "Page Name"))),format.raw/*88.49*/("""
                    """),_display_(Seq[Any](/*89.22*/header("run.name", "Run"))),format.raw/*89.47*/("""
                    """),_display_(Seq[Any](/*90.22*/header("run.format.name", "Format"))),format.raw/*90.57*/("""
                    """),_display_(Seq[Any](/*91.22*/header("performance.time", "Performance Time"))),format.raw/*91.68*/("""
					"""),_display_(Seq[Any](/*92.7*/header("error.num", "Error"))),format.raw/*92.35*/("""
					"""),_display_(Seq[Any](/*93.7*/header("difference.name", "Difference Desc"))),format.raw/*93.51*/("""
                </tr>
            </thead>
            <tbody>

                """),_display_(Seq[Any](/*98.18*/for(page <- currentPage.getList) yield /*98.50*/ {_display_(Seq[Any](format.raw/*98.52*/("""
                    <tr>
                        <td>"""),_display_(Seq[Any](/*100.30*/page/*100.34*/.name)),format.raw/*100.39*/("""</a></td>
						<td>
                            """),_display_(Seq[Any](/*102.30*/if(page.run == null)/*102.50*/ {_display_(Seq[Any](format.raw/*102.52*/("""
                                <em>-</em>
                            """)))}/*104.31*/else/*104.36*/{_display_(Seq[Any](format.raw/*104.37*/("""
                                """),_display_(Seq[Any](/*105.34*/page/*105.38*/.run.name)),format.raw/*105.47*/("""
                            """)))})),format.raw/*106.30*/("""
                        </td>
                        <td>
                            """),_display_(Seq[Any](/*109.30*/if(page.run.format == null)/*109.57*/ {_display_(Seq[Any](format.raw/*109.59*/("""
                                <em>-</em>
                            """)))}/*111.31*/else/*111.36*/{_display_(Seq[Any](format.raw/*111.37*/("""
                                """),_display_(Seq[Any](/*112.34*/page/*112.38*/.run.format.name)),format.raw/*112.54*/("""
                            """)))})),format.raw/*113.30*/("""
                        </td>
						<td>
                            """),_display_(Seq[Any](/*116.30*/if(page.performance == null)/*116.58*/ {_display_(Seq[Any](format.raw/*116.60*/("""
                                <em>-</em>
                            """)))}/*118.31*/else/*118.36*/{_display_(Seq[Any](format.raw/*118.37*/("""
                                """),_display_(Seq[Any](/*119.34*/page/*119.38*/.performance.time.format("hh:mm:ss"))),format.raw/*119.74*/("""
                            """)))})),format.raw/*120.30*/("""
                        </td>
						<td>
                            """),_display_(Seq[Any](/*123.30*/if(page.error == null)/*123.52*/ {_display_(Seq[Any](format.raw/*123.54*/("""
                                <em>-</em>
                            """)))}/*125.31*/else/*125.36*/{_display_(Seq[Any](format.raw/*125.37*/("""
                                """),_display_(Seq[Any](/*126.34*/page/*126.38*/.error.num)),format.raw/*126.48*/(""" -> """),_display_(Seq[Any](/*126.53*/page/*126.57*/.error.description)),format.raw/*126.75*/("""
                            """)))})),format.raw/*127.30*/("""
                        </td>
						<td>
							"""),_display_(Seq[Any](/*130.9*/for(difference <- Difference.listDifferences(page)) yield /*130.60*/ {_display_(Seq[Any](format.raw/*130.62*/("""
								"""),_display_(Seq[Any](/*131.10*/if(difference.difftype.name == "Worse")/*131.49*/ {_display_(Seq[Any](format.raw/*131.51*/("""
									<font color="red">&bull; <i>"""),_display_(Seq[Any](/*132.39*/difference/*132.49*/.name)),format.raw/*132.54*/("""</i></font>  
								""")))}/*133.11*/else/*133.16*/{_display_(Seq[Any](format.raw/*133.17*/("""
									"""),_display_(Seq[Any](/*134.11*/if(difference.difftype.name == "Better")/*134.51*/ {_display_(Seq[Any](format.raw/*134.53*/("""
										<font color="green">&bull; <i>"""),_display_(Seq[Any](/*135.42*/difference/*135.52*/.name)),format.raw/*135.57*/("""</i></font>
									""")))}/*136.12*/else/*136.17*/{_display_(Seq[Any](format.raw/*136.18*/("""
										<font color="black">&bull; <i>"""),_display_(Seq[Any](/*137.42*/difference/*137.52*/.name)),format.raw/*137.57*/("""</i></font>
									""")))})),format.raw/*138.11*/("""
								""")))})),format.raw/*139.10*/("""
								
								</br>
							""")))})),format.raw/*142.9*/("""
                        </td>
						
                    </tr>
                """)))})),format.raw/*146.18*/("""

            </tbody>
        </table>

        <div id="pagination" class="pagination">
            <ul>
                """),_display_(Seq[Any](/*153.18*/if(currentPage.hasPrev)/*153.41*/ {_display_(Seq[Any](format.raw/*153.43*/("""
                    <li class="prev">
                        <a href=""""),_display_(Seq[Any](/*155.35*/link(currentPage.getPageIndex - 1, null))),format.raw/*155.75*/("""">&larr; Previous</a>
                    </li>
                """)))}/*157.19*/else/*157.24*/{_display_(Seq[Any](format.raw/*157.25*/("""
                    <li class="prev disabled">
                        <a>&larr; Previous</a>
                    </li>
                """)))})),format.raw/*161.18*/("""
                <li class="current">
                    <a>Displaying """),_display_(Seq[Any](/*163.36*/currentPage/*163.47*/.getDisplayXtoYofZ(" to "," of "))),format.raw/*163.80*/("""</a>
                </li>
                """),_display_(Seq[Any](/*165.18*/if(currentPage.hasNext)/*165.41*/ {_display_(Seq[Any](format.raw/*165.43*/("""
                    <li class="next">
                        <a href=""""),_display_(Seq[Any](/*167.35*/link(currentPage.getPageIndex + 1, null))),format.raw/*167.75*/("""">Next &rarr;</a>
                    </li>
                """)))}/*169.19*/else/*169.24*/{_display_(Seq[Any](format.raw/*169.25*/("""
                    <li class="next disabled">
                        <a>Next &rarr;</a>
                    </li>
                """)))})),format.raw/*173.18*/("""
            </ul>
        </div>
        
    """)))})),format.raw/*177.6*/("""
      <input type="submit" id="searchsubmit" value="Go Back to Run" class="btn primary" onclick = "goToRun('"""),_display_(Seq[Any](/*178.110*/runID)),format.raw/*178.115*/("""')">
    <script>
    function goToRun(id) """),format.raw/*180.26*/("""{"""),format.raw/*180.27*/("""
    	window.location = jsRoutes.controllers.Application.getData(id).url;
    """),format.raw/*182.5*/("""}"""),format.raw/*182.6*/("""
    </script>
    
        
""")))})),format.raw/*186.2*/("""

            """))}
    }
    
    def render(currentPage:com.avaje.ebean.Page[PageOut],currentSortBy:String,currentOrder:String,runID:Long,currentFilter:String,d:String): play.api.templates.Html = apply(currentPage,currentSortBy,currentOrder,runID,currentFilter,d)
    
    def f:((com.avaje.ebean.Page[PageOut],String,String,Long,String,String) => play.api.templates.Html) = (currentPage,currentSortBy,currentOrder,runID,currentFilter,d) => apply(currentPage,currentSortBy,currentOrder,runID,currentFilter,d)
    
    def ref: this.type = this

}
                /*
                    -- GENERATED --
                    DATE: Tue Jul 23 11:40:04 EDT 2013
                    SOURCE: C:/Users/acarey/Desktop/andrewregressionsite/regressionsite/app/views/listPagesByRun.scala.html
                    HASH: c89d4080ed2fbc6c33e0fa337986a0e56a5dd735
                    MATRIX: 788->1|984->932|998->938|1092->968|1146->986|1158->989|1197->1006|1242->1015|1276->1041|1364->1105|1422->1127|1456->1139|1495->1142|1522->1147|1562->270|1573->274|2145->136|2176->267|2205->815|2237->929|2266->1165|2306->1170|2327->1182|2367->1184|2440->1222|2463->1236|2503->1238|2559->1258|2579->1269|2618->1286|2671->1303|2683->1306|2721->1322|2756->1326|2798->1333|2823->1349|2863->1351|2919->1371|2939->1382|2978->1399|3031->1416|3043->1419|3081->1435|3128->1451|3167->1455|3192->1471|3232->1473|3288->1493|3308->1504|3347->1521|3400->1538|3412->1541|3450->1557|3508->1584|3547->1588|3573->1605|3613->1607|3669->1627|3689->1638|3728->1655|3781->1672|3793->1675|3831->1691|3890->1719|3929->1723|3956->1741|3996->1743|4052->1763|4072->1774|4111->1791|4164->1808|4176->1811|4214->1827|4274->1856|4336->1883|4377->1915|4417->1917|4536->2000|4550->2005|4587->2020|4641->2043|4744->2110|4781->2125|4899->2207|4934->2220|5156->2407|5202->2444|5242->2446|5372->2559|5385->2564|5424->2565|5583->2688|5632->2715|5691->2738|5738->2763|5797->2786|5854->2821|5913->2844|5981->2890|6024->2898|6074->2926|6117->2934|6183->2978|6306->3065|6354->3097|6394->3099|6488->3156|6502->3160|6530->3165|6619->3217|6649->3237|6690->3239|6785->3315|6799->3320|6839->3321|6911->3356|6925->3360|6957->3369|7021->3400|7150->3492|7187->3519|7228->3521|7323->3597|7337->3602|7377->3603|7449->3638|7463->3642|7502->3658|7566->3689|7677->3763|7715->3791|7756->3793|7851->3869|7865->3874|7905->3875|7977->3910|7991->3914|8050->3950|8114->3981|8225->4055|8257->4077|8298->4079|8393->4155|8407->4160|8447->4161|8519->4196|8533->4200|8566->4210|8608->4215|8622->4219|8663->4237|8727->4268|8816->4321|8884->4372|8925->4374|8973->4385|9022->4424|9063->4426|9140->4466|9160->4476|9188->4481|9232->4506|9246->4511|9286->4512|9335->4524|9385->4564|9426->4566|9506->4609|9526->4619|9554->4624|9597->4648|9611->4653|9651->4654|9731->4697|9751->4707|9779->4712|9835->4735|9879->4746|9946->4781|10064->4866|10232->4997|10265->5020|10306->5022|10418->5097|10481->5137|10568->5205|10582->5210|10622->5211|10797->5353|10909->5428|10930->5439|10986->5472|11069->5518|11102->5541|11143->5543|11255->5618|11318->5658|11401->5722|11415->5727|11455->5728|11626->5866|11710->5918|11859->6029|11888->6034|11962->6079|11992->6080|12100->6160|12129->6161|12195->6195
                    LINES: 26->1|28->32|28->32|30->32|31->33|31->33|31->33|31->33|31->33|31->33|32->34|32->34|32->34|32->34|34->6|34->6|56->1|58->5|59->27|61->31|62->36|64->38|64->38|64->38|67->41|67->41|67->41|68->42|68->42|68->42|68->42|68->42|68->42|69->43|70->44|70->44|70->44|71->45|71->45|71->45|71->45|71->45|71->45|72->46|73->47|73->47|73->47|74->48|74->48|74->48|74->48|74->48|74->48|75->49|76->50|76->50|76->50|77->51|77->51|77->51|77->51|77->51|77->51|78->52|79->53|79->53|79->53|80->54|80->54|80->54|80->54|80->54|80->54|81->55|86->60|86->60|86->60|88->62|88->62|88->62|90->64|96->70|96->70|97->71|97->71|103->77|103->77|103->77|109->83|109->83|109->83|114->88|114->88|115->89|115->89|116->90|116->90|117->91|117->91|118->92|118->92|119->93|119->93|124->98|124->98|124->98|126->100|126->100|126->100|128->102|128->102|128->102|130->104|130->104|130->104|131->105|131->105|131->105|132->106|135->109|135->109|135->109|137->111|137->111|137->111|138->112|138->112|138->112|139->113|142->116|142->116|142->116|144->118|144->118|144->118|145->119|145->119|145->119|146->120|149->123|149->123|149->123|151->125|151->125|151->125|152->126|152->126|152->126|152->126|152->126|152->126|153->127|156->130|156->130|156->130|157->131|157->131|157->131|158->132|158->132|158->132|159->133|159->133|159->133|160->134|160->134|160->134|161->135|161->135|161->135|162->136|162->136|162->136|163->137|163->137|163->137|164->138|165->139|168->142|172->146|179->153|179->153|179->153|181->155|181->155|183->157|183->157|183->157|187->161|189->163|189->163|189->163|191->165|191->165|191->165|193->167|193->167|195->169|195->169|195->169|199->173|203->177|204->178|204->178|206->180|206->180|208->182|208->182|212->186
                    -- GENERATED --
                */
            