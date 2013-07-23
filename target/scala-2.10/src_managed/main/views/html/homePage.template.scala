
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
object homePage extends BaseScalaTemplate[play.api.templates.Html,Format[play.api.templates.Html]](play.api.templates.HtmlFormat) with play.api.templates.Template0[play.api.templates.Html] {

    /**/
    def apply():play.api.templates.Html = {
        _display_ {

Seq[Any](_display_(Seq[Any](/*1.2*/homeSkeleton/*1.14*/ {_display_(Seq[Any](format.raw/*1.16*/("""


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Snowbound Software Regression Testing Home Page</title>
<center><h1>Snowbound Software Regression Testing Home Page</h1> </center>
 
<!-- CSS dependencies -->
<link rel="stylesheet" type="text/css" href=""""),_display_(Seq[Any](/*12.47*/routes/*12.53*/.Assets.at("stylesheets/bootstrap.min.css"))),format.raw/*12.96*/("""">

</head>
<body>
 
<p>
 <input type = "button" value= "Search" class="btn primary" onclick= alert() >
 </p>
 
<!-- JS dependencies -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src=""""),_display_(Seq[Any](/*23.15*/routes/*23.21*/.Assets.at("js/bootstrap.min.js"))),format.raw/*23.54*/(""""></script>
 
<!-- bootbox code -->
<script src=""""),_display_(Seq[Any](/*26.15*/routes/*26.21*/.Assets.at("js/bootbox.min.js"))),format.raw/*26.52*/(""""></script>
<script>
function alert() """),format.raw/*28.18*/("""{"""),format.raw/*28.19*/("""
	bootbox.alert("Hello world!");
"""),format.raw/*30.1*/("""}"""),format.raw/*30.2*/("""

</script>
</body>
</html>

""")))})))}
    }
    
    def render(): play.api.templates.Html = apply()
    
    def f:(() => play.api.templates.Html) = () => apply()
    
    def ref: this.type = this

}
                /*
                    -- GENERATED --
                    DATE: Tue Jul 23 11:40:03 EDT 2013
                    SOURCE: C:/Users/acarey/Desktop/andrewregressionsite/regressionsite/app/views/homePage.scala.html
                    HASH: afa923ebe63330da731399a9787b1791df5ad13f
                    MATRIX: 799->1|819->13|858->15|1173->294|1188->300|1253->343|1540->594|1555->600|1610->633|1699->686|1714->692|1767->723|1835->763|1864->764|1926->799|1954->800
                    LINES: 29->1|29->1|29->1|40->12|40->12|40->12|51->23|51->23|51->23|54->26|54->26|54->26|56->28|56->28|58->30|58->30
                    -- GENERATED --
                */
            