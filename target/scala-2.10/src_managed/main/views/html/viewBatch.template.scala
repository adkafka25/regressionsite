
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
object viewBatch extends BaseScalaTemplate[play.api.templates.Html,Format[play.api.templates.Html]](play.api.templates.HtmlFormat) with play.api.templates.Template1[String,play.api.templates.Html] {

    /**/
    def apply/*1.2*/(batchScript: String):play.api.templates.Html = {
        _display_ {import controllers.routes.javascript._

def /*8.2*/log/*8.5*/(logInfo:String) = {{
    
def replace = logInfo.replaceAll(_, _)

var logInfoFixed=replace("INFO:","<br/><font color=\"green\">INFO:</font>") replace("ERROR:","<br/><font color=\"red\">ERROR:</font>")

    //Output
    logInfoFixed
    
}};
Seq[Any](format.raw/*1.23*/("""

"""),format.raw/*4.1*/("""
"""),format.raw/*7.30*/("""
"""),format.raw/*17.2*/("""

"""),_display_(Seq[Any](/*19.2*/homeSkeleton/*19.14*/ {_display_(Seq[Any](format.raw/*19.16*/("""
<script type="text/javascript" src=""""),_display_(Seq[Any](/*20.38*/routes/*20.44*/.Application.javascriptRoutes())),format.raw/*20.75*/(""""></script>
<script language="JavaScript">
	function CopyToClipboard() """),format.raw/*22.29*/("""{"""),format.raw/*22.30*/("""
		text=document.getElementById("code").innerHTML;
		
		window.prompt("Copy to clipboard: Ctrl+C, Enter", text);
		
		return false;
	"""),format.raw/*28.2*/("""}"""),format.raw/*28.3*/("""
	function submitForm()"""),format.raw/*29.23*/("""{"""),format.raw/*29.24*/("""
		//Get content
		text=document.getElementById("code").innerHTML;
		//set as value of input
		document.getElementById("content").value=text;
		//submit
		document.download.submit;
	"""),format.raw/*36.2*/("""}"""),format.raw/*36.3*/("""
</script>

	<H1>Code for run</H1>
	 <form name=download action=""""),_display_(Seq[Any](/*40.32*/routes/*40.38*/.NewRun.downloadBatch())),format.raw/*40.61*/("""" method="POST" >
	 
        <div class="actions">
            <button class="btn" onclick="return CopyToClipboard()">Copy to Clipboard</button> or
			<input type="submit" value="Download .Bat" class="btn primary" onclick='return submitForm()'>
        </div>	 
		
        <fieldset>
			<div class="clearfix">
				<div class="input codebox">
					<input id="content" type="hidden" value="empty" name="content" required>
					<pre id="code">
"""),_display_(Seq[Any](/*52.2*/batchScript)),format.raw/*52.13*/("""
					</pre>
				</div>
			</div>
        </fieldset>
		
        
    </form>
	
""")))})),format.raw/*61.2*/("""
"""))}
    }
    
    def render(batchScript:String): play.api.templates.Html = apply(batchScript)
    
    def f:((String) => play.api.templates.Html) = (batchScript) => apply(batchScript)
    
    def ref: this.type = this

}
                /*
                    -- GENERATED --
                    DATE: Tue Jul 23 11:40:05 EDT 2013
                    SOURCE: C:/Users/acarey/Desktop/andrewregressionsite/regressionsite/app/views/viewBatch.scala.html
                    HASH: c7ce92f9bb2c6977466c669a725851a327d878aa
                    MATRIX: 727->1|848->161|858->164|1136->22|1166->67|1195->158|1224->412|1264->417|1285->429|1325->431|1400->470|1415->476|1468->507|1569->580|1598->581|1764->720|1792->721|1844->745|1873->746|2089->935|2117->936|2223->1006|2238->1012|2283->1035|2772->1489|2805->1500|2926->1590
                    LINES: 26->1|29->8|29->8|39->1|41->4|42->7|43->17|45->19|45->19|45->19|46->20|46->20|46->20|48->22|48->22|54->28|54->28|55->29|55->29|62->36|62->36|66->40|66->40|66->40|78->52|78->52|87->61
                    -- GENERATED --
                */
            