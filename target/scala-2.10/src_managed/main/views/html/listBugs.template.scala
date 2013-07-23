
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
object listBugs extends BaseScalaTemplate[play.api.templates.Html,Format[play.api.templates.Html]](play.api.templates.HtmlFormat) with play.api.templates.Template4[com.avaje.ebean.Page[Bug],String,String,String,play.api.templates.Html] {

    /**/
    def apply/*1.2*/(currentPage: com.avaje.ebean.Page[Bug], currentSortBy: String, currentOrder: String, currentFilter: String):play.api.templates.Html = {
        _display_ {
def /*37.2*/header/*37.8*/(key:String, title:String):play.api.templates.Html = {_display_(

Seq[Any](format.raw/*37.38*/("""
    <th class=""""),_display_(Seq[Any](/*38.17*/key/*38.20*/.replace(".","_"))),format.raw/*38.37*/(""" header """),_display_(Seq[Any](/*38.46*/if(currentSortBy == key){/*38.72*/{if(currentOrder == "asc") "headerSortDown" else "headerSortUp"}})),format.raw/*38.136*/("""">
        <a href=""""),_display_(Seq[Any](/*39.19*/link(0, key))),format.raw/*39.31*/("""">"""),_display_(Seq[Any](/*39.34*/title)),format.raw/*39.39*/("""</a>
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
    routes.Application.listBug(newPage, sortBy, order, currentFilter)
    
}};def /*28.2*/linkByBug/*28.11*/(bugID:Long) = {{
routes.Application.bugData(bugID);

}};
Seq[Any](format.raw/*1.110*/("""

"""),format.raw/*5.42*/("""
"""),format.raw/*27.2*/("""
"""),format.raw/*31.2*/("""


"""),format.raw/*36.37*/("""
"""),format.raw/*41.2*/("""

"""),_display_(Seq[Any](/*43.2*/homeSkeleton/*43.14*/ {_display_(Seq[Any](format.raw/*43.16*/("""
    <link rel="stylesheet" type="text/css" href=""""),_display_(Seq[Any](/*44.51*/routes/*44.57*/.Assets.at("stylesheets/bootstrap.min.css"))),format.raw/*44.100*/("""">
    <script type="text/javascript" src=""""),_display_(Seq[Any](/*45.42*/routes/*45.48*/.Application.javascriptRoutes())),format.raw/*45.79*/(""""></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <h1 id="homeTitle">"""),_display_(Seq[Any](/*47.25*/currentPage/*47.36*/.getTotalRowCount)),format.raw/*47.53*/(""" Bugs Found</h1>
    

    """),_display_(Seq[Any](/*50.6*/if(flash.containsKey("success"))/*50.38*/ {_display_(Seq[Any](format.raw/*50.40*/("""
        <div class="alert-message warning">
            <strong>Done!</strong> """),_display_(Seq[Any](/*52.37*/flash/*52.42*/.get("success"))),format.raw/*52.57*/("""
        </div>
    """)))})),format.raw/*54.6*/(""" 


	
    <div id="actions">
        
        <form action=""""),_display_(Seq[Any](/*60.24*/link(0, "name"))),format.raw/*60.39*/("""" method="GET">
            <input type="search" id="searchbox" name="f" value=""""),_display_(Seq[Any](/*61.66*/currentFilter)),format.raw/*61.79*/("""" placeholder="Search by Bug name...">
            <input type="submit" id="searchsubmit" value="Filter by number" class="btn primary">
        </form>
        
    </div>
    
    """),_display_(Seq[Any](/*67.6*/if(currentPage.getTotalRowCount == 0)/*67.43*/ {_display_(Seq[Any](format.raw/*67.45*/("""
        
        <div class="well">
            <em>Nothing to display</em>
        </div>
        
    """)))}/*73.7*/else/*73.12*/{_display_(Seq[Any](format.raw/*73.13*/("""
        
        <table class="Bug zebra-striped">
            <thead>
                <tr>
                    """),_display_(Seq[Any](/*78.22*/header("number", "Bug Number"))),format.raw/*78.52*/("""
					"""),_display_(Seq[Any](/*79.7*/header("bugstatus.name", "Bug Status"))),format.raw/*79.45*/("""
					"""),_display_(Seq[Any](/*80.7*/header("difference.name", "Difference Desc"))),format.raw/*80.51*/(""" 
					"""),_display_(Seq[Any](/*81.7*/header("pagesoutbug.run.format.name", "Format"))),format.raw/*81.54*/("""
					"""),_display_(Seq[Any](/*82.7*/header("pagesoutbug.run.version.name", "Version"))),format.raw/*82.56*/("""
					"""),_display_(Seq[Any](/*83.7*/header("pagesoutbug.run.date.name", "Date Appeared"))),format.raw/*83.59*/("""					
                </tr>
            </thead>
            <tbody>

                """),_display_(Seq[Any](/*88.18*/for(bug <- currentPage.getList) yield /*88.49*/ {_display_(Seq[Any](format.raw/*88.51*/("""
                    <tr>
                        <td><a href=""""),_display_(Seq[Any](/*90.39*/linkByBug(bug.id))),format.raw/*90.56*/("""" title="View all Bug Information from """),_display_(Seq[Any](/*90.96*/bug/*90.99*/.id)),format.raw/*90.102*/("""">"""),_display_(Seq[Any](/*90.105*/bug/*90.108*/.number)),format.raw/*90.115*/("""</a> 
							
						</td>
						<td>
                            """),_display_(Seq[Any](/*94.30*/if(bug.bugstatus == null)/*94.55*/ {_display_(Seq[Any](format.raw/*94.57*/("""
                                <em>-</em>
                            """)))}/*96.31*/else/*96.36*/{_display_(Seq[Any](format.raw/*96.37*/("""
                                """),_display_(Seq[Any](/*97.34*/bug/*97.37*/.bugstatus.name)),format.raw/*97.52*/("""
                            """)))})),format.raw/*98.30*/("""
                        </td>
						<td>
							"""),_display_(Seq[Any](/*101.9*/for(difference <- Bug.getDifferences(bug)) yield /*101.51*/ {_display_(Seq[Any](format.raw/*101.53*/("""
								"""),_display_(Seq[Any](/*102.10*/if(difference.difftype.name == "Worse")/*102.49*/ {_display_(Seq[Any](format.raw/*102.51*/("""
									<font color="red">&bull; <i>"""),_display_(Seq[Any](/*103.39*/difference/*103.49*/.name)),format.raw/*103.54*/("""</i></font>  
								""")))}/*104.11*/else/*104.16*/{_display_(Seq[Any](format.raw/*104.17*/("""
									"""),_display_(Seq[Any](/*105.11*/if(difference.difftype.name == "Better")/*105.51*/ {_display_(Seq[Any](format.raw/*105.53*/("""
										<font color="green">&bull; <i>"""),_display_(Seq[Any](/*106.42*/difference/*106.52*/.name)),format.raw/*106.57*/("""</i></font>
									""")))}/*107.12*/else/*107.17*/{_display_(Seq[Any](format.raw/*107.18*/("""
										<font color="black">&bull; <i>"""),_display_(Seq[Any](/*108.42*/difference/*108.52*/.name)),format.raw/*108.57*/("""</i></font>
									""")))})),format.raw/*109.11*/("""
								""")))})),format.raw/*110.10*/("""
								
								</br>
							""")))})),format.raw/*113.9*/("""
                        </td>
						<td>
							"""),_display_(Seq[Any](/*116.9*/if(Bug.getFileFormat(bug) == null)/*116.43*/ {_display_(Seq[Any](format.raw/*116.45*/("""
								<em>-</em>
							""")))}/*118.10*/else/*118.15*/{_display_(Seq[Any](format.raw/*118.16*/("""
								"""),_display_(Seq[Any](/*119.10*/Bug/*119.13*/.getFileFormat(bug).name)),format.raw/*119.37*/("""
							""")))})),format.raw/*120.9*/("""
                        </td>
						<td>
							"""),_display_(Seq[Any](/*123.9*/if(Bug.getVersion(bug) == null)/*123.40*/ {_display_(Seq[Any](format.raw/*123.42*/("""
								<em>-</em>
							""")))}/*125.10*/else/*125.15*/{_display_(Seq[Any](format.raw/*125.16*/("""
								"""),_display_(Seq[Any](/*126.10*/Bug/*126.13*/.getVersion(bug).name)),format.raw/*126.34*/("""
							""")))})),format.raw/*127.9*/("""
                        </td>
						<td>
							"""),_display_(Seq[Any](/*130.9*/if(Bug.getDate(bug) == null)/*130.37*/ {_display_(Seq[Any](format.raw/*130.39*/("""
								<em>-</em>
							""")))}/*132.10*/else/*132.15*/{_display_(Seq[Any](format.raw/*132.16*/("""
								"""),_display_(Seq[Any](/*133.10*/Bug/*133.13*/.getDate(bug).name.format("dd MMM yyyy"))),format.raw/*133.53*/("""
							""")))})),format.raw/*134.9*/("""
                        </td>
                    </tr>
					
                """)))})),format.raw/*138.18*/("""

            </tbody>
        </table>

        <div id="pagination" class="pagination">
            <ul>
                """),_display_(Seq[Any](/*145.18*/if(currentPage.hasPrev)/*145.41*/ {_display_(Seq[Any](format.raw/*145.43*/("""
                    <li class="prev">
                        <a href=""""),_display_(Seq[Any](/*147.35*/link(currentPage.getPageIndex - 1, null))),format.raw/*147.75*/("""">&larr; Previous</a>
                    </li>
                """)))}/*149.19*/else/*149.24*/{_display_(Seq[Any](format.raw/*149.25*/("""
                    <li class="prev disabled">
                        <a>&larr; Previous</a>
                    </li>
                """)))})),format.raw/*153.18*/("""
                <li class="current">
                    <a>Displaying """),_display_(Seq[Any](/*155.36*/currentPage/*155.47*/.getDisplayXtoYofZ(" to "," of "))),format.raw/*155.80*/("""</a>
                </li>
                """),_display_(Seq[Any](/*157.18*/if(currentPage.hasNext)/*157.41*/ {_display_(Seq[Any](format.raw/*157.43*/("""
                    <li class="next">
                        <a href=""""),_display_(Seq[Any](/*159.35*/link(currentPage.getPageIndex + 1, null))),format.raw/*159.75*/("""">Next &rarr;</a>
                    </li>
                """)))}/*161.19*/else/*161.24*/{_display_(Seq[Any](format.raw/*161.25*/("""
                    <li class="next disabled">
                        <a>Next &rarr;</a>
                    </li>
                """)))})),format.raw/*165.18*/("""
            </ul>
        </div>
        
    """)))})),format.raw/*169.6*/("""
        
""")))})),format.raw/*171.2*/("""

            """))}
    }
    
    def render(currentPage:com.avaje.ebean.Page[Bug],currentSortBy:String,currentOrder:String,currentFilter:String): play.api.templates.Html = apply(currentPage,currentSortBy,currentOrder,currentFilter)
    
    def f:((com.avaje.ebean.Page[Bug],String,String,String) => play.api.templates.Html) = (currentPage,currentSortBy,currentOrder,currentFilter) => apply(currentPage,currentSortBy,currentOrder,currentFilter)
    
    def ref: this.type = this

}
                /*
                    -- GENERATED --
                    DATE: Tue Jul 23 11:40:04 EDT 2013
                    SOURCE: C:/Users/acarey/Desktop/andrewregressionsite/regressionsite/app/views/listBugs.scala.html
                    HASH: 0328cfbf7d05330cf87b456e6c97a328975e4e71
                    MATRIX: 766->1|935->961|949->967|1043->997|1097->1015|1109->1018|1148->1035|1193->1044|1227->1070|1315->1134|1373->1156|1407->1168|1446->1171|1473->1176|1513->243|1524->247|2063->775|2081->784|2170->109|2201->240|2230->772|2259->842|2293->958|2322->1194|2362->1199|2383->1211|2423->1213|2511->1265|2526->1271|2592->1314|2673->1359|2688->1365|2741->1396|2908->1527|2928->1538|2967->1555|3033->1586|3074->1618|3114->1620|3233->1703|3247->1708|3284->1723|3338->1746|3441->1813|3478->1828|3596->1910|3631->1923|3854->2111|3900->2148|3940->2150|4070->2263|4083->2268|4122->2269|4277->2388|4329->2418|4372->2426|4432->2464|4475->2472|4541->2516|4585->2525|4654->2572|4697->2580|4768->2629|4811->2637|4885->2689|5013->2781|5060->2812|5100->2814|5202->2880|5241->2897|5317->2937|5329->2940|5355->2943|5395->2946|5408->2949|5438->2956|5544->3026|5578->3051|5618->3053|5712->3129|5725->3134|5764->3135|5835->3170|5847->3173|5884->3188|5947->3219|6036->3272|6095->3314|6136->3316|6184->3327|6233->3366|6274->3368|6351->3408|6371->3418|6399->3423|6443->3448|6457->3453|6497->3454|6546->3466|6596->3506|6637->3508|6717->3551|6737->3561|6765->3566|6808->3590|6822->3595|6862->3596|6942->3639|6962->3649|6990->3654|7046->3677|7090->3688|7157->3723|7246->3776|7290->3810|7331->3812|7381->3843|7395->3848|7435->3849|7483->3860|7496->3863|7543->3887|7585->3897|7674->3950|7715->3981|7756->3983|7806->4014|7820->4019|7860->4020|7908->4031|7921->4034|7965->4055|8007->4065|8096->4118|8134->4146|8175->4148|8225->4179|8239->4184|8279->4185|8327->4196|8340->4199|8403->4239|8445->4249|8562->4333|8730->4464|8763->4487|8804->4489|8916->4564|8979->4604|9066->4672|9080->4677|9120->4678|9295->4820|9407->4895|9428->4906|9484->4939|9567->4985|9600->5008|9641->5010|9753->5085|9816->5125|9899->5189|9913->5194|9953->5195|10124->5333|10208->5385|10253->5398
                    LINES: 26->1|28->37|28->37|30->37|31->38|31->38|31->38|31->38|31->38|31->38|32->39|32->39|32->39|32->39|34->6|34->6|55->28|55->28|59->1|61->5|62->27|63->31|66->36|67->41|69->43|69->43|69->43|70->44|70->44|70->44|71->45|71->45|71->45|73->47|73->47|73->47|76->50|76->50|76->50|78->52|78->52|78->52|80->54|86->60|86->60|87->61|87->61|93->67|93->67|93->67|99->73|99->73|99->73|104->78|104->78|105->79|105->79|106->80|106->80|107->81|107->81|108->82|108->82|109->83|109->83|114->88|114->88|114->88|116->90|116->90|116->90|116->90|116->90|116->90|116->90|116->90|120->94|120->94|120->94|122->96|122->96|122->96|123->97|123->97|123->97|124->98|127->101|127->101|127->101|128->102|128->102|128->102|129->103|129->103|129->103|130->104|130->104|130->104|131->105|131->105|131->105|132->106|132->106|132->106|133->107|133->107|133->107|134->108|134->108|134->108|135->109|136->110|139->113|142->116|142->116|142->116|144->118|144->118|144->118|145->119|145->119|145->119|146->120|149->123|149->123|149->123|151->125|151->125|151->125|152->126|152->126|152->126|153->127|156->130|156->130|156->130|158->132|158->132|158->132|159->133|159->133|159->133|160->134|164->138|171->145|171->145|171->145|173->147|173->147|175->149|175->149|175->149|179->153|181->155|181->155|181->155|183->157|183->157|183->157|185->159|185->159|187->161|187->161|187->161|191->165|195->169|197->171
                    -- GENERATED --
                */
            