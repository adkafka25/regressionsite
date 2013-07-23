
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
object listPages extends BaseScalaTemplate[play.api.templates.Html,Format[play.api.templates.Html]](play.api.templates.HtmlFormat) with play.api.templates.Template4[com.avaje.ebean.Page[PageOut],String,String,String,play.api.templates.Html] {

    /**/
    def apply/*1.2*/(currentPage: com.avaje.ebean.Page[PageOut], currentSortBy: String, currentOrder: String, currentFilter: String):play.api.templates.Html = {
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
    routes.Application.listPage(newPage, sortBy, order, currentFilter)
    
}};
Seq[Any](format.raw/*1.114*/("""

"""),format.raw/*5.42*/("""
"""),format.raw/*27.2*/("""

"""),format.raw/*31.37*/("""
"""),format.raw/*36.2*/("""

"""),_display_(Seq[Any](/*38.2*/homeSkeleton/*38.14*/ {_display_(Seq[Any](format.raw/*38.16*/("""
     <link rel="stylesheet" type="text/css" href=""""),_display_(Seq[Any](/*39.52*/routes/*39.58*/.Assets.at("stylesheets/bootstrap.min.css"))),format.raw/*39.101*/("""">
    <script type="text/javascript" src=""""),_display_(Seq[Any](/*40.42*/routes/*40.48*/.Application.javascriptRoutes())),format.raw/*40.79*/(""""></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <h1 id="homeTitle">"""),_display_(Seq[Any](/*42.25*/currentPage/*42.36*/.getTotalRowCount)),format.raw/*42.53*/(""" Pages Found</h1>
	
    """),_display_(Seq[Any](/*44.6*/if(flash.containsKey("success"))/*44.38*/ {_display_(Seq[Any](format.raw/*44.40*/("""
        <div class="alert-message warning">
            <strong>Done!</strong> """),_display_(Seq[Any](/*46.37*/flash/*46.42*/.get("success"))),format.raw/*46.57*/("""
        </div>
    """)))})),format.raw/*48.6*/(""" 


	
    <div id="actions">
        
        <form action=""""),_display_(Seq[Any](/*54.24*/link(0, "name"))),format.raw/*54.39*/("""" method="GET">
            <input type="search" id="searchbox" name="f" value=""""),_display_(Seq[Any](/*55.66*/currentFilter)),format.raw/*55.79*/("""" placeholder="Search by Page name...">
            <input type="submit" id="searchsubmit" value="Filter by name" class="btn primary">
        </form>
        
    </div>
    
    """),_display_(Seq[Any](/*61.6*/if(currentPage.getTotalRowCount == 0)/*61.43*/ {_display_(Seq[Any](format.raw/*61.45*/("""
        
        <div class="well">
            <em>Nothing to display</em>
        </div>
        
    """)))}/*67.7*/else/*67.12*/{_display_(Seq[Any](format.raw/*67.13*/("""
        
        <table class="PageOut zebra-striped">
            <thead>
                <tr>
                    """),_display_(Seq[Any](/*72.22*/header("name", "Page Name"))),format.raw/*72.49*/("""
                    """),_display_(Seq[Any](/*73.22*/header("run.name", "Run"))),format.raw/*73.47*/("""
                    """),_display_(Seq[Any](/*74.22*/header("run.format.name", "Format"))),format.raw/*74.57*/("""
                    """),_display_(Seq[Any](/*75.22*/header("performance.time", "Performance Time"))),format.raw/*75.68*/("""
					"""),_display_(Seq[Any](/*76.7*/header("error.num", "Error"))),format.raw/*76.35*/("""
					"""),_display_(Seq[Any](/*77.7*/header("difference.name", "Difference Desc"))),format.raw/*77.51*/("""
                </tr>
            </thead>
            <tbody>

                """),_display_(Seq[Any](/*82.18*/for(page <- currentPage.getList) yield /*82.50*/ {_display_(Seq[Any](format.raw/*82.52*/("""
                    <tr>
                        <td>"""),_display_(Seq[Any](/*84.30*/page/*84.34*/.name)),format.raw/*84.39*/("""</a></td>
						<td>
                            """),_display_(Seq[Any](/*86.30*/if(page.run == null)/*86.50*/ {_display_(Seq[Any](format.raw/*86.52*/("""
                                <em>-</em>
                            """)))}/*88.31*/else/*88.36*/{_display_(Seq[Any](format.raw/*88.37*/("""
                                """),_display_(Seq[Any](/*89.34*/page/*89.38*/.run.name)),format.raw/*89.47*/("""
                            """)))})),format.raw/*90.30*/("""
                        </td>
                        <td>
                            """),_display_(Seq[Any](/*93.30*/if(page.run.format == null)/*93.57*/ {_display_(Seq[Any](format.raw/*93.59*/("""
                                <em>-</em>
                            """)))}/*95.31*/else/*95.36*/{_display_(Seq[Any](format.raw/*95.37*/("""
                                """),_display_(Seq[Any](/*96.34*/page/*96.38*/.run.format.name)),format.raw/*96.54*/("""
                            """)))})),format.raw/*97.30*/("""
                        </td>
						<td>
                            """),_display_(Seq[Any](/*100.30*/if(page.performance == null)/*100.58*/ {_display_(Seq[Any](format.raw/*100.60*/("""
                                <em>-</em>
                            """)))}/*102.31*/else/*102.36*/{_display_(Seq[Any](format.raw/*102.37*/("""
                                """),_display_(Seq[Any](/*103.34*/page/*103.38*/.performance.time.format("hh:mm:ss"))),format.raw/*103.74*/("""
                            """)))})),format.raw/*104.30*/("""
                        </td>
						<td>
                            """),_display_(Seq[Any](/*107.30*/if(page.error == null)/*107.52*/ {_display_(Seq[Any](format.raw/*107.54*/("""
                                <em>-</em>
                            """)))}/*109.31*/else/*109.36*/{_display_(Seq[Any](format.raw/*109.37*/("""
                                """),_display_(Seq[Any](/*110.34*/page/*110.38*/.error.num)),format.raw/*110.48*/(""" -> """),_display_(Seq[Any](/*110.53*/page/*110.57*/.error.description)),format.raw/*110.75*/("""
                            """)))})),format.raw/*111.30*/("""
                        </td>
						<td>
							"""),_display_(Seq[Any](/*114.9*/for(difference <- Difference.listDifferences(page)) yield /*114.60*/ {_display_(Seq[Any](format.raw/*114.62*/("""
								"""),_display_(Seq[Any](/*115.10*/if(difference.difftype.name == "Worse")/*115.49*/ {_display_(Seq[Any](format.raw/*115.51*/("""
									<font color="red">&bull; <i>"""),_display_(Seq[Any](/*116.39*/difference/*116.49*/.name)),format.raw/*116.54*/("""</i></font>  
								""")))}/*117.11*/else/*117.16*/{_display_(Seq[Any](format.raw/*117.17*/("""
									"""),_display_(Seq[Any](/*118.11*/if(difference.difftype.name == "Better")/*118.51*/ {_display_(Seq[Any](format.raw/*118.53*/("""
										<font color="green">&bull; <i>"""),_display_(Seq[Any](/*119.42*/difference/*119.52*/.name)),format.raw/*119.57*/("""</i></font>
									""")))}/*120.12*/else/*120.17*/{_display_(Seq[Any](format.raw/*120.18*/("""
										<font color="black">&bull; <i>"""),_display_(Seq[Any](/*121.42*/difference/*121.52*/.name)),format.raw/*121.57*/("""</i></font>
									""")))})),format.raw/*122.11*/("""
								""")))})),format.raw/*123.10*/("""
								
								</br>
							""")))})),format.raw/*126.9*/("""
                        </td>
						
                    </tr>
                """)))})),format.raw/*130.18*/("""

            </tbody>
        </table>

        <div id="pagination" class="pagination">
            <ul>
                """),_display_(Seq[Any](/*137.18*/if(currentPage.hasPrev)/*137.41*/ {_display_(Seq[Any](format.raw/*137.43*/("""
                    <li class="prev">
                        <a href=""""),_display_(Seq[Any](/*139.35*/link(currentPage.getPageIndex - 1, null))),format.raw/*139.75*/("""">&larr; Previous</a>
                    </li>
                """)))}/*141.19*/else/*141.24*/{_display_(Seq[Any](format.raw/*141.25*/("""
                    <li class="prev disabled">
                        <a>&larr; Previous</a>
                    </li>
                """)))})),format.raw/*145.18*/("""
                <li class="current">
                    <a>Displaying """),_display_(Seq[Any](/*147.36*/currentPage/*147.47*/.getDisplayXtoYofZ(" to "," of "))),format.raw/*147.80*/("""</a>
                </li>
                """),_display_(Seq[Any](/*149.18*/if(currentPage.hasNext)/*149.41*/ {_display_(Seq[Any](format.raw/*149.43*/("""
                    <li class="next">
                        <a href=""""),_display_(Seq[Any](/*151.35*/link(currentPage.getPageIndex + 1, null))),format.raw/*151.75*/("""">Next &rarr;</a>
                    </li>
                """)))}/*153.19*/else/*153.24*/{_display_(Seq[Any](format.raw/*153.25*/("""
                    <li class="next disabled">
                        <a>Next &rarr;</a>
                    </li>
                """)))})),format.raw/*157.18*/("""
            </ul>
        </div>
        
    """)))})),format.raw/*161.6*/("""
  
        
""")))})),format.raw/*164.2*/("""

            """))}
    }
    
    def render(currentPage:com.avaje.ebean.Page[PageOut],currentSortBy:String,currentOrder:String,currentFilter:String): play.api.templates.Html = apply(currentPage,currentSortBy,currentOrder,currentFilter)
    
    def f:((com.avaje.ebean.Page[PageOut],String,String,String) => play.api.templates.Html) = (currentPage,currentSortBy,currentOrder,currentFilter) => apply(currentPage,currentSortBy,currentOrder,currentFilter)
    
    def ref: this.type = this

}
                /*
                    -- GENERATED --
                    DATE: Tue Jul 23 11:40:04 EDT 2013
                    SOURCE: C:/Users/acarey/Desktop/andrewregressionsite/regressionsite/app/views/listPages.scala.html
                    HASH: 761c4440d7d3bb7075250237e557f4e0f01ddd1a
                    MATRIX: 771->1|944->894|958->900|1052->930|1106->948|1118->951|1157->968|1202->977|1236->1003|1324->1067|1382->1089|1416->1101|1455->1104|1482->1109|1522->247|1533->251|2090->113|2121->244|2150->777|2182->891|2211->1127|2251->1132|2272->1144|2312->1146|2401->1199|2416->1205|2482->1248|2563->1293|2578->1299|2631->1330|2798->1461|2818->1472|2857->1489|2919->1516|2960->1548|3000->1550|3119->1633|3133->1638|3170->1653|3224->1676|3327->1743|3364->1758|3482->1840|3517->1853|3739->2040|3785->2077|3825->2079|3955->2192|3968->2197|4007->2198|4166->2321|4215->2348|4274->2371|4321->2396|4380->2419|4437->2454|4496->2477|4564->2523|4607->2531|4657->2559|4700->2567|4766->2611|4889->2698|4937->2730|4977->2732|5070->2789|5083->2793|5110->2798|5198->2850|5227->2870|5267->2872|5361->2948|5374->2953|5413->2954|5484->2989|5497->2993|5528->3002|5591->3033|5719->3125|5755->3152|5795->3154|5889->3230|5902->3235|5941->3236|6012->3271|6025->3275|6063->3291|6126->3322|6237->3396|6275->3424|6316->3426|6411->3502|6425->3507|6465->3508|6537->3543|6551->3547|6610->3583|6674->3614|6785->3688|6817->3710|6858->3712|6953->3788|6967->3793|7007->3794|7079->3829|7093->3833|7126->3843|7168->3848|7182->3852|7223->3870|7287->3901|7376->3954|7444->4005|7485->4007|7533->4018|7582->4057|7623->4059|7700->4099|7720->4109|7748->4114|7792->4139|7806->4144|7846->4145|7895->4157|7945->4197|7986->4199|8066->4242|8086->4252|8114->4257|8157->4281|8171->4286|8211->4287|8291->4330|8311->4340|8339->4345|8395->4368|8439->4379|8506->4414|8624->4499|8792->4630|8825->4653|8866->4655|8978->4730|9041->4770|9128->4838|9142->4843|9182->4844|9357->4986|9469->5061|9490->5072|9546->5105|9629->5151|9662->5174|9703->5176|9815->5251|9878->5291|9961->5355|9975->5360|10015->5361|10186->5499|10270->5551|10319->5568
                    LINES: 26->1|28->32|28->32|30->32|31->33|31->33|31->33|31->33|31->33|31->33|32->34|32->34|32->34|32->34|34->6|34->6|56->1|58->5|59->27|61->31|62->36|64->38|64->38|64->38|65->39|65->39|65->39|66->40|66->40|66->40|68->42|68->42|68->42|70->44|70->44|70->44|72->46|72->46|72->46|74->48|80->54|80->54|81->55|81->55|87->61|87->61|87->61|93->67|93->67|93->67|98->72|98->72|99->73|99->73|100->74|100->74|101->75|101->75|102->76|102->76|103->77|103->77|108->82|108->82|108->82|110->84|110->84|110->84|112->86|112->86|112->86|114->88|114->88|114->88|115->89|115->89|115->89|116->90|119->93|119->93|119->93|121->95|121->95|121->95|122->96|122->96|122->96|123->97|126->100|126->100|126->100|128->102|128->102|128->102|129->103|129->103|129->103|130->104|133->107|133->107|133->107|135->109|135->109|135->109|136->110|136->110|136->110|136->110|136->110|136->110|137->111|140->114|140->114|140->114|141->115|141->115|141->115|142->116|142->116|142->116|143->117|143->117|143->117|144->118|144->118|144->118|145->119|145->119|145->119|146->120|146->120|146->120|147->121|147->121|147->121|148->122|149->123|152->126|156->130|163->137|163->137|163->137|165->139|165->139|167->141|167->141|167->141|171->145|173->147|173->147|173->147|175->149|175->149|175->149|177->151|177->151|179->153|179->153|179->153|183->157|187->161|190->164
                    -- GENERATED --
                */
            