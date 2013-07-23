
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
object twitterBootstrapInput extends BaseScalaTemplate[play.api.templates.Html,Format[play.api.templates.Html]](play.api.templates.HtmlFormat) with play.api.templates.Template1[helper.FieldElements,play.api.templates.Html] {

    /**/
    def apply/*1.2*/(elements: helper.FieldElements):play.api.templates.Html = {
        _display_ {

Seq[Any](format.raw/*1.34*/("""

"""),format.raw/*5.52*/("""
<div class="clearfix """),_display_(Seq[Any](/*6.23*/if(elements.hasErrors)/*6.45*/ {_display_(Seq[Any](format.raw/*6.47*/("""error""")))})),format.raw/*6.53*/("""">
    <label for=""""),_display_(Seq[Any](/*7.18*/elements/*7.26*/.id)),format.raw/*7.29*/("""">"""),_display_(Seq[Any](/*7.32*/elements/*7.40*/.label)),format.raw/*7.46*/("""</label>
    <div class="input">
        """),_display_(Seq[Any](/*9.10*/elements/*9.18*/.input)),format.raw/*9.24*/("""
        <span class="help-inline">"""),_display_(Seq[Any](/*10.36*/elements/*10.44*/.infos.mkString(", "))),format.raw/*10.65*/("""</span> 
    </div>
</div>
"""))}
    }
    
    def render(elements:helper.FieldElements): play.api.templates.Html = apply(elements)
    
    def f:((helper.FieldElements) => play.api.templates.Html) = (elements) => apply(elements)
    
    def ref: this.type = this

}
                /*
                    -- GENERATED --
                    DATE: Tue Jul 23 11:40:05 EDT 2013
                    SOURCE: C:/Users/acarey/Desktop/andrewregressionsite/regressionsite/app/views/twitterBootstrapInput.scala.html
                    HASH: 3f1d21c813af9bc1467d0f6f9a7bcffcd6473bdf
                    MATRIX: 753->1|862->33|893->194|952->218|982->240|1021->242|1058->248|1114->269|1130->277|1154->280|1192->283|1208->291|1235->297|1314->341|1330->349|1357->355|1430->392|1447->400|1490->421
                    LINES: 26->1|29->1|31->5|32->6|32->6|32->6|32->6|33->7|33->7|33->7|33->7|33->7|33->7|35->9|35->9|35->9|36->10|36->10|36->10
                    -- GENERATED --
                */
            