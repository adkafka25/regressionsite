
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
object listRuns extends BaseScalaTemplate[play.api.templates.Html,Format[play.api.templates.Html]](play.api.templates.HtmlFormat) with play.api.templates.Template5[com.avaje.ebean.Page[Run],String,String,String,String,play.api.templates.Html] {

    /**/
    def apply/*1.2*/(currentPage: com.avaje.ebean.Page[Run], currentSortBy: String, currentOrder: String, currentFilter: String, filterBy:String):play.api.templates.Html = {
        _display_ {import controllers.routes.javascript._

def /*40.2*/header/*40.8*/(key:String, title:String):play.api.templates.Html = {_display_(

Seq[Any](format.raw/*40.38*/("""
    <th class=""""),_display_(Seq[Any](/*41.17*/key/*41.20*/.replace(".","_"))),format.raw/*41.37*/(""" header """),_display_(Seq[Any](/*41.46*/if(currentSortBy == key){/*41.72*/{if(currentOrder == "asc") "headerSortDown" else "headerSortUp"}})),format.raw/*41.136*/("""">
        <a href=""""),_display_(Seq[Any](/*42.19*/link(0, key, filterBy))),format.raw/*42.41*/("""">"""),_display_(Seq[Any](/*42.44*/title)),format.raw/*42.49*/("""</a>
    </th>
""")))};def /*8.2*/link/*8.6*/(newPage:Int, newSortBy:String, filterBy:String ) = {{
    
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
    routes.Application.listRun(newPage, sortBy, order, currentFilter, filterBy)
    
}};def /*31.2*/linkByRun/*31.11*/(runID:Long) = {{
routes.Application.getData(runID);

}};
Seq[Any](format.raw/*1.127*/("""

"""),format.raw/*4.1*/("""
"""),format.raw/*7.42*/("""
"""),format.raw/*29.2*/("""

"""),format.raw/*34.2*/("""


"""),format.raw/*39.37*/("""
"""),format.raw/*44.2*/("""



"""),_display_(Seq[Any](/*48.2*/homeSkeleton/*48.14*/ {_display_(Seq[Any](format.raw/*48.16*/("""
	 <link rel="stylesheet" type="text/css" href=""""),_display_(Seq[Any](/*49.49*/routes/*49.55*/.Assets.at("stylesheets/bootstrap.min.css"))),format.raw/*49.98*/("""">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    
		
    <h1 id="homeTitle">"""),_display_(Seq[Any](/*53.25*/currentPage/*53.36*/.getTotalRowCount)),format.raw/*53.53*/(""" Runs Found</h1>

    """),_display_(Seq[Any](/*55.6*/if(flash.containsKey("success"))/*55.38*/ {_display_(Seq[Any](format.raw/*55.40*/("""
        <div class="alert-message warning">
            <strong>Done!</strong> """),_display_(Seq[Any](/*57.37*/flash/*57.42*/.get("success"))),format.raw/*57.57*/("""
        </div>
    """)))})),format.raw/*59.6*/(""" 

<form>
	<select name="carey" id="ddlMyList">
			<option value="name">- Please Select -</option>
		"""),_display_(Seq[Any](/*64.4*/for(field <- Run.getSortFields ) yield /*64.36*/ {_display_(Seq[Any](format.raw/*64.38*/("""
			<option value= """),_display_(Seq[Any](/*65.20*/field/*65.25*/.getValue)),format.raw/*65.34*/(""" >"""),_display_(Seq[Any](/*65.37*/field/*65.42*/.getHeader)),format.raw/*65.52*/("""</option>
			""")))})),format.raw/*66.5*/("""
	</select>
	 <input type="search" id="bar" value=""""),_display_(Seq[Any](/*68.41*/currentFilter)),format.raw/*68.54*/("""" placeholder="Search for...">
	<input type = "button" value= "Search" class="btn primary" onclick = "NavigateToSite()"/>

<!-- JS dependencies -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>

 
<!-- bootbox code -->
<script src=""""),_display_(Seq[Any](/*76.15*/routes/*76.21*/.Assets.at("js/bootbox.min.js"))),format.raw/*76.52*/(""""></script>
<script>
function NavigateToSite() """),format.raw/*78.27*/("""{"""),format.raw/*78.28*/("""
	var ddl = document.getElementById("ddlMyList");
	var barInput = document.getElementById("bar").value;
	var selectedVal = ddl.options[ddl.selectedIndex].value;
//	window.location = selectedVal + "?f=" + textInput;
	window.location = jsRoutes.controllers.Application.listRun(0, "name","asc",barInput, selectedVal).url;
	
	
"""),format.raw/*86.1*/("""}"""),format.raw/*86.2*/("""
function VerifyDelete(id)"""),format.raw/*87.26*/("""{"""),format.raw/*87.27*/("""
		var del=confirm("Are you sure you would like to delete this run AND all pages associated with it (run id="+id+")?");
		if(del==true)"""),format.raw/*89.16*/("""{"""),format.raw/*89.17*/("""
			window.location = jsRoutes.controllers.Application.deleteRun(id).url ;
		"""),format.raw/*91.3*/("""}"""),format.raw/*91.4*/("""
"""),format.raw/*92.1*/("""}"""),format.raw/*92.2*/("""		
</script>



</form> 
	
    <div id="actions">
        
        <form action=""""),_display_(Seq[Any](/*101.24*/link(0, "format.name", "format.name"))),format.raw/*101.61*/("""" method="GET">
			<select name="f">
				<option value="" >Please Select by File Format </option>option>
			"""),_display_(Seq[Any](/*104.5*/for(file <- FileFormat.getList ) yield /*104.37*/ {_display_(Seq[Any](format.raw/*104.39*/("""
				<option value= """),_display_(Seq[Any](/*105.21*/file/*105.25*/.name)),format.raw/*105.30*/(""" >"""),_display_(Seq[Any](/*105.33*/file/*105.37*/.name)),format.raw/*105.42*/("""</option>
				""")))})),format.raw/*106.6*/("""
			</select> 
			<input type="submit" id="searchsubmit" value="Search by File Fomat" class="btn primary">
        </form>
        
    </div>
    
    
    """),_display_(Seq[Any](/*114.6*/if(currentPage.getTotalRowCount == 0)/*114.43*/ {_display_(Seq[Any](format.raw/*114.45*/("""
        
        <div class="well">
            <em>Nothing to display</em>
        </div>
        
    """)))}/*120.7*/else/*120.12*/{_display_(Seq[Any](format.raw/*120.13*/("""
        
        <table class="run zebra-striped">
            <thead>
                <tr>
                    """),_display_(Seq[Any](/*125.22*/header("name", "Run Name"))),format.raw/*125.48*/("""
                    """),_display_(Seq[Any](/*126.22*/header("version.name", "Version"))),format.raw/*126.55*/("""
                    """),_display_(Seq[Any](/*127.22*/header("format.name", "Format"))),format.raw/*127.53*/("""
					"""),_display_(Seq[Any](/*128.7*/header("date.name", "Date"))),format.raw/*128.34*/("""
                    """),_display_(Seq[Any](/*129.22*/header("svn.num", "SVN"))),format.raw/*129.46*/("""
                    """),_display_(Seq[Any](/*130.22*/header("performance.time", "Performance Time"))),format.raw/*130.68*/("""
                </tr>
            </thead>
            <tbody>

                """),_display_(Seq[Any](/*135.18*/for(run <- currentPage.getList) yield /*135.49*/ {_display_(Seq[Any](format.raw/*135.51*/("""
                    <tr>
                        <td><a href=""""),_display_(Seq[Any](/*137.39*/linkByRun(run.id))),format.raw/*137.56*/("""" title="View all Run Information from """),_display_(Seq[Any](/*137.96*/run/*137.99*/.name)),format.raw/*137.104*/("""">"""),_display_(Seq[Any](/*137.107*/run/*137.110*/.name)),format.raw/*137.115*/("""</a> 
							<span style="float: right"><img onclick="VerifyDelete("""),_display_(Seq[Any](/*138.63*/run/*138.66*/.id)),format.raw/*138.69*/(""")" src=""""),_display_(Seq[Any](/*138.78*/routes/*138.84*/.Assets.at("images/delete.png"))),format.raw/*138.115*/("""" alt="Delete"></span>
						</td>
						<td>
                            """),_display_(Seq[Any](/*141.30*/if(run.version == null)/*141.53*/ {_display_(Seq[Any](format.raw/*141.55*/("""
                                <em>-</em>
                            """)))}/*143.31*/else/*143.36*/{_display_(Seq[Any](format.raw/*143.37*/("""
                                """),_display_(Seq[Any](/*144.34*/run/*144.37*/.version.name)),format.raw/*144.50*/(""" of """),_display_(Seq[Any](/*144.55*/run/*144.58*/.version.platform.name)),format.raw/*144.80*/("""
                            """)))})),format.raw/*145.30*/("""
                        </td>
                        <td>
                            """),_display_(Seq[Any](/*148.30*/if(run.format == null)/*148.52*/ {_display_(Seq[Any](format.raw/*148.54*/("""
                                <em>-</em>
                            """)))}/*150.31*/else/*150.36*/{_display_(Seq[Any](format.raw/*150.37*/("""
                                """),_display_(Seq[Any](/*151.34*/run/*151.37*/.format.name)),format.raw/*151.49*/("""
                            """)))})),format.raw/*152.30*/("""
                        </td>
						<td>
                            """),_display_(Seq[Any](/*155.30*/if(run.date == null)/*155.50*/ {_display_(Seq[Any](format.raw/*155.52*/("""
                                <em>-</em>
                            """)))}/*157.31*/else/*157.36*/{_display_(Seq[Any](format.raw/*157.37*/("""
                            
                                """),_display_(Seq[Any](/*159.34*/run/*159.37*/.date.name.format("dd MMM yyyy"))),format.raw/*159.69*/("""
                            """)))})),format.raw/*160.30*/("""
                        </td>
						<td>
                            """),_display_(Seq[Any](/*163.30*/if(run.svn == null)/*163.49*/ {_display_(Seq[Any](format.raw/*163.51*/("""
                                <em>-</em>
                            """)))}/*165.31*/else/*165.36*/{_display_(Seq[Any](format.raw/*165.37*/("""
                                """),_display_(Seq[Any](/*166.34*/run/*166.37*/.svn.num)),format.raw/*166.45*/("""
                            """)))})),format.raw/*167.30*/("""
                        </td>
						<td>
                            """),_display_(Seq[Any](/*170.30*/if(run.performance == null)/*170.57*/ {_display_(Seq[Any](format.raw/*170.59*/("""
                                <em>-</em>
                            """)))}/*172.31*/else/*172.36*/{_display_(Seq[Any](format.raw/*172.37*/("""
                                """),_display_(Seq[Any](/*173.34*/run/*173.37*/.performance.time.format("hh:mm:ss"))),format.raw/*173.73*/("""
                            """)))})),format.raw/*174.30*/("""
                        </td>
                    </tr>
                """)))})),format.raw/*177.18*/("""

            </tbody>
        </table>

        <div id="pagination" class="pagination">
            <ul>
                """),_display_(Seq[Any](/*184.18*/if(currentPage.hasPrev)/*184.41*/ {_display_(Seq[Any](format.raw/*184.43*/("""
                    <li class="prev">
                        <a href=""""),_display_(Seq[Any](/*186.35*/link(currentPage.getPageIndex - 1, null, filterBy))),format.raw/*186.85*/("""">&larr; Previous</a>
                    </li>
                """)))}/*188.19*/else/*188.24*/{_display_(Seq[Any](format.raw/*188.25*/("""
                    <li class="prev disabled">
                        <a>&larr; Previous</a>
                    </li>
                """)))})),format.raw/*192.18*/("""
                <li class="current">
                    <a>Displaying """),_display_(Seq[Any](/*194.36*/currentPage/*194.47*/.getDisplayXtoYofZ(" to "," of "))),format.raw/*194.80*/("""</a>
                </li>
                """),_display_(Seq[Any](/*196.18*/if(currentPage.hasNext)/*196.41*/ {_display_(Seq[Any](format.raw/*196.43*/("""
                    <li class="next">
                        <a href=""""),_display_(Seq[Any](/*198.35*/link(currentPage.getPageIndex + 1, null, filterBy))),format.raw/*198.85*/("""">Next &rarr;</a>
                    </li>
                """)))}/*200.19*/else/*200.24*/{_display_(Seq[Any](format.raw/*200.25*/("""
                    <li class="next disabled">
                        <a>Next &rarr;</a>
                    </li>
                """)))})),format.raw/*204.18*/("""
            </ul>
        </div>
        
    """)))})),format.raw/*208.6*/("""
      
""")))})),format.raw/*210.2*/("""

            """))}
    }
    
    def render(currentPage:com.avaje.ebean.Page[Run],currentSortBy:String,currentOrder:String,currentFilter:String,filterBy:String): play.api.templates.Html = apply(currentPage,currentSortBy,currentOrder,currentFilter,filterBy)
    
    def f:((com.avaje.ebean.Page[Run],String,String,String,String) => play.api.templates.Html) = (currentPage,currentSortBy,currentOrder,currentFilter,filterBy) => apply(currentPage,currentSortBy,currentOrder,currentFilter,filterBy)
    
    def ref: this.type = this

}
                /*
                    -- GENERATED --
                    DATE: Tue Jul 23 11:40:04 EDT 2013
                    SOURCE: C:/Users/acarey/Desktop/andrewregressionsite/regressionsite/app/views/listRuns.scala.html
                    HASH: 301262d3564f52aad0dea060c0395c12f55d13b3
                    MATRIX: 773->1|999->1051|1013->1057|1107->1087|1161->1105|1173->1108|1212->1125|1257->1134|1291->1160|1379->1224|1437->1246|1481->1268|1520->1271|1547->1276|1587->303|1598->307|2165->865|2183->874|2272->126|2302->171|2331->300|2360->860|2391->932|2425->1048|2454->1294|2498->1303|2519->1315|2559->1317|2645->1367|2660->1373|2725->1416|2893->1548|2913->1559|2952->1576|3012->1601|3053->1633|3093->1635|3212->1718|3226->1723|3263->1738|3317->1761|3459->1868|3507->1900|3547->1902|3604->1923|3618->1928|3649->1937|3688->1940|3702->1945|3734->1955|3780->1970|3870->2024|3905->2037|4225->2321|4240->2327|4293->2358|4370->2407|4399->2408|4757->2739|4785->2740|4840->2767|4869->2768|5034->2905|5063->2906|5169->2985|5197->2986|5226->2988|5254->2989|5382->3080|5442->3117|5590->3229|5639->3261|5680->3263|5739->3285|5753->3289|5781->3294|5821->3297|5835->3301|5863->3306|5911->3322|6113->3488|6160->3525|6201->3527|6332->3640|6346->3645|6386->3646|6542->3765|6591->3791|6651->3814|6707->3847|6767->3870|6821->3901|6865->3909|6915->3936|6975->3959|7022->3983|7082->4006|7151->4052|7275->4139|7323->4170|7364->4172|7467->4238|7507->4255|7584->4295|7597->4298|7626->4303|7667->4306|7681->4309|7710->4314|7816->4383|7829->4386|7855->4389|7901->4398|7917->4404|7972->4435|8087->4513|8120->4536|8161->4538|8256->4614|8270->4619|8310->4620|8382->4655|8395->4658|8431->4671|8473->4676|8486->4679|8531->4701|8595->4732|8724->4824|8756->4846|8797->4848|8892->4924|8906->4929|8946->4930|9018->4965|9031->4968|9066->4980|9130->5011|9241->5085|9271->5105|9312->5107|9407->5183|9421->5188|9461->5189|9563->5254|9576->5257|9631->5289|9695->5320|9806->5394|9835->5413|9876->5415|9971->5491|9985->5496|10025->5497|10097->5532|10110->5535|10141->5543|10205->5574|10316->5648|10353->5675|10394->5677|10489->5753|10503->5758|10543->5759|10615->5794|10628->5797|10687->5833|10751->5864|10861->5941|11029->6072|11062->6095|11103->6097|11215->6172|11288->6222|11375->6290|11389->6295|11429->6296|11604->6438|11716->6513|11737->6524|11793->6557|11876->6603|11909->6626|11950->6628|12062->6703|12135->6753|12218->6817|12232->6822|12272->6823|12443->6961|12527->7013|12570->7024
                    LINES: 26->1|29->40|29->40|31->40|32->41|32->41|32->41|32->41|32->41|32->41|33->42|33->42|33->42|33->42|35->8|35->8|56->31|56->31|60->1|62->4|63->7|64->29|66->34|69->39|70->44|74->48|74->48|74->48|75->49|75->49|75->49|79->53|79->53|79->53|81->55|81->55|81->55|83->57|83->57|83->57|85->59|90->64|90->64|90->64|91->65|91->65|91->65|91->65|91->65|91->65|92->66|94->68|94->68|102->76|102->76|102->76|104->78|104->78|112->86|112->86|113->87|113->87|115->89|115->89|117->91|117->91|118->92|118->92|127->101|127->101|130->104|130->104|130->104|131->105|131->105|131->105|131->105|131->105|131->105|132->106|140->114|140->114|140->114|146->120|146->120|146->120|151->125|151->125|152->126|152->126|153->127|153->127|154->128|154->128|155->129|155->129|156->130|156->130|161->135|161->135|161->135|163->137|163->137|163->137|163->137|163->137|163->137|163->137|163->137|164->138|164->138|164->138|164->138|164->138|164->138|167->141|167->141|167->141|169->143|169->143|169->143|170->144|170->144|170->144|170->144|170->144|170->144|171->145|174->148|174->148|174->148|176->150|176->150|176->150|177->151|177->151|177->151|178->152|181->155|181->155|181->155|183->157|183->157|183->157|185->159|185->159|185->159|186->160|189->163|189->163|189->163|191->165|191->165|191->165|192->166|192->166|192->166|193->167|196->170|196->170|196->170|198->172|198->172|198->172|199->173|199->173|199->173|200->174|203->177|210->184|210->184|210->184|212->186|212->186|214->188|214->188|214->188|218->192|220->194|220->194|220->194|222->196|222->196|222->196|224->198|224->198|226->200|226->200|226->200|230->204|234->208|236->210
                    -- GENERATED --
                */
            